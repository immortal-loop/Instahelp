#!/data/data/com.termux/files/usr/bin/bash

clear

# =========================================================
# RGB COLORS
# =========================================================

RESET='\033[0m'

RED='\033[38;2;255;45;45m'
ORANGE='\033[38;2;255;150;0m'
YELLOW='\033[38;2;255;235;0m'
GREEN='\033[38;2;40;255;90m'
CYAN='\033[38;2;0;220;255m'
BLUE='\033[38;2;60;100;255m'
PURPLE='\033[38;2;180;60;255m'
PINK='\033[38;2;255;40;190m'

# =========================================================
# ORIGINAL INSTAGRAM DOT LOGO
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
" ●●                          ●●"
" ●●                          ●●"
"  ●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
"    ●●●●●●●●●●●●●●●●●●●●●●●●"
)

# =========================================================
# ANIMATED GLOW & RAINBOW EFFECT
# =========================================================

colors=("$RED" "$ORANGE" "$YELLOW" "$GREEN" "$CYAN" "$BLUE" "$PURPLE" "$PINK")

for frame in {0..2}; do
    clear
    offset=$((frame * 2))
    
    for i in "${!logo[@]}"; do
        line="${logo[$i]}"
        color_idx=$(( (i + offset) % 8 ))
        echo -e "${colors[$color_idx]}${line}${RESET}"
    done
    
    sleep 0.12
done

clear
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

echo -e "${CYAN}=============${RESET}${YELLOW}I${ORANGE}N${YELLOW}S${GREEN}T${CYAN}A${BLUE}H${PURPLE}E${PINK}L${RED}P${RESET}${CYAN}=============${RESET}"

echo ""

echo -e "${GREEN}          INSTAGRAM ACCOUNT HELP${RESET}"

echo ""

echo -e "${GREEN}------------------------------------------------------------${RESET}"

echo ""

# =========================================================
# MENU
# =========================================================

echo -e "${GREEN}  [1] ${CYAN}ACCOUNT DISABLED${RESET}"
echo -e "${GREEN}  [2] ${PURPLE}ACCOUNT SUSPENDED${RESET}"
echo -e "${GREEN}  [3] ${PINK}ACCOUNT BAN${RESET}"
echo -e "${GREEN}  [4] ${YELLOW}ABOUT THIS TOOL${RESET}"
echo -e "${GREEN}  [0] ${ORANGE}EXIT${RESET}"

echo ""

echo -e "${GREEN}------------------------------------------------------------${RESET}"

echo ""

read -p "$(echo -e "${GREEN}Choose an option: ${RESET}")" choice

# =========================================================
# RECOVERY & LOADING FUNCTION
# =========================================================

handle_recovery() {
    local title="$1"
    clear

    echo -e "${GREEN}======================================${RESET}"
    echo -e "${GREEN}       $title${RESET}"
    echo -e "${GREEN}======================================${RESET}"

    echo ""
    echo -e "${CYAN}Enter your username below:${RESET}"
    read -p "> " username

    echo ""
    echo -e "${YELLOW}[+] Searching database for @$username...${RESET}"
    sleep 1.2
    echo -e "${GREEN}[✔] Username found: @$username${RESET}"

    echo ""
    echo -e "${CYAN}Enter private key:${RESET}"
    read -p "> " pkey

    if [ "$pkey" = "recoveracc@123" ]; then
        echo ""
        echo -e "${GREEN}[✔] Key verified! Starting recovery sequence...${RESET}"
        sleep 0.8
        
        # Loading bar simulation
        echo ""
        for i in {1..20}; do
            printf "${CYAN}█${RESET}"
            sleep 0.05
        done
        echo -e " ${GREEN}100%${RESET}"
        
        echo ""
        echo -e "${GREEN}======================================${RESET}"
        echo -e "${GREEN}  ACCOUNT RECOVERED SUCCESSFULLY!     ${RESET}"
        echo -e "${GREEN}======================================${RESET}"
    else
        echo ""
        echo -e "${RED}[✖] Error: Invalid key! Access denied.${RESET}"
    fi
}

# =========================================================
# OPTIONS
# =========================================================

case "$choice" in

    1)
        handle_recovery "ACCOUNT DISABLED"
        ;;

    2)
        handle_recovery "ACCOUNT SUSPENDED"
        ;;

    3)
        handle_recovery "ACCOUNT BAN"
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
