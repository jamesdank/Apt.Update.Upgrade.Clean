#!/bin/bash

function update () {
    ##############################################################################
    # Sound Files
    update="/home/$USER/Apt.Update.Upgrade.Clean/mp3/update.mp3"
    upgrade="/home/$USER/Apt.Update.Upgrade.Clean/mp3/upgrade.mp3"
    clean="/home/$USER/Apt.Update.Upgrade.Clean/mp3/clean.mp3"
    ready="/home/$USER/Apt.Update.Upgrade.Clean/mp3/ready.mp3"
    ##############################################################################

    if [ ! command -v ffplay &> /dev/null ]; then
        echo "ffplay could not be found"
        exit 0
    fi

    echo -e "\nUpdating system..." 
    ffplay $update -autoexit -nodisp 2> /dev/null 
    sleep 2 
    sudo apt update -y 

    echo -e "\nUpgrading system..." 
    ffplay $upgrade -autoexit -nodisp 2> /dev/null 
    sleep 2 
    sudo apt upgrade -y 
            
    echo -e "\ncleaning up update files and purging unused packages..." 
    ffplay $clean -autoexit -nodisp 2> /dev/null 
    sleep 2 
    sudo apt clean -y 
    sudo apt autoremove -y
    ffplay $ready -autoexit -nodisp 2> /dev/null 
}

update
