#!/bin/env bash 
 

shell=/sbin/nologin

echo Welcome!
read -p "Please enter user name: " user
read -p "Please enter user group: " group

sleep 2
groupadd $group
if [ "$group" = it ]
then
	if ! grep "%$group" /etc/sudoers
	then
	cp /etc/sudoers{,.bkp} 
	echo '%'$group' ALL=(ALL) ALL' >> /etc/sudoers
	fi
	shell=/bin/bash
fi
mkdir /home/$group
useradd $user -g $group -b /home/$group -s $shell 

