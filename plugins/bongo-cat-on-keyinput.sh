#!/bin/sh

ITEMS=$(sketchybar --query bongo-cat | jq '.popup.items | @sh' | tr -d \' | tr -d \")

for ITEM_NAME in $ITEMS; do
    DRAWING=$(sketchybar --query $ITEM_NAME | jq '.geometry.drawing')

    if [ $DRAWING == '"on"' ]; then
        NEXT=${ITEM_NAME/1/2}
        if [ "$NEXT" == "$ITEM_NAME" ]; then
            NEXT=${ITEM_NAME/2/1}
        fi

        sketchybar                         \
            --set $ITEM_NAME drawing="off" \
            --set $NEXT drawing="on"
        break;
    fi
done;
