#!/bin/bash
echo "Stopping LibreosteoService"
launchctl stop org.libreosteo.macos.LibreosteoService
echo "Removing agent LibreosteoService"
launchctl remove org.libreosteo.macos.LibreosteoService
echo "Deleting LibreosteoService directory"
APPS_DIR=$( dirname $BASH_SOURCE[0]})/../../../
LIBREOSTEO_SERVICE_APP_DIR=$APPS_DIR/LibreosteoService.app
LIBREOSTEO_APP_DIR=$APPS_DIR/Libreosteo.app
rm -rfv $LIBREOSTEO_SERVICE_APP_DIR
rm -rfv $LIBREOSTEO_APP_DIR
