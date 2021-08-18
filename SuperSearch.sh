#! /bin/bash

# Created by Evan Nordquist
# August 2021
# Purpose: Scan through all drives and create an inventory of project files. 
# Project Files could be from Photoshop, Premiere Pro, Garageband, Final Cut Pro, etc. 

clear

graphics(){

echo "                                            .....                           "    
echo "                                       .::::;,'...                          "
echo "                    ..                .;::::::::::;,'.                      "
echo "                 .,:cc:.              '::::::::::::::;.                     "
echo "               .,cllllll;.           .;::::::::::::::'                      "
echo "             .;clllllllllc'         .'::::::::::::::,                       "
echo "           .:llllllllllllll;.      .,;:::::::::::::;.                       "
echo "          .cllllllllllllllllc,.    ,c:::::::::::::;.                        "
echo "           ':lllllllllllllllll:.  .;::::::::::::::'                         "
echo "            .':lllllllllllllllll;.,::::::::::::::,                          "
echo "               ':lllllllllllllllll::::::::::::::;.        ......'''.        "
echo "                .'cllllllllllllll:;;;:::::::::::'. .....''''......'.        "
echo "                  .'clllllllllllc:;;;;;:::::::;;'''''..............'.       "
echo "                    .'clllllllollcclllol:::::;,....................'.       "
echo "                   ..';oddxxxkkkkOOOO0kl:::::,'.....................'.      "
echo "       ....';:cclodkkOOO0000000000000Od:::::;'......................'.      "
echo "    .cdxkkOO0000000000000000000OOOkkkdc::::;'.....................'.'.      "
echo "    'k0000000000000000000000Oxoooollllcc::;'...........''''..........       "
echo "    .o0000000000000000000000x:',:clllllcc:,....'';;'......                  "
echo "     :O00000000000000000000kc'..';cllllllc:::ccccll;.                       "
echo "     .d0000000000000000000Oo,''',,;cccllllllllllllllc;.                     "
echo "      cO0000000000OOkdlc:;c:,,,,,,,;;:clllllllllllllllc;.                   "
echo "      'x000OOxdlc;,..    .,;,,,,,,,,,;;:llllllllllllllllc;.                 "
echo "       '::,'..          .,;,;,,;,,,,,,;;;cllllllllllllllllc;.               "
echo "                        ';,,,,,,,,,,;,;'..,cllllllllllllllllc;.             "
echo "                       .;;,,,,,,,,,,;;;.   .;lllllllllllllllllc'            "
echo "                      .,;,,,,,,,,,,,;;'      'clllllllllllllll:.            "
echo "                     .,;,,,,,,,,,,,;;,.       .,clllllllllll:.              "
echo "                     ';,,,,,,,,,,,,;;'          .:lllllllc;.                "
echo "                   .;,,,,,,,,,,,,;;,.            'clllc,.                   "
echo "                    .,;;;;,,,,,,,,;'.              .','.                    "
echo "                      ....',;;;;,;;.                                        "
echo "                            ....''.                                         "
}

spacer(){
echo ""
}

me=$(whoami)
echo Projects found on ${me} > ${me}_projects.txt;
graphics
echo Commons Studio - Inventory Helper 2000
spacer
echo The flashing cursor below means that the program is working.  
echo This will take some time.
spacer 
echo We will search for:
echo "	GarageBand files	(.band)"
echo "	Premiere Projects	(.prproj)"
echo "	Final Cut Projects	(.fcp)"
echo "	Flash Projects		(.fla)"
echo "	iMovie Projects		(.rcproject)"

spacer
echo "To cancel at any time, hit control-C"
spacer



for fileType in fla fcp band prproj rcproject
do
spacer >> ${me}_projects.txt;
echo ${fileType} Files >> ${me}_projects.txt;
echo "" >> ${me}_projects.txt;
echo Searching for .${fileType} files;
(find / -not -path "/Applications/*" -not -path "/Library/*" -name "*.${fileType}" >> ${me}_projects.txt 2> /dev/null );
spacer;
echo Finished searching for ${fileType} files;
echo Total projects found so far: $(wc -l ${me}_projects.txt)
spacer;
done;

echo Completed all searches.;
spacer
echo You can find the results in the text file named ${me}_projects.txt;
spacer

