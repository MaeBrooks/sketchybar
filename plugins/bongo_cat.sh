#!/bin/sh

# TODO: This would be much faster, if we created to image item, then just swapped them out

if [ -v $BONGO_CAT_IMG ]; then
    export BONGO_CAT_IMG="$HOME/.config/sketchybar/bc-1.png"
fi

current_image=$(sketchybar --query bongo-cat-image background.image | jq '.geometry.background.image')

if [[ "$current_image" == *"bc-2"* ]] ; then
    export BONGO_CAT_IMG="$HOME/.config/sketchybar/bc-1.png"
else
    export BONGO_CAT_IMG="$HOME/.config/sketchybar/bc-2.png"
fi

sketchybar --set bongo-cat-image \
  background.image.scale=0.25 \
  background.border_width=2 \
  background.drawing=on \
  background.image="$BONGO_CAT_IMG"
