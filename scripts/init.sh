#!/bin/bash

source $LPTOOL_DIR/scripts/functions.sh


#
# Check that Python3 is installed
#
if IsNotInstalled python3; then
	# Dependencies
	CheckInstall software-properties-common
	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt update
	sudo apt install -y python3.8
fi

#
# Create a local .venv environment for lptools
#
if [ ! -d "$LPTOOL_DIR/.venv" ]; then
	CheckInstall python3.8-venv
	python3 -m venv $LPTOOL_DIR/.venv
	pip3 install --upgrade pip
fi

	
