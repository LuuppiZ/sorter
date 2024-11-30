#!/bin/bash
echo $PWD
tree -d
echo
echo "Type working directory path here."
echo "Syntax: $PWD/[Your path here]"
echo "If this path is fine press enter."
echo
read -p "$readWorkdir" -r path

if [[ -z $path ]]; then
  echo
else
  cd $path
fi
