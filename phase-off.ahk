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

	Frames(143)
	Go()
	Frames(17)
	Go()
	Frames(25)
	Go()
	Frames(11)
	Go()
	; We are now in the bottom right spinning barrel.
	; We must wait for it to change direction to send us up-left.

	return
}

; vim: noet ts=4 sw=4

