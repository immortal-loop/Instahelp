#!/data/data/com.termux/files/usr/bin/bash

clear

# =========================================================
# RGB COLORS
# =========================================================

RESET='\033[0m'

# Rainbow colors used by the logo
RED='\033[38;2;255;45;45m'
ORANGE='\033[38;2;255;150;0m'
YELLOW='\033[38;2;255;235;0m'
GREEN='\033[38;2;40;255;90m'
CYAN='\033[38;2;0;220;255m'
BLUE='\033[38;2;60;100;255m'
PURPLE='\033[38;2;180;60;255m'
PINK='\033[38;2;255;40;190m'

# =========================================================
# INSTAGRAM DOT LOGO
# Designed for a small Termux screen
# =========================================================

logo=(
"    ●●●●●●●●●●●●●●●●●●●●●●●●"
"  ●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
" ●●                          ●●"
" ●●                          ●●"
" ●●                          ●●"
" ●●                    ●●●   ●●"
" ●●         ●●●●●●●●   ●●●   ●●"
" ●●       ●●●      ●●●       ●●"
" ●●      ●●          ●●      ●●"
" ●●      ●●          ●●      ●●"
" ●●      ●●          ●●      ●●"
" ●●      ●●          ●●      ●●"
" ●●       ●●●      ●●●       ●●"
" ●●         ●●●●●●●●         ●●"
" ●●                          ●●"
" ●●                          ●●"
" ●●                                         ●●"
" ●●                                          ●●"
"  ●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
"    ●●●●●●●●●●●●●●●●●●●●●●●●"
)

# =========================================================
# DISPLAY LOGO WITH RAINBOW COLORS
# =========================================================

i=0

for line in "${logo[@]}"; do

    case $((i % 8)) in
        0) echo -e "${YELLOW}${line}${RESET}" ;;
        1) echo -e "${ORANGE}${line}${RESET}" ;;
        2) echo -e "${RED}${line}${RESET}" ;;
        3) echo -e "${PINK}${line}${RESET}" ;;
        4) echo -e "${PURPLE}${line}${RESET}" ;;
        5) echo -e "${BLUE}${line}${RESET}" ;;
        6) echo -e "${CYAN}${line}${RESET}" ;;
        7) echo -e "${GREEN}${line}${RESET}" ;;
    esac

    ((i++))

done

echo ""

# =========================================================
# TITLE
# =========================================================

echo -e "${YELLOW}==============${GREEN} I N S T A H E L P ${PINK}==============${RESET}"

echo ""

echo -e "${GREEN}          I N S T A G R A M   A C C O U N T   H E L P${RESET}"

echo ""

echo -e "${GREEN}------------------------------------------------------------${RESET}"

echo ""

# =========================================================
# MENU
# =========================================================

echo -e "${GREEN}  [1] ${RESET}Account Disabled"
echo -e "${CYAN}  [2] ${RESET}Account Ban"
echo -e "${PURPLE}  [3] ${RESET}Account Suspend"
echo -e "${RED}  [0] ${RESET}Exit"

echo ""

echo -e "${BLUE}------------------------------------------------------------${RESET}"

echo ""

read -p "$(echo -e "${GREEN}Choose an option: ${RESET}")" choice

# =========================================================
# OPTIONS
# =========================================================

case "$choice" in

    1)
        clear

        echo -e "${GREEN}======================================${RESET}"
        echo -e "${GREEN}          ACCOUNT DISABLED${RESET}"
        echo -e "${GREEN}======================================${RESET}"

        echo ""
        echo -e "${CYAN}Enter your username below:${RESET}"

        read -p "> " username

        echo ""
        echo -e "${GREEN}Username entered:${RESET} $username"
        ;;

    2)
        clear

        echo -e "${RED}======================================${RESET}"
        echo -e "${RED}             ACCOUNT BAN${RESET}"
        echo -e "${RED}======================================${RESET}"

        echo ""
        echo -e "${CYAN}Enter your username below:${RESET}"

        read -p "> " username

        echo ""
        echo -e "${GREEN}Username entered:${RESET} $username"
        ;;

    3)
        clear

        echo -e "${PURPLE}======================================${RESET}"
        echo -e "${PURPLE}          ACCOUNT SUSPEND${RESET}"
        echo -e "${PURPLE}======================================${RESET}"

        echo ""
        echo -e "${CYAN}Enter your username below:${RESET}"

        read -p "> " username

        echo ""
        echo -e "${GREEN}Username entered:${RESET} $username"
        ;;

    0)
        clear
        exit 0
        ;;

    *)
        echo ""
        echo -e "${RED}Invalid option.${RESET}"
        ;;

esac
