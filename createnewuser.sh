#!/bin/bash

if [ ! -z $1 ]; then
	username=$1
	useradd -m -d /home/$1 -G sudo -s /bin/bash $1
	sudo passwd -e $1
	
	mkdir -p /home/$1/.ssh
	wget http://github.com/$1.keys -O /home/$1/.ssh/authorized_keys
	
	chown -R $1 /home/$1/.ssh
	chmod 701 /home/$1/.ssh

	chown -R $1 /home/$1/.ssh/authorized_keys
	chmod 600 /home/$1/.ssh/authorized_keys
	
fi

