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

