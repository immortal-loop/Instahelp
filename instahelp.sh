#!/data/data/com.termux/files/usr/bin/bash

clear

# =========================================================
# RGB COLORS
# =========================================================

RESET='\033[0m'

# Rainbow colors
RED='\033[38;2;255;45;45m'
ORANGE='\033[38;2;255;150;0m'
YELLOW='\033[38;2;255;235;0m'
GREEN='\033[38;2;40;255;90m'
CYAN='\033[38;2;0;220;255m'
BLUE='\033[38;2;60;100;255m'
PURPLE='\033[38;2;180;60;255m'
PINK='\033[38;2;255;40;190m'

# =========================================================
# CORRECTED INSTAGRAM DOT LOGO (Matches the image shape)
# =========================================================

logo=(
"         ●●●●●●●●●●●●●●●●●●●●●         "
"      ●●●                      ●●●      "
"    ●●                            ●●    "
"   ●      ●●●●          ●●●●        ●   "
"  ●     ●●    ●●      ●●    ●●       ●  "
"  ●    ●        ●    ●        ●      ●  "
" ●     ●        ●    ●        ●       ● "
" ●     ●●      ●●    ●●      ●●       ● "
" ●       ●●●●●●        ●●●●●●         ● "
" ●                                    ● "
" ●              ●●●●●●                ● "
" ●            ●●      ●●              ● "
" ●            ●         ●             ● "
" ●            ●         ●             ● "
" ●            ●●      ●●              ● "
" ●              ●●●●●●                ● "
"  ●                                  ●  "
"  ●     ●●                    ●●     ●  "
"   ●      ●●●●●●●●●●●●●●●●●●●●     ●    "
"    ●●                            ●●    "
"      ●●●                      ●●●      "
"         ●●●●●●●●●●●●●●●●●●●●●         "
)

# =========================================================
# ANIMATED COLOR-CHANGING & GLOW EFFECT LOGO DISPLAY
# =========================================================

# Array of colors for smooth cycling
colors=("$RED" "$ORANGE" "$YELLOW" "$GREEN" "$CYAN" "$BLUE" "$PURPLE" "$PINK")

# Print animated cycling frames (creates a glow/color-shifting effect)
for frame in {0..2}; do
    clear
    offset=$((frame * 2))
    
    for i in "${!logo[@]}"; do
        line="${logo[$i]}"
        # Shift colors dynamically based on line index and frame offset
        color_idx=$(( (i + offset) % 8 ))
        echo -e "${colors[$color_idx]}${line}${RESET}"
    done
    
    sleep 0.15
done

# Clear and print final static colored logo as shown in the reference image
clear
total_lines=${#logo[@]}
for i in "${!logo[@]}"; do
    line="${logo[$i]}"
    # Map gradient smoothly across lines from top (yellow/orange) to bottom (pink/purple)
    if [ $i -lt 4 ]; then
        echo -e "${YELLOW}${line}${RESET}"
    elif [ $i -lt 8 ]; then
        echo -e "${ORANGE}${line}${RESET}"
    elif [ $i -lt 12 ]; then
        echo -e "${RED}${line}${RESET}"
    elif [ $i -lt 16 ]; then
        echo -e "${PINK}${line}${RESET}"
    else
        echo -e "${PURPLE}${line}${RESET}"
    fi
done

echo ""

# =========================================================
# TITLE (Exact match to reference image layout and colors)
# =========================================================

echo -e "${CYAN}=============${RESET}${YELLOW}I${ORANGE}N${YELLOW}S${GREEN}T${CYAN}A${BLUE}H${PURPLE}E${PINK}L${RED}P${RESET}${CYAN}=============${RESET}"

echo ""

echo -e "${GREEN}          INSTAGRAM ACCOUNT HELP${RESET}"

echo ""

echo -e "${GREEN}------------------------------------------------------------${RESET}"

echo ""

# =========================================================
# MENU (Exact match to reference image options)
# =========================================================

echo -e "${GREEN}  [1] ${RESET}My account was disabled"
echo -e "${CYAN}  [2] ${RESET}What should I do?"
echo -e "${PURPLE}  [3] ${RESET}Appeal information"
echo -e "${PINK}  [4] ${RESET}About this tool"
echo -e "${RED}  [0] ${RESET}Exit"

echo ""

echo -e "${GREEN}------------------------------------------------------------${RESET}"

echo ""

read -p "$(echo -e "${GREEN}Choose an option: ${RESET}")" choice

# =========================================================
# OPTIONS HANDLER
# =========================================================

case "$choice" in

    1)
        clear
        echo -e "${GREEN}======================================${RESET}"
        echo -e "${GREEN}       MY ACCOUNT WAS DISABLED${RESET}"
        echo -e "${GREEN}======================================${RESET}"
        echo ""
        echo -e "${CYAN}Enter your username below:${RESET}"
        read -p "> " username
        echo ""
        echo -e "${GREEN}Username entered:${RESET} $username"
        ;;

    2)
        clear
        echo -e "${CYAN}======================================${RESET}"
        echo -e "${CYAN}         WHAT SHOULD I DO?${RESET}"
        echo -e "${CYAN}======================================${RESET}"
        echo ""
        echo -e "${GREEN}Follow the official Instagram help center guidelines to submit an appeal.${RESET}"
        ;;

    3)
        clear
        echo -e "${PURPLE}======================================${RESET}"
        echo -e "${PURPLE}         APPEAL INFORMATION${RESET}"
        echo -e "${PURPLE}======================================${RESET}"
        echo ""
        echo -e "${GREEN}Make sure you have your government-issued ID ready if required.${RESET}"
        ;;

    4)
        clear
        echo -e "${PINK}======================================${RESET}"
        echo -e "${PINK}          ABOUT THIS TOOL${RESET}"
        echo -e "${PINK}======================================${RESET}"
        echo ""
        echo -e "${GREEN}INSTAHELP v1.0 - Designed for Termux.${RESET}"
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
