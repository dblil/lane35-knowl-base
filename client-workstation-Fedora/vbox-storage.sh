#!/usr/bin/env bash

VBoxManage createmedium disk --filename "/home/$USER/VirtualBox VMs/lane35-dev1-fedora1/lane35-dev1-fedora1.vdi" --size 64000 --format VDI --variant Standard 

VBoxManage list hdds

# vboxmanage closemedium