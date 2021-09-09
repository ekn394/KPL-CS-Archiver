# Thinking out loud

The purpose of this Archiver program is to compile a list of **Projects** that are stored on each of the drives. 

As a starting point, we can search for file extensions that would accompany the types of projects we expect to be on the drives.

### Types of files to search for
<ul> 
  
  <li>Garage Band (.band) </li>
  <li>Premiere Projects (.prproj)</li>
  <li>Final Cut Pro (.fcp)</li>
  <li><strike>Movie (.MOV)</strike></li>
  <li><strike>Mpeg (.mp4) </strike></li>
  <li>Flash (.fla)</li>
  <li>iMovie (.rcproject)</li>
</ul>

Let's say we wanted to find all the Garage Band files accross all of the mounted hard drives, and save the resulting list of names (with their file paths) into one text file. 

**find / -name "\*.band\*" > mcc1-garage-band-list.txt 2> /dev/null**

This command will **find**,  starting at the root directory "/" (which will include all hard drives downstream), any filename that contains the characters ".band" anywhere in the file name and finally will write the resulting list of matches to the text file named at the end of the command.   
The '2> /dev/null' redirects warning messages (which happen to be signified by the number '2') to the "null folder" rather than to the default of clutter the output.  
There were quite a few un-helpful warning messages as we search through EVERY folder.  Every time we attempted to check a folder that we (as a normal user) didn't have appropriate access for, we would get an error message.  Since we are checking EVERY file, this would happen an unreasonable number of times so redirecting them into the ether was helpful at this time.  

### Clean up the data

The text file above will occasionally include multiple copies of the same project.  A clear example is the multiple autosave files that are created for Premiere Pro projects. 
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

### Next steps.  Make one shell script to run all of those searches in one command.  

Update: This is now accomplished by the shell script <a href="https://github.com/ekn394/KPL-CS-Archiver/blob/main/mac_inventory_helper.sh"> mac_inventory_helper.sh </a>.  

There is also a Windows equivalent shell script where the only change is where to start searching.  For Mac the external drives are all located at /Volumes, where on Windows, the drives can be found at /d /e /f  etc.  There is a variable for where to start the search that allows you to select multiple starting locations (multiple drives) if you name list their drive names /e /f separated by spaces.   

