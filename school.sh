#!/bin/bash
# Asks from what school the student is
while true; do

echo "What school is the character from?"
echo "Last value: $school"
echo
echo "l for list"
echo
read -p "$readSchool" -r temp

if [[ -z $temp ]]; then
  echo "Using last value: $school"
  break 
fi

temp=${temp,,}

case "$temp" in
  l|list) clear
    tree -L 2 "/home/$USER/Pictures/Stash/$safety/$type/" #Stash/SFW/blue archive/[schools here]
  ;;
  *)
    school=$temp # sets the read value to school variable
    break # breaks out of the infinite loop
  ;;
esac
done

