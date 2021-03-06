#! /bin/bash

# Created by Evan Nordquist
# August 2021
# Purpose: Scan through hard drives to create an inventory of project files. 
# Project Files could be files associated with Photoshop, Premiere Pro, Garageband, Final Cut Pro, etc. 


####################
# Set up Variables #
####################

me=$(hostname) # The name of the device
search_from=($HOME /Volumes) # Starting directories for the search
keywords=(prproj fcp fla rcproject band psd)
output_html=${me}_projects.html # output html file
output_txt=${me}_projects.txt # output text file


####################
# Helper Functions #
####################
function graphics(){

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

function spacer(){
echo ""
}

function intro(){
clear
graphics
echo Commons Studio - Inventory Helper 2000
spacer
echo We will search for:	
echo "	Premiere Projects	(.prproj)"
echo "	Final Cut Projects	(.fcp)"
echo "	Flash Projects		(.fla)"
echo "	iMovie Projects		(.rcproject)"
echo "	GarageBand files        (.band)"
echo "	Photoshop files		(.psd)"
spacer
echo "To cancel at any time, hit control-C"
spacer
}

function outro(){
echo Completed all searches.;
spacer
echo You can find the results in the files listed below:
echo ${output_html};
echo ${output_txt};
spacer
}

function generateOutputFiles(){
echo Projects found on ${me} > ${output_txt};
echo "<h1>" Projects found on ${me}"</h1>" > ${output_html};
echo "<h2>" Legend "</h1>" >> ${output_html};
echo "  Premiere Projects (.prproj) <br>" >> ${output_html};
echo "  Final Cut Projects (.fcp) <br>" >> ${output_html};
echo "  Flash Projects ( .fla) <br>" >> ${output_html};
echo "  iMovie Projects (.rcproject) <br>" >> ${output_html};
echo "  GarageBand files (.band) <br>" >> ${output_html};
echo "  Photoshop files (.psd) <br>"  >> ${output_html};
}

####################
#    Main Logic    #
####################

intro
read -n 1 -s -r -p "Press any key to start"
spacer
generateOutputFiles
#for fileType in fla fcp band prproj rcproject
for fileType in ${keywords[@]};
do
spacer >> ${output_html};
spacer >> ${output_txt};
echo '<h2>' .${fileType} Files '</h2>' >> ${output_html};
echo ${fileType} Files >> ${output_txt};
spacer >> ${output_html};
spacer >> ${output_txt};
echo Searching for .${fileType} files;
for location in ${search_from[@]};
do 
	array=$(find ${location} -not -path "*/Applications/*" ! -name "*ntitled*" -not -path "*ExFat_Tnsfr/*" -not -name "*test*" -not -path "*/Library/*" -not -path "*Autosave*" -not -path "*Auto-Save*" -not -path "*Downloads*" -name "*.${fileType}" 2> /dev/null  | tr -d "[:blank:]");
	for item in ${array[@]}; 
	do
    		echo '<li>'${item}'</li>' >> ${output_html} ;
    		echo ${item} >> ${output_txt} ;
    		echo ${item}
	done;
done;
echo Finished searching for ${fileType} files;
spacer;
done;
graphics;
outro;
spacer;



# For future reference, other search methods. 
#(find / -not -path "/Applications/*" -not -path "/Library/*" -name "*.${fileType}" >> ${output_html} 2> /dev/null );
#echo (find / -not -path "/Applications/*" -not -path "/Library/*" -type f \( -name "*.txt" -o -name "*.py" \)  >> | tee ${output_html} 2> /dev/null ); 
