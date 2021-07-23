# Thinking out loud

The purpose of this _Archive Helper_ is not to create a list of every file on all of the hard drives, the intention is to compile a list of 'Projects' that are stored on each of the drives. 

As a starting point, we can search for file extensions that we predict projects to have.

### Types of files to search for
<ul>
  <li>.band   Garage Band </li>
  <li>.prpoj  Premiere Projects </li>
  <li>.fcp    Final Cut Pro </li>
  <li>.MOV    Movie Files </li>
  <li>.mp4    Mpeg  </li>
</ul>

Let's say we wanted to find all the Garage Band files accross all of the mounted hard drives, and save the resulting list of names (with their file paths) into one text file. 

**find / -name "\*.band\*" > mcc1-garage-band-list.txt**

This command will **find**,  starting at the root directory "/" (which will include all hard drives downstream), any file that contains the characters ".band" anywhere in the file name and finally will write the resulting list of matches to the text file named at the end of the command.   

