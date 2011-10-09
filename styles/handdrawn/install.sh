#!/bin/bash

# Check Distro
OS=$(lsb_release -si)

if [ "$OS" = "Ubuntu" ]
    then echo "$OS detected, starting install."
    else echo "Install script designed for Ubuntu, exiting."
        exit
fi

# Copy Fonts
for font in "ShortStack-Regular.ttf" "WalterTurncoat.ttf"
do
    fontTest=$(find /usr/share/fonts -name "$font")
    if [ -n "$fontTest" ];
        # Font Found
        then echo "Found Font: " $font
        # Font Not Found
        else echo "Font Not Found, Installing: " $font
            cp ./fonts/$font /usr/share/fonts/truetype
    fi
done

# Unzip Data
for zip in ./data/*.zip
do
    base=$(basename "$zip" .zip)
    dataset="./data/$base.shp"

    if [ -e "$dataset" ];
        then echo $base "previously extracted"
        else echo $base "not previously extracted"
            unzip -d ./data $zip
    fi
done
   
# Index Shapefiles

## Check for shapeindex dependency
if ! which shapeindex > /dev/null; then
    echo "ERROR: shapeindex not in PATH, try 'sudo apt-get install mapnik-utils'"
    exit
fi

## Begin indexing
for shp in ./data/*.shp
do
    base=$(basename "$shp" .shp)
    dataset="./data/$base"
    shapeindex $dataset
done

# Change data ownership to Mapbox User/Group

# Add User to Mapbox Group

# Establish symlinks to project folder
echo "fin"
