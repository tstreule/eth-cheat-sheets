#!/bin/bash

function cleanup {
  for f in ./*
  do
    case $f in
    *.pdf|*.tex|*.sty|*.bib|*.sh|*.md) true;; # keep pdfs
    *) if [ -d "$f" ]
      then
        if ! [ "$(ls -A "$f")" ]; then rm -r "$f"; fi; # remove empty folders
      else
        rm "$f" # remove file
      fi;;
    esac
  done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  cd pdfs || exit
  echo "⁎*⁎ Cleaning up $(pwd) ⁎*⁎"
  cleanup
fi
