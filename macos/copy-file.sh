#!/bin/bash
SCRIPT_DIR=$DSTROOT/Libreosteo.app/Contents/MacOS
echo "Add uninstall script to $SCRIPT_DIR"
cp -v uninstall.sh $SCRIPT_DIR/.
chmod +x $SCRIPT_DIR/uninstall.sh
