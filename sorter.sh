#/bin/bash

file="image.jpg"
safety="SFW"
character="none"
extra=""
stashpath="/home/$USER/Pictures/Stash"
temp="" # To have a remember feature
path="" # Working directory path
type="blue archive"

clear

pwd
echo
echo "Type working directory path here."
echo "(Uses cd /home/\$USER/[Your path here])"
echo "If this path is fine press enter."
echo
read -p "Path: " -r path

if [[ -z $path ]]; then
  echo
else
  cd /home/$USER/$path
fi

clear
while true; do

# Target file
ls -p -1A | grep -v / # Lists all files in current folder (Does seem to also list subfolders)
echo
echo "Select file from above"
echo
read -p "Target file: " -r file
clear

kitten icat --place 60x20@0x0 *$file*

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

temp=$type
while true; do
echo "\"ba\" for Blue Archive"
echo "\"l\" to see available entries"
echo
read -p "Stash/" -r type

type=${type,,}

case "$type" in
  ba) type="blue archive"
    break
  ;;
  l|list)
    clear
    tree -L 1 $stashpath/
    echo
  ;;
  *) break
  ;;
esac
done

clear

kitten icat --place 60x20@0x0 *$file*

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

temp=$character

while true; do

# Character
echo
echo "Select folder (usually by character)"
echo "Will create a new folder if one is not found"
echo 
echo "To use last value press enter"
echo "Last value: $character"
echo
echo "l for list"
echo
read -p "Stash/$type/" character
echo 

if [[ -z $character ]]; then
  character=$temp
  break 
fi

case "$character" in
  list|l) clear
  tree -L 1 "$stashpath/$type/"
  ;;
  *) break 
  ;;
esac
done

character=${character,,}
clear

kitten icat --place 60x20@0x0 *$file*

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

temp=$safety

while true; do
# SFW or NSFW
echo
echo "SFW or NSFW?"
echo "\"s\" & \"n\" respectively"
echo
echo "To use last value press enter"
echo "Last value: $safety"
echo
read -p "Stash/$type/$character/" -r safety
echo

if [[ -z $safety ]]; then
  safety=$temp
  break
fi

safety=${safety,,}

case "$safety" in
  n) echo "NSFW"
    safety="NSFW"
    break
  ;;
  s) echo "SFW"
    safety="SFW"
    break
  ;;
  *) echo "Invalid input, try again."
  ;;
esac
done

safety=${safety^^} # Sets all Characters to uppercase
clear

kitten icat --place 60x20@0x0 *$file*

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

temp=$extra

# Extra arguments
echo
tree -d "$stashpath/$type/$character/$safety/"
echo
echo "Extra agruments?"
echo "Press enter if no"
echo
echo "To use last value input 1"
echo "Last value: $extra"
echo 
read -p "Stash/$type/$character/$safety/" -r extra

if [[ $safety = 1 ]]; then
  extra=$temp
fi

if [[ $character$safety = "ibukiNSFW" ]]; then
  echo "Error, this is an illegal entry, exiting..."
  exit "Cannot lewd Ibuki"
fi

mkdir -p "$stashpath/$type/$character/$safety/$extra"

# Move
if [[ -z $extra ]]; then
  mv *$file* "$stashpath/$type/$character/$safety/"
else
  mv *$file* "$stashpath/$type/$character/$safety/$extra/"
fi

clear
echo "done"
echo

done

