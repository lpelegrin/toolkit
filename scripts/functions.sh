#!/bin/bash


function CheckInstall() {
	pkg=$1
	status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
	if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
		sudo apt install -y $pkg
	fi
} 

function IsInstalled() {
	pkg=$1
	status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
	if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
		return 1 
	fi
	return 0
}

function IsNotInstalled() {
	pkg=$1
	status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
	if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
		return 0
	fi
	return 1
}

CheckPipInstall() {
	source $TOOLKIT_DIR/.venv/bin/activate
	pkg=$1
	status="$(pip3 show $pkg 2>&1)"
	if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
		pip3 install $pkg
	fi
}
