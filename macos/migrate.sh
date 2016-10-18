#!/bin/bash

/Applications/Libreosteo.app/Contents/MacOS/manage migrate --noinput
myuser=${SUDO_USER:-$USER}
chown -R ${myuser} "/Users/${myuser}/Library/Application Support/Libreosteo"
agents_dir="/Users/${myuser}/Library/LaunchAgents"
mkdir -p ${agents_dir}
cp org.libreosteo.macos.Libreosteo.plist ${agents_dir}/.
chmod +x "${agents_dir}/org.libreosteo.macos.Libreosteo.plist"
chmod -R 777 /Applications/Libreosteo.app/Contents/Resources/static/CACHE
chown -R ${myuser} "${agents_dir}/org.libreosteo.macos.Libreosteo.plist"
sudo -u ${myuser} launchctl load -w "${agents_dir}/org.libreosteo.macos.Libreosteo.plist"
sudo -u ${myuser} launchctl start org.libreosteo.macos.Libreosteo
