###Thinking out loud###

Let's say we wanted to find all the Garage Band files accross all of the mounted hard drives, and save the names of those projects (and their file paths) into a text file. 

**find / -name "\*.band\*" > mcc1-garage-band-list.txt**

This will **find**,  starting at the root directory "/" (which will include all hard drives downstream), any file that contains the characters ".band" anywhere in the file name.  
All the matches will be written to the given text file.   


###Types of files to search for###
