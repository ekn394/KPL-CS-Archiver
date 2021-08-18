# Thinking out loud

The purpose of this _Archive Helper_ is not to create a list of every file on all of the hard drives, the intention is to compile a list of 'Projects' that are stored on each of the drives. 

As a starting point, we can search for file extensions that we predict projects to have.

### Types of files to search for
<ul> 
  
  <li>.band     Garage Band </li>
  <li>.prproj    Premiere Projects </li>
  <li>.fcp      Final Cut Pro </li>
  <li><strike>.MOV      Movie Files </strike></li>
  <li><strike>.mp4      Mpeg  </strike></li>
  <li>.fla      Flash </li>
  <li>.rcproject  iMovie </li>
</ul>

Let's say we wanted to find all the Garage Band files accross all of the mounted hard drives, and save the resulting list of names (with their file paths) into one text file. 

**find / -name "\*.band\*" > mcc1-garage-band-list.txt 2> /dev/null**

This command will **find**,  starting at the root directory "/" (which will include all hard drives downstream), any filename that contains the characters ".band" anywhere in the file name and finally will write the resulting list of matches to the text file named at the end of the command.   
The 2> /dev/null sends warning messages away (rather than have them clutter the screen). 

### Clean up the data

The text file above will include multiples files for presumably the same project.  A clear example is the multiple autosave files that are created for Premiere Pro projects. 
Searching for .prproj files will find four hits for this one project.  

<ul>
  <li>.../evan/Adobe Premiere Pro Auto-Save/myProject-1.prproj</li>
  <li>.../evan/Adobe Premiere Pro Auto-Save/myProject-2.prproj</li>
  <li>.../evan/Adobe Premiere Pro Auto-Save/myProject-3.prproj</li>
  <li>.../evan/myProject.prproj</li>
</ul>

If we drop off the endings starting at the file extension, then we will be left with a large number of duplicate files that end in -1, -2, -3.
<br>
<a href="https://github.com/ekn394/KPL-Commons-Studio-Archive-Helper/blob/main/removeDuplicates.py"> A python program </a> was created to scrape away the endings of the files in different ways depending on the circumstances.  If the file ended in the format _hyphen-number-dot-fileType_, we would cut off the name at the hyphen.  Otherwise, as is the case with the myProject.prproj example above, cut off the file at the final '.' of the file type.

### Next steps.  Make one Shell script to run all of those searches in one command.  
Also Pro-Tip:  Instead of searching starting at the root/  if you start the search at /Users  then you don't get a bunch of Tutorial files that match the file type from the /Applications folder.  

**find /Users -name "\*.band\*" > mcc1-garage-band-list.txt 2> /dev/null**
