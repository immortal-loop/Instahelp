#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 INSTAHELP PRO v2.0
#          Instagram Account Support Simulator
# =========================================================

clear

# =========================================================
# COLORS
# =========================================================

RESET='\033[0m'
BOLD='\033[1m'

RED='\033[38;2;255;45;45m'
ORANGE='\033[38;2;255;150;0m'
YELLOW='\033[38;2;255;235;0m'
GREEN='\033[38;2;40;255;90m'
CYAN='\033[38;2;0;220;255m'
BLUE='\033[38;2;60;100;255m'
PURPLE='\033[38;2;180;60;255m'
PINK='\033[38;2;255;40;190m'
WHITE='\033[38;2;255;255;255m'
GRAY='\033[38;2;130;130;130m'

# =========================================================
# YOUR PRIVATE ACCESS KEY
# Change this to your own key
# =========================================================

ACCESS_KEY="recoveracc@123"

# =========================================================
# INSTAGRAM-STYLE LOGO
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

colors=(
"$RED"
"$ORANGE"
"$YELLOW"
"$GREEN"
"$CYAN"
"$BLUE"
"$PURPLE"
"$PINK"
)

# =========================================================
# FUNCTIONS
# =========================================================

spinner() {

    local duration="$1"
    local message="$2"

    local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

    local start=$SECONDS
    local i=0

    while [ $((SECONDS-start)) -lt "$duration" ]; do

        printf "\r${CYAN}${frames[$i]}${RESET} ${WHITE}%-55s${RESET}" "$message"

        i=$(( (i+1) % ${#frames[@]} ))

        sleep 0.08

    done

    printf "\r${GREEN}✔${RESET} ${WHITE}%-55s${RESET}\n" "$message"
}


progress_bar() {

    local title="$1"
    local width=40

    echo ""
    echo -e "${CYAN}${title}${RESET}"

    for ((i=0;i<=width;i++)); do

        percent=$((i*100/width))

        filled=$(printf "%${i}s" | tr ' ' '█')
        empty=$(printf "%$((width-i))s" | tr ' ' '░')

        printf "\r${GREEN}${filled}${GRAY}${empty}${RESET} ${YELLOW}%3d%%${RESET}" "$percent"

        sleep 0.045

    done

    echo
}


scan_animation() {

    echo ""

    echo -e "${PURPLE}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PURPLE}${BOLD}║              USERNAME SCANNER                     ║${RESET}"
    echo -e "${PURPLE}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    local frames=(
        "[■□□□□□□□□□]"
        "[■■□□□□□□□□]"
        "[■■■□□□□□□□]"
        "[■■■■□□□□□□]"
        "[■■■■■□□□□□]"
        "[■■■■■■□□□□]"
        "[■■■■■■■□□□]"
        "[■■■■■■■■□□]"
        "[■■■■■■■■■□]"
        "[■■■■■■■■■■]"
    )

    for round in {1..4}; do

        for frame in "${frames[@]}"; do

            printf "\r${CYAN}Scanning ${frame}${RESET}"

            sleep 0.08

        done

    done

    echo ""

    echo -e "${GREEN}✔ Username scan completed${RESET}"
}


success_animation() {

    clear

    echo ""

    echo -e "${GREEN}${BOLD}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║                                                      ║"
    echo "║             ✔ USERNAME FOUND                        ║"
    echo "║                                                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${RESET}"

    echo ""

    spinner 1 "Finalizing username verification"

    spinner 1 "Preparing secure diagnostic channel"

    echo ""

}


key_verification() {

    echo ""

    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║             AUTHORIZATION REQUIRED                ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${GRAY}This access key is created by the tool operator.${RESET}"
    echo -e "${GRAY}It is not an Instagram password.${RESET}"

    echo ""

    read -s -p "$(echo -e "${YELLOW}Enter access key: ${RESET}")" entered_key

    echo ""

    sleep 1

    spinner 2 "Verifying authorization key"

    if [ "$entered_key" = "$ACCESS_KEY" ]; then

        echo ""
        echo -e "${GREEN}✔ ACCESS KEY VERIFIED${RESET}"

        sleep 1

        return 0

    else

        echo ""
        echo -e "${RED}✖ INVALID ACCESS KEY${RESET}"
        echo -e "${GRAY}Authorization denied.${RESET}"

        sleep 2

        return 1

    fi
}


# =========================================================
# RECOVERY / DIAGNOSTIC FLOW
# =========================================================

handle_recovery() {

    local title="$1"

    clear

    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    printf "${CYAN}${BOLD}║${RESET} %-50s ${CYAN}${BOLD}║${RESET}\n" "$title"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${CYAN}Enter Instagram username:${RESET}"

    read -p "$(echo -e "${GREEN}> ${RESET}")" username

    if [ -z "$username" ]; then

        echo ""
        echo -e "${RED}✖ Username cannot be empty.${RESET}"

        sleep 2

        return

    fi

    # =====================================================
    # INITIALIZATION
    # =====================================================

    echo ""

    spinner 1 "Initializing diagnostic engine"

    spinner 1 "Loading account analysis modules"

    spinner 1 "Preparing username scanner"

    spinner 1 "Establishing secure diagnostic session"

    echo ""

    echo -e "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}"

    sleep 1

    # =====================================================
    # CONFIRMATION
    # =====================================================

    echo ""

    echo -e "${YELLOW}${BOLD}┌────────────────────────────────────────────────┐${RESET}"
    echo -e "${YELLOW}│                                                │${RESET}"
    echo -e "${YELLOW}│${RESET} Username: ${CYAN}@${username}${RESET}"
    echo -e "${YELLOW}│${RESET}"
    echo -e "${YELLOW}│${RESET} Is this your username?"
    echo -e "${YELLOW}│${RESET}"
    echo -e "${YELLOW}│${RESET} Have you authorized this diagnostic?"
    echo -e "${YELLOW}│${RESET}"
    echo -e "${YELLOW}└────────────────────────────────────────────────┘${RESET}"

    echo ""

    read -p "$(echo -e "${GREEN}Continue diagnosis? [Y/N]: ${RESET}")" confirm

    case "$confirm" in

        y|Y)

            ;;

        n|N)

            echo ""
            echo -e "${RED}✖ Diagnostic cancelled.${RESET}"

            sleep 2

            return

            ;;

        *)

            echo ""
            echo -e "${RED}✖ Invalid choice.${RESET}"

            sleep 2

            return

            ;;

    esac

    # =====================================================
    # SCANNING
    # =====================================================

    clear

    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║              DIAGNOSTIC STARTED                   ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    spinner 1 "Loading scan environment"

    spinner 1 "Analyzing username structure"

    spinner 1 "Checking account status indicators"

    spinner 1 "Analyzing public account information"

    scan_animation

    # =====================================================
    # RESULT
    # =====================================================

    echo ""

    echo -e "${GREEN}┌─ SCAN RESULT ──────────────────────────────────────┐${RESET}"

    sleep 0.5

    echo -e "${GREEN}│ ✔ Username format valid${RESET}"

    sleep 0.4

    echo -e "${GREEN}│ ✔ Username accepted${RESET}"

    sleep 0.4

    echo -e "${GREEN}│ ✔ Diagnostic scan completed${RESET}"

    echo -e "${GREEN}└─────────────────────────────────────────────────────┘${RESET}"

    sleep 1

    success_animation

    echo -e "${WHITE}Username:${RESET} ${CYAN}@${username}${RESET}"

    echo -e "${WHITE}Result:${RESET}   ${GREEN}FOUND${RESET}"

    echo ""

    sleep 2

    # =====================================================
    # ACCESS KEY
    # =====================================================

    if ! key_verification; then

        echo ""

        echo -e "${RED}Returning to main menu...${RESET}"

        sleep 2

        return

    fi

    # =====================================================
    # RECOVERY SIMULATION
    # =====================================================

    clear

    echo -e "${GREEN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GREEN}${BOLD}║              PROCESS AUTHORIZED                   ║${RESET}"
    echo -e "${GREEN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Account:${RESET} ${CYAN}@${username}${RESET}"

    echo -e "${WHITE}Issue:${RESET}   ${YELLOW}${title}${RESET}"

    echo ""

    spinner 1 "Loading recovery procedure"

    spinner 1 "Preparing account support workflow"

    spinner 1 "Generating diagnostic report"

    progress_bar "Processing support request..."

    progress_bar "Applying recovery workflow..."

    progress_bar "Finalizing operation..."

    # =====================================================
    # FINAL RESULT
    # =====================================================

    clear

    echo ""

    echo -e "${GREEN}${BOLD}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║                                                      ║"
    echo "║              ✔ PROCESS COMPLETED                    ║"
    echo "║                                                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${RESET}"

    echo ""

    echo -e "${WHITE}Username:${RESET} ${CYAN}@${username}${RESET}"

    echo -e "${WHITE}Issue:${RESET}    ${YELLOW}${title}${RESET}"

    echo -e "${WHITE}Status:${RESET}   ${GREEN}RECOVERY WORKFLOW COMPLETED${RESET}"

    echo ""

    spinner 1 "Generating final support report"

    echo ""

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"

    echo -e "${GREEN}✔ Diagnostic completed successfully${RESET}"

    echo -e "${GREEN}✔ Recovery workflow completed${RESET}"

    echo -e "${GREEN}✔ Support report generated${RESET}"

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"

    echo ""

    echo -e "${GRAY}NOTE: This terminal program is a simulation and does${RESET}"
    echo -e "${GRAY}not directly modify Instagram's backend systems.${RESET}"

    echo ""

    read -p "$(echo -e "${GREEN}Press ENTER to return to menu...${RESET}")"

}


# =========================================================
# STARTUP RGB ANIMATION
# =========================================================

for frame in {0..3}; do

    clear

    offset=$((frame * 2))

    for i in "${!logo[@]}"; do

        color_idx=$(( (i + offset) % ${#colors[@]} ))

        echo -e "${colors[$color_idx]}${logo[$i]}${RESET}"

    done

    sleep 0.12

done

clear

# =========================================================
# HEADER
# =========================================================

echo ""

echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}${BOLD}║${RESET}             ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v2.0${RESET}             ${CYAN}${BOLD}║${RESET}"
echo -e "${CYAN}${BOLD}║${RESET}          ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}              ${CYAN}${BOLD}║${RESET}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"

echo ""

echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
echo -e "${GRAY}Mode:${RESET}   ${PURPLE}DIAGNOSTIC${RESET}"

echo ""

echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"

echo ""

# =========================================================
# MENU
# =========================================================

echo -e "${GREEN}  [1]${RESET} ${CYAN}ACCOUNT DISABLED${RESET}"
echo -e "${GREEN}  [2]${RESET} ${PURPLE}ACCOUNT SUSPENDED${RESET}"
echo -e "${GREEN}  [3]${RESET} ${PINK}ACCOUNT BAN${RESET}"
echo -e "${GREEN}  [4]${RESET} ${YELLOW}ABOUT THIS TOOL${RESET}"
echo -e "${GREEN}  [0]${RESET} ${ORANGE}EXIT${RESET}"

echo ""

echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"

echo ""

read -p "$(echo -e "${GREEN}╰─➤ Select option: ${RESET}")" choice

# =========================================================
# CASE SYSTEM
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

        echo -e "${PINK}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
        echo -e "${PINK}${BOLD}║                  ABOUT INSTAHELP                  ║${RESET}"
        echo -e "${PINK}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

        echo ""

        echo -e "${GREEN}INSTAHELP PRO v2.0${RESET}"

        echo ""

        echo -e "${CYAN}Features:${RESET}"
        echo -e "  ${GREEN}•${RESET} RGB animated interface"
        echo -e "  ${GREEN}•${RESET} Username confirmation"
        echo -e "  ${GREEN}•${RESET} Multi-stage scanning"
        echo -e "  ${GREEN}•${RESET} Username detection animation"
        echo -e "  ${GREEN}•${RESET} Operator access-key verification"
        echo -e "  ${GREEN}•${RESET} Recovery workflow simulation"
        echo -e "  ${GREEN}•${RESET} Animated progress bars"
        echo -e "  ${GREEN}•${RESET} Professional terminal UI"

        echo ""

        echo -e "${GRAY}Designed for Termux.${RESET}"

        echo ""

        read -p "$(echo -e "${GREEN}Press ENTER to exit...${RESET}")"

        ;;

    0)

        clear

        echo -e "${CYAN}Closing INSTAHELP PRO...${RESET}"

        sleep 1

        clear

        exit 0

        ;;

    *)

        echo ""

        echo -e "${RED}✖ Invalid option.${RESET}"

        sleep 2

        ;;

esac
