# Commons Studio Archive Project"
# Evan Nordquist 
# July 2021

# Import modules and declare global variables

import fnmatch

text_file = "mcc1-prproj-list.txt"  # This is the file to be cleaned up. 
#TODO make this variable an argument that can be passed in to the program from the terminal. 

target = "."  #The program will search for the final '.'
backupTarget = "-" # The program will search for the final '-' in special cases. 
pattern = "*-?.*"  # filename - hyphen - number - dot - extension
content = "" 

# Helper functions

def findLastIndexByString(str, targetString):
    index = str.rfind(targetString)
    return index

# The Main function 

def main():
    with open(text_file) as f:
        content = f.readlines()
    lastOccuranceList = []
    outputList = ""  # Where we will output our new list. 
    for item in content:
        if(fnmatch.fnmatch(item, pattern)):
            '''If format is fileName-hyphen-number.filetype,
            cut off the name at the hyphen.'''
            index = findLastIndexByString(item, backupTarget)
        else:
            index = findLastIndexByString(item, target)
            """In other cases, cut off the file at the file extension"""
        lastOccuranceList.append(index) # Get the index of where we will cut off the file name 
        outputList+= item[:index] +"\n" # Append the text of this line, only up to that index.  Append a newline character. 
        
    cleaned = ('\n'.join(sorted(set(outputList.split('\n')))))
    # Split the string up by lines, remove duplicates with using set(), and finally, rejoin that list items again with '\n' again. 
    print(cleaned)
    return cleaned

#Run the program
main()
