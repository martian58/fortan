#!/bin/bash
source constants.sh

if [ "$EUID" -ne 0 ]; then
    echo -e "${bold_red}Run as root!"
    echo -e "${bold_blue}|"
    echo -e "${bold_blue} --> sudo su"
    exit 1
fi
clear
echo
text="  Hello, friend. Today i will guide you through a process to fix your ubuntu. First, let's configure your servers."
echo
text2="  Now open another terminal tab 'Ctrl+Shift+T', if this didnt work then, 'Ctrl+Alt+T'. Type in the new terminal: 'open /etc/apt/sources.list' and press 'Enter'. A new window will open, dont get scared. On that window you will see a part where it says 'server', change that server to main."
delay=0.07  # Adjust the delay as needed

for ((i=0; i<${#text}; i++)); do
    echo -e -n "${bold_blue}${text:$i:1}"
    sleep $delay
done

echo  # Move to the next line after printing
for ((i=0; i<${#text2}; i++)); do
    echo -e -n "${bold_blue}${text2:$i:1}"
    sleep $delay
done
echo

status_is_set=false
while [ "$status_is_set" == false ]; do
    read -r -p  "$(echo -e "${bold_blue}Type 'done' and press 'enter' when you do all the instructions: ${no_color}" ) " status

    if [ "$status" == "done" ]; then
        status_is_set=true
        echo -e "${bold_pink}Good, process is starting...."
        echo -e "${bold_pink}Dont stop the process until it ends itself"
        sleep 2
        echo -e "${bold_blue}"
        sudo apt update
        sudo apt upgrade
        sudo apt install build-essential
        sudo apt install -f
        sudo apt autoremove
        sudo apt clean
        sudo apt update
        sudo apt upgrade
        echo -e "${bold_green}All done!"
        echo -e "${bold_green}Dont forget to like and follow my github :), it's right here: https://github.com/martian58"
        sleep 2
        echo -e "${bold_blue}Have a nice day. see you on other occasions."
    else
        echo -e "${bold_red}Wrong input"
        status_is_set=false
    fi

done