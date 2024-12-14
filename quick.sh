#!/bin/bash
type="blue archive"
case "$1" in
  -h|-help)
    echo "Quick move feature"
    echo "Usage:"
    echo "soter [image] [character] [safety]"
    echo ""
    echo "Using gtk file picker"
    echo "sorter -z [character] [safety]"
    exit
  ;;
  *)
  ;;
esac

character=${2,,}
safety=${3^^}

case "$safety" in
  N) safety="NSFW"
  ;;
  S) safety="SFW"
  ;;
esac

fullpath=$(find "$stashpath/$safety/$type/" -mindepth 2 -maxdepth 2 -type d -name "$character")

if [[ $1 = "-z" ]]; then
  movefile=$(zenity --file-selection --multiple --title="Select Files" --filename="$(pwd)/")
  for file in $(echo $movefile | tr '|' ' '); do
    echo "Moving file: \"$file\" to \"$fullpath\""
    mv $file "$fullpath/"
  done
fi

if [[ "$1" -ne "-z" ]]; then
  echo "Moved \"$1\" to \"$fullpath\""
  mv *$1* "$fullpath/"
fi
