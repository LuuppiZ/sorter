#!/bin/bash
if [[ -f ~/.cache/sorter/sorter.sh ]]; then
  . ~/.cache/sorter/sorter.sh
else
  mkdir "~/.cache/sorter/"
  git clone https://github.com/LuuppiZ/sorter.git ~/.cache/sorter/
  . ~/.cache/sorter/sorter.sh
fi
