#!/bin/bash

while true; do
# Target file
ls -p -1A #| grep -v / # Lists all files in current folder (Does seem to also list subfolders) It seems you can also move folders so let's also show them.
#tree -L 2
echo
echo "Select file from above"
echo "Target can also be a folder"
echo "\"w\" to view"
echo
echo "Type 1 to use last value"
echo "Last value: $file"
echo
read -p "$readTargetFile" -r temp

if [[ -z $temp ]]; then
  file=""
  break
fi

case "$temp" in
  w)
    read -p "$readShowFile" -r file
    clear
    . $folder/$imageViewer
    sleep 1
  ;;
  1)
    break 
  ;;
  *)
    file=$temp
    break
  ;;
esac
done

