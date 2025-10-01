#!/bin/sh

ITEMS=($(sketchybar --query bongo-cat | jq '.popup.items | @sh' | tr -d \' | tr -d \"))

for INDEX in ${!ITEMS[@]}; do
    ITEM_NAME="${ITEMS[INDEX]}"
    NEXT_ITEM="${ITEMS[INDEX+1]}"
    DRAWING=$(sketchybar --query $ITEM_NAME | jq '.geometry.drawing')

    if [ $DRAWING == '"on"' ]; then
        if [ -z "$NEXT_ITEM" ]; then
            # Dont display the cat!
            sketchybar                              \
                --set bongo-cat label.drawing="on"  \
                --set $ITEM_NAME drawing="off"
            break;
        fi

        # Display the next cat!
        sketchybar                              \
            --set $ITEM_NAME drawing="off"      \
            --set $NEXT_ITEM drawing="on"
        break;
    fi

    if [ -z "$NEXT_ITEM" ]; then
        # Nothing is displayed, display the first cat!
        ITEM_NAME="${ITEMS[0]}"
        sketchybar                              \
            --set bongo-cat label.drawing="off" \
            --set $ITEM_NAME drawing="on"
            break;
    fi
done;
