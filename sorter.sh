#/bin/bash

# Todo:
# Option to also copy
# Option to rename file before moving/copying
# maybe this: https://chatgpt.com/c/675c6dc2-eebc-8005-b006-7bb04c0b6bec

# Done:
# Made per question files
# better code quality
# more variables for better adaptability

# program file paths
folder="/home/$USER/.cache/sorter"
pathQuestion="pathquestion.sh"
imageViewer="view.sh"
targetFile="targetfile.sh"
safetyQuestion="safety.sh"
typeQuestion="typequestion.sh"
schoolQuestion="school.sh"
characterQuestion="characterquestion.sh"
extraQuestion="extraquestion.sh"
quickChoose="quick.sh"

file="image.jpg"
safety="SFW"
character="none"
extra=""
stashpath="/home/$USER/Pictures/Stash"
temp="" # Used for read variable (usually)
path="" # Working directory path
type="blue archive"
school="not specified"

update_paths() {
# Read paths
readWorkdir="path/"
readTargetFile="Target file: "
  readShowFile="File to show: "
readSafety="Stash/"
readType="Stash/$safety/"
  readSchool="Stash/$safety/$type/"
readCharacter="Stash/$safety/$type/$school/"
readExtra="Stash/$safety/$type/$school/$character/"

# Move paths
schoolMove="$stashpath/$safety/$type/$school/$character/"
schoolMoveExtra="$stashpath/$safety/$type/$school/$character/$extra"
withExtra="$stashpath/$safety/$type/$character/$extra"
noExtra="$stashpath/$safety/$type/$character/"

# tree paths
# these don't work so they are not currently in use
#treeTypeList="$stashpath/$safety/"
#treeSchoolList="$staspath/$safety/$type/"
#treeCraracterList="$stashpath/$safety/$type/"
#treeExtra="$stashpath/$safety/$type/$character/"
}
update_paths

if [[ -n "$1" ]]; then
  . $folder/$quickChoose
  exit
fi

clear

# path question program
. $folder/$pathQuestion
# $path set

while true; do

clear

# ask for target file
. $folder/$targetFile
# $file set

clear

# Image viewer
. $folder/$imageViewer

# Safety question
. $folder/$safetyQuestion
# $safety set
clear

# Image viewer
. $folder/$imageViewer

update_paths
# Type question
. $folder/$typeQuestion
# $type set

clear
update_paths

if [[ $type = "blue archive" ]]; then
  # Image viewer
  . $folder/$imageViewer
  
  . $folder/$schoolQuestion
  # $school set
fi

clear
update_paths

# Image viewer
. $folder/$imageViewer

# Character question
. $folder/$characterQuestion
# $character set

clear
update_paths

# Image viewer
. $folder/$imageViewer

# Extra args
. $folder/$extraQuestion
# $extra set

update_paths

# Checks
if [[ $character$safety = "ibukiNSFW" ]]; then
  echo "Error, this is an illegal entry, exiting..."
  exit "Cannot lewd Ibuki"
elif [[ $character$safety = "kokonaNSFW" ]]; then
  echo "Error, this is an illegal entry, exiting..."
  exit "Cannot lewd Kokona"
fi

# Make directory
if [[ $type = "blue archive" ]]; then
  mkdir -p "$schoolMoveExtra"
else
  mkdir -p "$withExtra"
fi


# Move
if [[ $type = "blue archive" ]]; then

  if [[ -z $extra ]]; then
    mv *$file* "$schoolMove"
  else
    mv *$file* "$schoolMoveExtra"
  fi

else
  
  if [[ -z $extra ]]; then
    mv *$file* "$noExtra"
  else
    mv *$file* "$withExtra"
  fi

fi

#clear
echo "done"
echo

done

