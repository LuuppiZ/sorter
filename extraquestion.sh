#!/bin/bash

# Extra arguments
echo
tree -d "$treeExtra"
echo
echo "Extra agruments?"
echo "Press enter if no"
echo
echo "To use last value input 1"
echo "Last value: $extra"
echo
read -p "$readExtra" -r temp

if [[ $temp = 1 ]]; then
  echo "Using last value"
elif [[ -z $temp ]]; then
  echo "No extra arguments"
  extra=""
else
  extra=$temp
fi

