#!/bin/bash

while true; do
echo "\"ba\" for Blue Archive"
echo "\"l\" to see available entries"
echo "Last value: $type"
echo
read -p "$readType" -r temp

if [[ -z $temp ]]; then
  break
fi

temp=${temp,,}

case "$temp" in
  ba) type="blue archive"
    break
  ;;
  l|list)
    clear
    tree -L 1 "$stashpath/$safety/"
    echo
  ;;
  *) 
    type=$temp
    break
  ;;
esac
done
