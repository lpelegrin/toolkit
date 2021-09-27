#!/bin/bash

source $LPTOOL_DIR/scripts/functions.sh

CheckInstall git
CheckInstall vim

#
# Install Kubectl
#
if IsNotInstalled kubectl; then
	# Dependencies
	CheckInstall apt-transport-https 
	CheckInstall gnupg2 
	CheckInstall curl
	sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
	echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
	sudo apt update
	# Installation
	sudo apt install -y kubectl
fi

#
# Install Helm
#
if IsNotInstalled helm; then
	# Dependencies
	curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
	CheckInstall apt-transport-https --yes
	echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
	sudo apt update
	sudo apt install -y helm
fi

#
# Install terraform
#
if IsNotInstalled terraform; then
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
	sudo apt update
	sudo apt install terraform
fi

#
# Install Azure Cloud cli
#
if IsNotInstalled azure-cli; then
	# Dependencies
	CheckInstall ca-certificates 
	CheckInstall curl 
	CheckInstall apt-transport-https 
	CheckInstall lsb-release 
	CheckInstall gnupg
	curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
	AZ_REPO=$(lsb_release -cs)
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
	sudo apt update
	sudo apt install -y azure-cli
fi

#
# Install Ansible
#
CheckPipInstall ansible


