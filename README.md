# Secrets of Grindea - Phase Off

An AutoHotkey script to complete the Secrets of Grindea "Phase-Off" course in under 20 seconds.
Specifically, this script is able to achieve a clear time of roughly 14.10 seconds depending on several factors.
The fastest recorded was 14.03 seconds, while the slowest was 14.16 seconds.

Based on [the route from YouTube channel Chaldo and their 14.19 second clear time](https://youtu.be/0fyMZx7T2Kk).

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

## Why?

I originally started working on this because I was having a very hard time getting the timing down to complete
the course the legitimate way. After a combined ~4 hours of attempts across multiple sessions, I was feeling pretty defeated.
My reflexes and hand-eye coordination are generally below average (a consistent source of struggle through my ~15 years of gaming)
which makes tight timing puzzles like this functionally impossible for me to complete. I'm a better programmer than I am a gamer,
so I figured I'd try automating it instead! :D

*I highly suggest you give the course a good and honest attempt before resorting to this script*. Working towards a goal
through dedication and practice is a far more rewarding experience! This should be treated as an **absolute last resort**
for if you are physically incapable of completing the course (like me) but still want 100% completion.

