#!/bin/env bash 
 
echo Welcome!
read -p "Please enter user name: " user
read -p "Please enter user group: " group

sleep 2
groupadd $group
cp /etc/sudoers{,.bkp}
echo '%'$group' ALL=(ALL) ALL' >> /etc/sudoers
mkdir /home/$group
useradd $user -g $group -b /home/$group -s /bin/bash 

