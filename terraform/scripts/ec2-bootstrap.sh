#!/bin/bash

# Enabling Debug
set -xe 

# Declaring Terraform Variables
host_name=${HOST_NAME}

function funFuntionNotify() {
	echo "----------------------------------------------------------------"
	echo "Fuction > $1"
	echo "----------------------------------------------------------------"
}

function funSetHostname() {
	funFuntionNotify "$${FUNCNAME[0]}: Started"
	# Configuring the hostname as per terraform variable and provisioning
	echo "Configuring the hostname as per terraform variable and provisioning"
	hostnamectl set-hostname --static $${host_name}
	funFuntionNotify "$${FUNCNAME[0]}: Completed"
}

function funUserCreation() {
	funFuntionNotify "$${FUNCNAME[0]}: Started"
	# Creating Centos user in the instance
	echo "Creating 'centos' user in the instance"
	sudo usermod -aG wheel centos
	sed -i 's/^%wheel/# %wheel/' /etc/sudoers
	sudo echo '%wheel  ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
	echo centos:centos | sudo chpasswd
	sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
	sudo service sshd restart
	funFuntionNotify "$${FUNCNAME[0]}: Completed"
}

function funSystemUpdate() {
	funFuntionNotify "$${FUNCNAME[0]}: Started"
	# Performing system patching to the letest updates
	echo "Performing system patching to the letest updates"
	yum update -y
	funFuntionNotify "$${FUNCNAME[0]}: Completed"
}

# Calling functions
echo "Functions Execution - Started"
funSetHostname
funUserCreation
funSystemUpdate
echo "Functions Execution - Completed"
