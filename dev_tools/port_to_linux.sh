#!/bin/bash

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Define paths based on the script location
SRC_DIR="$SCRIPT_DIR/windows/dark"
DEST_DIR="$SCRIPT_DIR/linux/dark/cursors"

echo "SRC_DIR:  $SRC_DIR"
echo "DEST_DIR: $DEST_DIR"

rm "$DEST_DIR"/* 2>/dev/null

which win2xcur >/dev/null 2>&1 || { echo "win2xcur not found. Please install it to convert Windows cursors:"; echo "pip install win2xcur"; exit 1; }

win2xcur "$SRC_DIR"/*{.cur,.ani} -o "$DEST_DIR"

# these pointers don't exist on linux
rm "$DEST_DIR"/Pin 2>/dev/null
rm "$DEST_DIR"/Person 2>/dev/null

mv "$DEST_DIR"/AppStarting "$DEST_DIR"/progress
mv "$DEST_DIR"/Arrow "$DEST_DIR"/left_ptr
mv "$DEST_DIR"/Cross "$DEST_DIR"/crosshair
mv "$DEST_DIR"/IBeam "$DEST_DIR"/text
mv "$DEST_DIR"/Hand "$DEST_DIR"/grab
mv "$DEST_DIR"/Help "$DEST_DIR"/help
mv "$DEST_DIR"/No "$DEST_DIR"/not-allowed
mv "$DEST_DIR"/Pen "$DEST_DIR"/pencil
mv "$DEST_DIR"/UpArrow "$DEST_DIR"/up-arrow
mv "$DEST_DIR"/Wait "$DEST_DIR"/wait
mv "$DEST_DIR"/Sall "$DEST_DIR"/move
mv "$DEST_DIR"/Sdr "$DEST_DIR"/nesw-resize
mv "$DEST_DIR"/Sv "$DEST_DIR"/ns-resize
mv "$DEST_DIR"/Sdl "$DEST_DIR"/nwse-resize
mv "$DEST_DIR"/Sh "$DEST_DIR"/ew-resize


# Pointer symlinks
ln -s "$DEST_DIR"/left_ptr "$DEST_DIR"/default
ln -s "$DEST_DIR"/left_ptr "$DEST_DIR"/pointer
ln -s "$DEST_DIR"/left_ptr "$DEST_DIR"/auto

ln -s "$DEST_DIR"/not-allowed "$DEST_DIR"/no-drop

ln -s "$DEST_DIR"/grab "$DEST_DIR"/grabbing

ln -s "$DEST_DIR"/crosshair "$DEST_DIR"/cell

ln -s "$DEST_DIR"/text "$DEST_DIR"/xterm 


# Resize symlinks
ln -s "$DEST_DIR"/ew-resize "$DEST_DIR"/col-resize
ln -s "$DEST_DIR"/ew-resize "$DEST_DIR"/e-resize
ln -s "$DEST_DIR"/ew-resize "$DEST_DIR"/w-resize

ln -s "$DEST_DIR"/ns-resize "$DEST_DIR"/row-resize
ln -s "$DEST_DIR"/ns-resize "$DEST_DIR"/n-resize
ln -s "$DEST_DIR"/ns-resize "$DEST_DIR"/s-resize

ln -s "$DEST_DIR"/nwse-resize "$DEST_DIR"/nw-resize
ln -s "$DEST_DIR"/nwse-resize "$DEST_DIR"/se-resize
ln -s "$DEST_DIR"/nesw-resize "$DEST_DIR"/ne-resize
ln -s "$DEST_DIR"/nesw-resize "$DEST_DIR"/sw-resize

ln -s "$DEST_DIR"/move "$DEST_DIR"/all-scroll

# Missing cursors
# alias
# cell ?
# context-menu
# variants of resizes
# grabbing, make the hollowed hand
# vertical-text
# zoom-in
# zoom-out

exit 0