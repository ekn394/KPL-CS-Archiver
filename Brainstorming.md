# Thinking out loud

Let's say we wanted to find all the Garage Band files accross all of the mounted hard drives, and save the names of those projects (and their file paths) into a text file. 

**find / -name "\*.band\*" > mcc1-garage-band-list.txt**

This will **find**,  starting at the root directory "/" (which will include all hard drives downstream), any file that contains the characters ".band" anywhere in the file name.  
All of the matches will be written to the text file namded at the end of the command.   

### Types of files to search for
.band   Garage Band
.prpoj  Premiere Projects
.fcp    Final Cut Pro
.MOV    Movie Files
.mp4    Mpeg 
