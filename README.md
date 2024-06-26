# Secrets of Grindea - Phase Off

An AutoHotkey script to complete the Secrets of Grindea "Phase-Off" course in under 20 seconds.
Specifically, this script is able to achieve a clear time of roughly 14.10 seconds depending on several factors.
The fastest recorded was 14.03 seconds, while the slowest was 14.16 seconds.

[You can find a video of the script in action here](https://youtu.be/9otD3gZgFZA).

Based on [the route from YouTube channel *Chaldo* and their 14.19 second clear time](https://youtu.be/0fyMZx7T2Kk).

## Access the Phase Off Quest

Details can also be found on the [quest's page in the wiki](https://secretsofgrindea.fandom.com/wiki/Phase-Off)
(although it seems to be unmaintained at time of writing; the 1.0 release day).

1. Progress through the main story and get the Twi-Sight ability to see ghosts (early into The Lost Ship)
2. Go to the graveyard in the Pumpkin Woods (where you enlisted the help of the Bishop to break the curse
   trapping you there much earlier in the story)
3. Activate Twi-Sight and talk to Tannie's ghost in front of one of the graves, receiving the quest
4. Follow her directions to the secret Trick Phase course (go all the way right starting from the lobby of the Flying Fortress)

## Setup and Running the Script

1. Download AutoHotkey v2 from [their website](https://www.autohotkey.com/)
2. Run the `phase-off.ahk` script to set up the hotkey
3. In Secrets of Grindea, attempt the course and then fail it so that you are teleported right in the middle of the phase plate.
   This is necessary to ensure a consistent starting location for the script to use, which helps it line up the correct timings.
4. Execute the hotkey (default is `Ctrl` + `n`)
5. If your character immediately goes to exit of the room in the bottom right, then it's working!
6. Take your hands off your keyboard, sit back, and watch the script complete the course

### Incorrect Timing

You may find that, even after following the instructions above, the script has the wrong timings and completely fails the course.
This is an expected fault in the script since your load times are probably not the same as mine, and there isn't really a way
to automatically detect the right amount of waiting before actually starting the course. The value in the script by default is
just whatever value I found that worked for me. There was no real method to figuring out this number; I just played around with
it until it worked!

This issue can be solved in the same way on your end; by playing around with this number on line 68 of the script:

```autohotkey
; Start the course with correct timing; a slight delay after the 1st spinning barrel points up
Frames(143)	; NOTE: Some users may need to change this value if they find their timing is off
```

This is the amount of time that your character waits on top of the initial phase plate before getting fired into the first barrel
of the course. Check the [video of how it runs on my computer](https://youtu.be/9otD3gZgFZA) and compare the loading time to your
own game. Does it feel like your game takes longer to load than what you see in the video? Then increase the number. Decrease it
if your game loads even faster than what you see in the video. Keep in mind that this number is measured in frames, where
each frame is 1/60 of a second (~0.0167 seconds per frame), so you can probably start by changing it in increments of 15-20
and see how that affects your results.

That should *theoretically* be the only number you have to change. However, you may also need to edit line 54 as well if your
character doesn't even make it back to the initial phase plate to start the course:

```autohotkey
Frames(60)	; Wait for loading chamber entrance
```

## Why?

I originally started working on this because I was having a very hard time getting the timing down to complete
the course the legitimate way. After a combined ~4 hours of attempts across multiple sessions, I was feeling pretty defeated.
My reflexes and hand-eye coordination are generally below average (a consistent source of struggle through my ~15 years of gaming)
which makes tight timing puzzles like this functionally impossible for me to complete. I'm a better programmer than I am a gamer,
so I figured I'd try automating it instead! :D

*I highly suggest you give the course a good and honest attempt before resorting to this script*. Working towards a goal
through dedication and practice is a far more rewarding experience! This should be treated as an **absolute last resort**
for if you are physically incapable of completing the course (like me) but still want 100% completion.

