#!/bin/bash

/Applications/LibreosteoService.app/Contents/MacOS/manage migrate --noinput
myuser=${SUDO_USER:-$USER}
chown -R ${myuser} "/Users/${myuser}/Library/Application Support/Libreosteo"
agents_dir="/Users/${myuser}/Library/LaunchAgents"
mkdir -p ${agents_dir}
(
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
echo "<plist version=\"1.0\">"
echo "<dict>"
echo "	<key>KeepAlive</key>"
echo "	<true/>"
echo "	<key>Label</key>"
echo "	<string>org.libreosteo.macos.LibreosteoService</string>"
echo "	<key>ProgramArguments</key>"
echo "	<array>"
echo "		<string>/Applications/LibreosteoService.app/Contents/MacOS/LibreosteoService</string>"
echo "	</array>"
echo "	<key>RunAtLoad</key>"
echo "	<true/>"
echo "	<key>ProcessType</key>"
echo "	<string>Background</string>"
echo "</dict>"
echo "</plist>"
) > ${agents_dir}/org.libreosteo.macos.LibreosteoService.plist
chmod +x "${agents_dir}/org.libreosteo.macos.LibreosteoService.plist"
chmod -R 777 /Applications/LibreosteoService.app/Contents/Resources/static/CACHE
chown -R ${myuser} "${agents_dir}/org.libreosteo.macos.LibreosteoService.plist"
sudo -u ${myuser} launchctl load -w "${agents_dir}/org.libreosteo.macos.LibreosteoService.plist"
sudo -u ${myuser} launchctl start org.libreosteo.macos.LibreosteoService
