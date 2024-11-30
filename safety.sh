#!/bin/bash

while true; do
# SFW or NSFW
echo
echo "SFW, NSFW or UNKNOWN?"
echo "\"s\" & \"n\" & \"u\" respectively"
echo
echo "To use last value press enter"
echo "Last value: $safety"
echo
read -p "$readSafety" -r temp
echo

if [[ -z $temp ]]; then
  break
fi

temp=${temp,,}

case "$temp" in
  n|nsfw) echo "NSFW"
    safety="NSFW"
    break
  ;;
  s|sfw) echo "SFW"
    safety="SFW"
    break
  ;;
  u|unknown) echo "Unknown"
    safety="UNKNOWN"
    break 
  ;;
  *) echo "Invalid input, try again."
  ;;
esac
done

#safety=${safety^^} # Sets all Characters to uppercase
