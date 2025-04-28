#!/usr/bin/env bash

# script to create vm using command line parameters
# $1=name

expected_params=(name os nat_network)

# Iterate through each parameter
for param in "${expected_params[@]}"; do
    if [ -z "$${param}"]


VBoxManage createvm --name lane35-dev1-fedora1 --basefolder "/home/$USER/VirtualBox VMs/" --ostype Fedora_64 --register

VBoxManage modifyvm lane35-dev1-fedora1 --memory 4096 --page-fusion on --vram 64 --cpus 4 --cpu-hotplug on --nic1 natnetwork --nat-network1 lane35-dev-1

