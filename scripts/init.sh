#!/bin/bash

source $TOOLKIT_DIR/scripts/functions.sh

CheckInstall git
## AUTO UPDATE
git -C $TOOLKIT_DIR pull 1>/dev/null

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
if [ ! -d "$TOOLKIT_DIR/.venv" ]; then
	CheckInstall python3.8-venv
	python3 -m venv $TOOLKIT_DIR/.venv
	pip3 install --upgrade pip
fi

