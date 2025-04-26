#!/usr/bin/env bash

# check to see whether natnetwork exists

vbox_nat_network_check() {
    local check_output=$(VBoxManage natnetwork list | grep -ic "0 networks found")
    if [[ $check_output -eq 1 ]]; then
        echo "No NAT networks found."
    else
        echo "NAT networks found. Exiting"
        exit $check_output
    fi
}

echo "Checking for existing VBoxManage NAT Networks"
vbox_nat_network_check

vbox_nat_network_add() {
    # Check the number of command line parameters
    if [[ ${!#} -ne 2 ]]; then
        echo "Usage: vbox_nat_network_add <netname> <network>"
        echo ${$#}
        exit 1
    fi

    # Add the NAT network with the given name and network settings
    VBoxManage natnetwork add --netname "$1" --network "$2" --enable --dhcp on

    # Check for errors in the command
    if [[ $? -ne 0 ]]; then
        echo "Error adding NAT network. Exit code: $?"
        exit $?
    fi
}

echo "Creating VirtualBox NAT Network"
vbox_nat_network_add "$1" "$2"