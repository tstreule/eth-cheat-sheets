#!/bin/bash

read -rp "Enter cheat sheet names: " CHEAT_SHEETS
source ./dir_cleanup.sh

# Make output directory
OUT_DIR="pdfs"
! [ -d "$OUT_DIR" ] && mkdir "$OUT_DIR"

for CS in $CHEAT_SHEETS
do
  echo ""
  echo "⁎*⁎ Make $CS pdf ⁎*⁎"
  echo ""
  # Set paths
  WORK_DIR="src/$CS"
  # Make pdf
  {(
    cd "$WORK_DIR" || contiue
    xelatex -file-line-error -interaction=batchmode -synctex=1 \
    -halt-on-error -jobname "$CS" main.tex
    cleanup
  )} # &> /dev/null # suppress output
  # Move pdf
  mv "$WORK_DIR/$CS.pdf" "$OUT_DIR/$CS.pdf"
done
