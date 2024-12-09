#!/bin/bash

while true; do

# Character
echo
echo "Select character"
echo "Will create a new folder if one is not found"
echo
echo "To use last value press enter"
echo "Last value: $character"
echo
echo "l for list"
echo
read -p "$readCharacter" temp
echo

if [[ -z $temp ]]; then
  break
fi

temp=${temp,,}

case "$temp" in
  list|l) clear

    if [[ $type = "blue archive" ]]; then
      tree -L 2 "$stashpath/$safety/$type/"
    else
      tree -L 1 "$stashpath/$safety/$type/"
    fi
  ;;
  *)
    character=$temp
    break
  ;;
esac
done


