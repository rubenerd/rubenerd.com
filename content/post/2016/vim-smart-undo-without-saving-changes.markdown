---
title: "Vim’s smart undo without saving changes"
date: "2016-06-29T14:23:57+10:00"
year: "2016"
category: Software
tag:
- macvim
- vim
location: sydney
---
Vim keeps finding ways to surprise me, even after all these years. And yes emacsen, that's (generally) a positive! 

Say you're working in a typical editor and you do this:

1. Start a new text file
2. Enter some stuff
3. Hit undo a few times to get back
4. Close

What typically happens? You're asked if you want to save your changes. This despite the file being empty, and rolled back to an unedited state. Most editors must have a condition to say "if anything has been typed, set edited to true".

In Vim, the file is considered unedited again, and it closes without a prompt. This is the way it should be.

Contrast with this:

1. Start a new text file
2. Enter some stuff
3. Enter command mode and dd the line out
4. Close

Despite it being empty, the editor records that you still did something to the file, and it prompts you to write.

There could be case for even the latter to not prompt you, but I'll still take the former in the meantime.

