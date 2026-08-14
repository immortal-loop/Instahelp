#!/data/data/com.termux/files/usr/bin/bash

clear

# RGB colors
RED='\033[38;2;255;40;40m'
ORANGE='\033[38;2;255;150;0m'
YELLOW='\033[38;2;255;255;0m'
GREEN='\033[38;2;50;255;80m'
CYAN='\033[38;2;0;230;255m'
BLUE='\033[38;2;50;100;255m'
PURPLE='\033[38;2;180;70;255m'
PINK='\033[38;2;255;40;200m'
WHITE='\033[38;2;255;255;255m'
RESET='\033[0m'

# Instagram-style dot logo
echo -e "${RED}                 ● ● ● ● ● ● ● ● ● ● ● ● ●${RESET}"
echo -e "${ORANGE}             ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ●${RESET}"
echo -e "${YELLOW}          ● ●                                 ● ●${RESET}"
echo -e "${GREEN}        ● ●                                     ● ●${RESET}"
echo -e "${CYAN}      ● ●                                         ● ●${RESET}"
echo -e "${BLUE}     ● ●                                           ● ●${RESET}"
echo -e "${PURPLE}    ● ●                                             ● ●${RESET}"
echo -e "${PINK}   ● ●             ● ● ● ● ● ● ● ●                   ●${RESET}"
echo -e "${RED}   ● ●          ● ●               ● ●                ●${RESET}"
echo -e "${ORANGE}   ● ●        ● ●                   ● ●              ●${RESET}"
echo -e "${YELLOW}   ● ●       ● ●                     ● ●             ●${RESET}"
echo -e "${GREEN}   ● ●       ● ●                     ● ●             ●${RESET}"
echo -e "${CYAN}   ● ●       ● ●                     ● ●       ● ●   ${RESET}"
echo -e "${BLUE}   ● ●       ● ●                     ● ●      ● ●    ${RESET}"
echo -e "${PURPLE}    ● ●       ● ●                   ● ●             ${RESET}"
echo -e "${PINK}     ● ●       ● ●               ● ●                ${RESET}"
echo -e "${RED}      ● ●        ● ● ● ● ● ● ● ●                    ${RESET}"
echo -e "${ORANGE}        ● ●                                     ● ●${RESET}"
echo -e "${YELLOW}          ● ●                                 ● ●${RESET}"
echo -e "${GREEN}             ● ● ● ● ● ● ● ● ● ● ● ● ● ● ● ●${RESET}"
echo -e "${CYAN}                 ● ● ● ● ● ● ● ● ● ● ● ● ●${RESET}"

echo ""

# Title
echo -e "${YELLOW}================${GREEN} I N S T A H E L P ${PINK}================${RESET}"
echo ""
echo -e "${GREEN}             I N S T A G R A M   A C C O U N T   H E L P${RESET}"
echo ""

echo -e "${GREEN}------------------------------------------------------------${RESET}"
echo ""

echo -e "${GREEN}  [1] ${WHITE}Account Disabled${RESET}"
echo -e "${CYAN}  [2] ${WHITE}Account Ban${RESET}"
echo -e "${PURPLE}  [3] ${WHITE}Account Suspend${RESET}"
echo -e "${RED}  [0] ${WHITE}Exit${RESET}"

echo ""
echo -e "${BLUE}------------------------------------------------------------${RESET}"
echo ""

read -p "$(echo -e "${GREEN}Choose an option: ${RESET}")" choice

case "$choice" in
    1)
        clear
        echo -e "${GREEN}======================================${RESET}"
        echo -e "${GREEN}        ACCOUNT DISABLED${RESET}"
        echo -e "${GREEN}======================================${RESET}"
        echo ""
        echo -e "${CYAN}Enter your username below:${RESET}"
        read -p "> " username
        echo ""
        echo -e "${GREEN}Username entered:${RESET} ${WHITE}$username${RESET}"
        ;;

    2)
        clear
        echo -e "${RED}======================================${RESET}"
        echo -e "${RED}           ACCOUNT BAN${RESET}"
        echo -e "${RED}======================================${RESET}"
        echo ""
        echo -e "${CYAN}Enter your username below:${RESET}"
        read -p "> " username
        echo ""
        echo -e "${GREEN}Username entered:${RESET} ${WHITE}$username${RESET}"
        ;;

    3)
        clear
        echo -e "${PURPLE}======================================${RESET}"
        echo -e "${PURPLE}        ACCOUNT SUSPENDED${RESET}"
        echo -e "${PURPLE}======================================${RESET}"
        echo ""
        echo -e "${CYAN}Enter your username below:${RESET}"
        read -p "> " username
        echo ""
        echo -e "${GREEN}Username entered:${RESET} ${WHITE}$username${RESET}"
        ;;

    0)
        exit 0
        ;;

    *)
        echo ""
        echo -e "${RED}Invalid option.${RESET}"
        ;;
esac    *)
        echo ""
        echo "Invalid option."
        ;;
esac
