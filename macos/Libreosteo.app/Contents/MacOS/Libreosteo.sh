#!/bin/bash
port=8085
config_file='/Applications/LibreosteoService.app/Contents/Resources/server.cfg'
if [ -e ${config_file} ]; then
	port=$(grep "server.port" ${config_file} | sed -e 's@.*= *\([0-9]*\)$@\1@')
fi
open http://localhost:${port}/
