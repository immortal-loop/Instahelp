#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 INSTAHELP PRO v3.0
#          ADVANCED TERMINAL SUPPORT UI
# =========================================================

# ---------------- COLORS ----------------

RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

RED='\033[38;2;255;45;45m'
ORANGE='\033[38;2;255;150;0m'
YELLOW='\033[38;2;255;235;0m'
GREEN='\033[38;2;40;255;90m'
CYAN='\033[38;2;0;220;255m'
BLUE='\033[38;2;60;100;255m'
PURPLE='\033[38;2;180;60;255m'
PINK='\033[38;2;255;40;190m'
WHITE='\033[38;2;255;255;255m'
GRAY='\033[38;2;125;125;125m'

# =========================================================
# OPERATOR ACCESS KEY
# =========================================================

ACCESS_KEY="recoveracc@123"

# =========================================================
# TERMINAL SETTINGS
# =========================================================

ESC='\033'
HIDE_CURSOR="${ESC}[?25l"
SHOW_CURSOR="${ESC}[?25h"

trap 'printf "$SHOW_CURSOR"; exit' INT TERM EXIT

printf "$HIDE_CURSOR"

# =========================================================
# BASIC FUNCTIONS
# =========================================================

line() {
    echo -e "${GREEN}────────────────────────────────────────────────────────────${RESET}"
}

header() {
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}              ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.0${RESET}             ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}             ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}             ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"
}

spinner() {

    local duration="$1"
    local message="$2"

    local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

    local start=$SECONDS
    local i=0

    while [ $((SECONDS-start)) -lt "$duration" ]; do

        printf "\r${CYAN}${frames[$i]}${RESET} ${WHITE}%-58s${RESET}" "$message"

        i=$(( (i+1) % ${#frames[@]} ))

        sleep 0.07

    done

    printf "\r${GREEN}✔${RESET} ${WHITE}%-58s${RESET}\n" "$message"
}


progress() {

    local title="$1"
    local width=36

    printf "${CYAN}%-35s${RESET} " "$title"

    for ((i=0;i<=width;i++)); do

        percent=$((i*100/width))

        filled=$(printf "%${i}s" | tr ' ' '█')
        empty=$(printf "%$((width-i))s" | tr ' ' '░')

        printf "\r${CYAN}%-35s${RESET} ${GREEN}%s${GRAY}%s${RESET} ${YELLOW}%3d%%${RESET}" \
        "$title" "$filled" "$empty" "$percent"

        sleep 0.035

    done

    echo
}


scan() {

    echo ""

    echo -e "${PURPLE}${BOLD}╭──────────────────── USERNAME SCANNER ────────────────────╮${RESET}"

    local frames=(
        "▱────────────"
        "━▱───────────"
        "━━━▱─────────"
        "━━━━━▱───────"
        "━━━━━━━▱─────"
        "━━━━━━━━━▱───"
        "━━━━━━━━━━━▱─"
        "━━━━━━━━━━━━━"
    )

    for round in {1..5}; do

        for frame in "${frames[@]}"; do

            printf "\r${PURPLE}│${RESET} ${CYAN}Scanning${RESET} ${GREEN}${frame}${RESET} ${GRAY}Analyzing target...${RESET}"

            sleep 0.07

        done

    done

    printf "\r${PURPLE}│${RESET} ${GREEN}✔ Scan completed successfully${RESET}                         \n"

    echo -e "${PURPLE}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}"
}


verify_key() {

    echo ""

    echo -e "${YELLOW}${BOLD}╭──────────────────── AUTHORIZATION ───────────────────────╮${RESET}"

    echo -e "${YELLOW}│${RESET} ${WHITE}Operator authorization required to continue.${RESET}"
    echo -e "${YELLOW}│${RESET} ${GRAY}This is the local access key configured by you.${RESET}"

    echo -e "${YELLOW}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}"

    echo ""

    read -s -p "$(echo -e "${CYAN}Access key ➜ ${RESET}")" entered

    echo ""

    spinner 2 "Verifying operator authorization"

    if [ "$entered" = "$ACCESS_KEY" ]; then

        echo -e "${GREEN}✔ Authorization accepted${RESET}"

        sleep 1

        return 0

    else

        echo -e "${RED}✖ Authorization rejected${RESET}"

        sleep 1

        return 1

    fi
}


# =========================================================
# STARTUP
# =========================================================

clear

header

echo ""

echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
echo -e "${GRAY}Engine:${RESET} ${CYAN}DIAGNOSTIC v3.0${RESET}"
echo -e "${GRAY}Mode:${RESET}   ${PURPLE}SUPPORT SIMULATION${RESET}"

echo ""

line

echo ""

# =========================================================
# MENU
# =========================================================

echo -e "${GREEN}${BOLD}[1]${RESET} ${CYAN}ACCOUNT DISABLED${RESET}"
echo -e "${GREEN}${BOLD}[2]${RESET} ${PURPLE}ACCOUNT SUSPENDED${RESET}"
echo -e "${GREEN}${BOLD}[3]${RESET} ${PINK}ACCOUNT BAN${RESET}"
echo -e "${GREEN}${BOLD}[4]${RESET} ${YELLOW}ABOUT${RESET}"
echo -e "${GREEN}${BOLD}[0]${RESET} ${RED}EXIT${RESET}"

echo ""

line

echo ""

read -p "$(echo -e "${GREEN}╰─➤ Select diagnostic type: ${RESET}")" choice


# =========================================================
# CASE SYSTEM
# =========================================================

case "$choice" in

1)
    ISSUE="ACCOUNT DISABLED"
    ISSUE_COLOR="$CYAN"
    ;;

2)
    ISSUE="ACCOUNT SUSPENDED"
    ISSUE_COLOR="$PURPLE"
    ;;

3)
    ISSUE="ACCOUNT BAN"
    ISSUE_COLOR="$PINK"
    ;;

4)

    clear

    header

    echo ""

    echo -e "${PINK}${BOLD}ABOUT INSTAHELP PRO${RESET}"

    echo ""

    echo -e "${WHITE}Version:${RESET} 3.0"
    echo -e "${WHITE}Platform:${RESET} Termux"
    echo -e "${WHITE}Engine:${RESET} Diagnostic UI"

    echo ""

    echo -e "${GREEN}Features${RESET}"
    echo -e " ${CYAN}•${RESET} Single-page diagnostic interface"
    echo -e " ${CYAN}•${RESET} Animated username scanner"
    echo -e " ${CYAN}•${RESET} Operator authorization"
    echo -e " ${CYAN}•${RESET} Live progress indicators"
    echo -e " ${CYAN}•${RESET} RGB terminal interface"
    echo -e " ${CYAN}•${RESET} Multi-stage workflow"

    echo ""

    echo -e "${GRAY}This program is a terminal UI/support simulation.${RESET}"

    echo ""

    read -p "$(echo -e "${GREEN}Press ENTER to exit...${RESET}")"

    exit 0
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
    exit 0
    ;;

esac


# =========================================================
# MAIN SINGLE-PAGE WORKFLOW
# =========================================================

clear

header

echo ""

echo -e "${GRAY}Selected issue:${RESET} ${ISSUE_COLOR}${BOLD}${ISSUE}${RESET}"

echo ""

line

echo ""

# =========================================================
# USERNAME
# =========================================================

echo -e "${CYAN}${BOLD}TARGET IDENTIFICATION${RESET}"

echo ""

read -p "$(echo -e "${GREEN}Username ➜ ${RESET}")" username

if [ -z "$username" ]; then

    echo ""
    echo -e "${RED}✖ Username cannot be empty.${RESET}"

    sleep 2

    exit

fi

echo ""

echo -e "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}"

echo ""

# =========================================================
# INITIALIZATION
# =========================================================

spinner 1 "Initializing diagnostic engine"

spinner 1 "Loading account analysis modules"

spinner 1 "Preparing username scanner"

spinner 1 "Creating diagnostic session"

echo ""

# =========================================================
# CONFIRMATION
# =========================================================

echo -e "${YELLOW}${BOLD}╭──────────────────── TARGET CONFIRMATION ────────────────╮${RESET}"

echo -e "${YELLOW}│${RESET} Username : ${CYAN}@${username}${RESET}"
echo -e "${YELLOW}│${RESET} Issue    : ${ISSUE_COLOR}${ISSUE}${RESET}"

echo -e "${YELLOW}│${RESET}"
echo -e "${YELLOW}│${RESET} Is this your username?"
echo -e "${YELLOW}│${RESET} Have you authorized this diagnostic?"

echo -e "${YELLOW}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}"

echo ""

read -p "$(echo -e "${GREEN}Continue? [Y/N] ➜ ${RESET}")" confirm

case "$confirm" in

y|Y)
    ;;

n|N)

    echo ""
    echo -e "${RED}✖ Diagnostic cancelled.${RESET}"
    sleep 2
    exit
    ;;

*)

    echo ""
    echo -e "${RED}✖ Please enter Y or N.${RESET}"
    sleep 2
    exit
    ;;

esac

# =========================================================
# SCANNING
# =========================================================

echo ""

line

echo ""

echo -e "${CYAN}${BOLD}DIAGNOSTIC ENGINE${RESET}"

echo ""

spinner 1 "Starting scan sequence"

spinner 1 "Analyzing username structure"

spinner 1 "Checking account status indicators"

spinner 1 "Analyzing available account information"

scan

# =========================================================
# RESULTS
# =========================================================

echo ""

echo -e "${GREEN}${BOLD}╭──────────────────── SCAN RESULTS ────────────────────────╮${RESET}"

sleep 0.3
echo -e "${GREEN}│${RESET} ✔ Username format valid"
sleep 0.3
echo -e "${GREEN}│${RESET} ✔ Target accepted"
sleep 0.3
echo -e "${GREEN}│${RESET} ✔ Diagnostic scan completed"
sleep 0.3
echo -e "${GREEN}│${RESET} ✔ Username found: ${CYAN}@${username}${RESET}"

echo -e "${GREEN}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}"

sleep 1

# =========================================================
# ACCESS KEY
# =========================================================

verify_key

if [ $? -ne 0 ]; then

    echo ""

    echo -e "${RED}Returning to main menu...${RESET}"

    sleep 2

    exit

fi

# =========================================================
# AUTHORIZED PROCESS
# =========================================================

echo ""

line

echo ""

echo -e "${GREEN}${BOLD}AUTHORIZED WORKFLOW${RESET}"

echo ""

spinner 1 "Loading recovery workflow"

spinner 1 "Preparing support procedure"

spinner 1 "Generating diagnostic report"

echo ""

# =========================================================
# PROGRESS
# =========================================================

progress "Processing ${ISSUE}"

progress "Preparing support workflow"

progress "Finalizing diagnostic report"

# =========================================================
# FINAL RESULT
# =========================================================

echo ""

line

echo ""

echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}${BOLD}║                                                        ║${RESET}"
echo -e "${GREEN}${BOLD}║              ✔ PROCESS COMPLETED                       ║${RESET}"
echo -e "${GREEN}${BOLD}║                                                        ║${RESET}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"

echo ""

echo -e "${WHITE}Username :${RESET} ${CYAN}@${username}${RESET}"
echo -e "${WHITE}Issue    :${RESET} ${ISSUE_COLOR}${ISSUE}${RESET}"
echo -e "${WHITE}Status   :${RESET} ${GREEN}WORKFLOW COMPLETED${RESET}"

echo ""

spinner 1 "Generating final report"

echo ""

echo -e "${CYAN}╭──────────────────── FINAL STATUS ────────────────────────╮${RESET}"
echo -e "${CYAN}│${RESET} ${GREEN}✔ Username verified${RESET}"
echo -e "${CYAN}│${RESET} ${GREEN}✔ Authorization verified${RESET}"
echo -e "${CYAN}│${RESET} ${GREEN}✔ Diagnostic completed${RESET}"
echo -e "${CYAN}│${RESET} ${GREEN}✔ Support workflow completed${RESET}"
echo -e "${CYAN}╰──────────────────────────────────────────────────────────╯${RESET}"

echo ""

echo -e "${GRAY}This terminal program simulates a support/recovery workflow;${RESET}"
echo -e "${GRAY}it does not directly modify Instagram's backend systems.${RESET}"

echo ""

read -p "$(echo -e "${GREEN}Press ENTER to exit...${RESET}")"

printf "$SHOW_CURSOR"
clear# =========================================================

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

    echo -e "${GREEN} YOUR REQUEST HAS BEEN COMPLETED.${RESET}"

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
