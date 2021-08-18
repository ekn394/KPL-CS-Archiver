#! /bin/bash
clear

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


me=$(whoami)

echo KPL - Commons Studio Archiver

echo The flashing cursor below means that it is thinking.  
echo This will take some time.
echo "To stop te process and exit hit control-c  (no, not 'command-c', 'control-c')"
#echo ${me}_projects.txt 
echo Searching for GarageBand Files;
echo "Garage Band Files"> ${me}_projects.txt;
(find / -name "*.band*" >> ${me}_projects.txt 2> /dev/null );
echo "";
echo Searching for Premiere Pro Files;
echo "Premiere Pro Files">> ${me}_projects.txt;
(find / -name "*.prproj*" >> ${me}_projects.txt 2> /dev/null);
echo Finished;
echo Find the appropriate text file ${me}_projects.txt;


