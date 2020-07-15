#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="windows-assets.svg"
ASSETS_DIR="titlebutton-alt-small"
INDEX="assets.txt"

mkdir -p $ASSETS_DIR

for i in `cat $INDEX` ; do
for d in '' '-dark' ; do

## alt small titlebutton
if [ -f $ASSETS_DIR/$i$d.png ]; then
    echo $ASSETS_DIR/$i$d.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i$d.png
    $INKSCAPE --export-id=$i-alt-small$d \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i$d.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i$d.png 
fi

if [ -f $ASSETS_DIR/$i$d@2.png ]; then
    echo $ASSETS_DIR/$i$d@2.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i$d@2.png
    $INKSCAPE --export-id=$i-alt-small$d \
              --export-dpi=180 \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i$d@2.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i$d@2.png 
fi

done
done
exit 0