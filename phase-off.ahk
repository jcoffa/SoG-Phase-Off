#Requires AutoHotkey v2.0
#SingleInstance


; Waits for an amount of milliseconds equivalent to the number of frames given.
;
; Example: 7 frames at 60 fps
;	7 (frames) / 60 (frames/second) = 0.11666667 seconds
;	0.11666667 (seconds) * 1000 (milliseconds/second) = ~116.67 milliseconds
;
;	So 7 frames at 60 fps = ~116.67 milliseconds of waiting time
Frames(x, fps := 60) {
	Sleep x / fps * 1000
}


; Enter the input for interacting with a phase plate and getting fired out of a barrel.
;
; NOTE: there must be at least 1 frame of waiting between calls to this function!
; If it's executed many times (say, in a loop) without any waiting time, then many
; of the inputs will be lost. I've found 1 frame of waiting between calls to be enough
; to not lose any inputs (as far as I can tell)
Go() {
	Send "{z down}"
	Frames(2)	; Need a brief wait or else the game doesn't detect the input
	Send "{z up}"
}


; Spams the Go() command with 'wait' frame delay between each call until 'total_frames'
; frames have elapsed.
SpamGo(total_frames, wait := 1) {
	while total_frames > 0 {
		Go()
		Frames(wait)
		total_frames := total_frames - (2 + wait)	; 2 comes from the wait time in the Go() function
	}
}


; 1. Fail the course to return to normalized starting position on the phase plate
; 2. Execute hotkey to run

^n:: {
	Send "{Down down}{Right down}"
	Frames(43)	; Just enough time to hit the door
	Send "{Down up}{Right up}"
	Sleep 1000	; Not precise, just need to wait to exit the chamber
	; We are now standing outside the challenge chamber

	Send "{Up down}{Left down}"
	Frames(6)	; Just enough time to hit the door
	Send "{Up up}{Left up}"
	Frames(60)	; Wait for loading chamber entrance
	Send "{Up down}{Left down}"
	Frames(29)
	Send "{Left up}"
	Frames(5)
	Send "{Up up}"
	; We are now standing on top of the phase plate


	; NOTE: Travel time is included in the Frames() waiting time alongside any additional waiting
	; reasons described in each of the comments. If a comment does not list any other waiting
	; reason, then the waiting time is purely for travel time.

	; Start the course with correct timing; a slight delay after the 1st spinning barrel points up
	Frames(143)
	Go()

	; Fire out of the stationary barrel facing right
	Frames(17)
	Go()

	; Fire up-right out of the 1st spinning barrel into the stationary barrel facing down
	Frames(25)
	Go()

	; Dodge the moving block to enter the 2nd spinning barrel (bottom right)
	Frames(11)
	Go()	; 2:05

	; Wait for barrel to aim up-left to enter the 3rd spinning barrel (top middle)
	Frames(42)
	Go()

	; Wait for barrel to aim down-left and shoot into the mirror
	Frames(66)
	Go()

	; Wait for horizontally-moving barrel facing up to get into the right position to shoot past
	; the mirror
	Frames(74)
	Go()

	; Fire out the circular-moving barrel facing right to shoot into the bottom triangle mirror
	; so we can get past the electric shock
	Frames(34)
	Go()

	; Fire out the circular-moving barrel facing right to shoot into the top square mirror
	; now that we are past the electric shock
	Frames(52)
	Go()

	; Wait for the 2 circular-moving barrels to line up and then shoot out of the bottom one into
	; the top one so we can get past the electric shock
	Frames(52)
	Go()

	; Wait for the top circular-moving barrel to line up the triangle mirror
	Frames(70)
	Go()

	; Fire out the stationary barrel facing up-left to get into the horizontally-moving
	; spinning barrel
	Frames(42)
	Go()

	; Fire out the spinning barrel facing up-right to hit the triangle mirror and bounce into the
	; vertically-moving barrel facing left
	Frames(16)
	Go()

	; Fire out the vertically-moving barrel facing left into the stationary barrel facing up
	Frames(44)
	Go()

	; Fire out the stationary barrel facing up into the stationary barrel facing right while getting
	; past the two moving blocks
	Frames(26)
	Go()

	; Wait to line up with the vertically-moving barrel facing down-right
	Frames(54)
	Go()

	; Fire out the vertically-moving barrel into the square mirror and bounce into the upper
	; stationary barrel facing right to get past the electric shock
	Frames(16)
	Go()

	; Fire out the stationary barrel facing right into the vertically-moving barrel facing
	; down-right now that we're past the electric shock
	Frames(40)
	Go()

	; XXX HERE XXX
	; Fire out the vertically-moving barrel facing down-right into the spinning barrel
	Frames(14)
	Go()

	; Wait for spinning barrel to face up-right and fire into the stationary barrel facing up
	Frames(32)
	Go()

	; Wait for the blocks to move and now spam through the remaining 3 stationary barrels facing up!
	Frames(34)
	SpamGo(50)

	return
}

; vim: noet ts=4 sw=4 tw=100

