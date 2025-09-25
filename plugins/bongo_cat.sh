#!/bin/sh

# TODO: This would be much faster, if we created to image items, then just swapped them out

if [ -v $BONGO_CAT_IMG ]; then
    export BONGO_CAT_IMG="$HOME/Downloads/bongo-cat/bc-1.png"
fi

current=$(sketchybar --query bongo-cat-image background.image | jq '.geometry.background.image')

if [[ "$current" == *"bc-2"* ]] ; then
    export BONGO_CAT_IMG="$HOME/Downloads/bongo-cat/bc-1.png"
else
    export BONGO_CAT_IMG="$HOME/Downloads/bongo-cat/bc-2.png"
fi

sketchybar --set bongo-cat-image \
  background.image.scale=0.25 \
  background.border_width=2 \
  background.drawing=on \
  background.image="$BONGO_CAT_IMG"
