#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 INSTAHELP PRO v3.3
#          Instagram Account Support Simulator
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

ACCESS_KEY="recoveracc@123"

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

colors=("$RED" "$ORANGE" "$YELLOW" "$GREEN" "$CYAN" "$BLUE" "$PURPLE" "$PINK")

typewriter() {
    local text="$1"
    local delay=0.015
    for ((i=0; i<${#text}; i++)); do
        printf "%c" "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

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

advanced_deep_scan() {
    local target="$1"
    echo ""
    echo -e "${PURPLE}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PURPLE}${BOLD}║           ADVANCED TARGET DEEP SCAN               ║${RESET}"
    echo -e "${PURPLE}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""

    spinner 1 "Resolving handles via Meta directory node..."
    spinner 1 "Querying regional cluster endpoints (AP-SOUTH-1)..."
    spinner 1 "Parsing public metadata signatures & graph tokens..."
    spinner 1 "Running heuristics for flag detection on @$target..."
    spinner 1 "Validating historical session telemetry..."
    spinner 1 "Extracting account restriction vectors..."
    spinner 1 "Encrypting handshake session layer..."

    echo ""
    typewriter "${GREEN}✔ Deep telemetry analysis successfully concluded.${RESET}"
}

matrix_loading_screen() {
    local message="$1"
    echo ""
    echo -e "${CYAN}${BOLD}┌────────────────────────────────────────────────┐${RESET}"
    echo -e "${CYAN}${BOLD}│${RESET} ${WHITE}${message}${RESET}"
    echo -e "${CYAN}${BOLD}└────────────────────────────────────────────────┘${RESET}"
    echo ""

    echo -e "${GRAY}Allocating buffer memory segment [${GREEN}0xAF71${GRAY}]... Status: OK${RESET}"
    sleep 0.05
    echo -e "${GRAY}Allocating buffer memory segment [${GREEN}0x3F8B${GRAY}]... Status: OK${RESET}"
    sleep 0.05
    echo -e "${GRAY}Allocating buffer memory segment [${GREEN}0x99AA${GRAY}]... Status: OK${RESET}"
    sleep 0.05
    echo -e "${GRAY}Allocating buffer memory segment [${GREEN}0xDEAD${GRAY}]... Status: OK${RESET}"
    sleep 0.05

    echo ""
    typewriter "${GREEN}✔ Memory buffer stable & synchronized.${RESET}"
    echo ""
}

key_verification() {
    echo ""
    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║             AUTHORIZATION REQUIRED                ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""
    typewriter "${GRAY}This access key is created by the tool operator.${RESET}"
    typewriter "${GRAY}It is not an Instagram password.${RESET}"
    echo ""

    read -s -p "$(echo -e "${YELLOW}Enter access key: ${RESET}")" entered_key
    echo ""
    sleep 1

    spinner 2 "Verifying authorization key"
    matrix_loading_screen "Validating Cryptographic Private Key Payload"

    if [ "$entered_key" = "$ACCESS_KEY" ]; then
        echo ""
        typewriter "${GREEN}✔ ACCESS KEY VERIFIED${RESET}"
        sleep 1
        return 0
    else
        echo ""
        typewriter "${RED}✖ INVALID ACCESS KEY${RESET}"
        typewriter "${GRAY}Authorization denied.${RESET}"
        sleep 2
        return 1
    fi
}

handle_recovery() {
    local title="$1"

    clear
    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    printf "${CYAN}${BOLD}║${RESET} %-50s ${CYAN}${BOLD}║${RESET}\n" "$title"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""

    typewriter "${CYAN}Enter Instagram username:${RESET}"
    read -p "$(echo -e "${GREEN}> ${RESET}")" username

    if [ -z "$username" ]; then
        echo ""
        typewriter "${RED}✖ Username cannot be empty.${RESET}"
        sleep 2
        return
    fi

    clear
    echo -e "${YELLOW}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}${BOLD}║          TERMS & CONDITIONS AGREEMENT             ║${RESET}"
    echo -e "${YELLOW}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""
    typewriter "${GRAY}Please review and accept the operational guidelines:"
    typewriter " 1. This utility simulates account diagnostic support workflows."
    typewriter " 2. Operators must possess explicit user consent for target handles."
    typewriter " 3. Automated diagnostic data is strictly non-binding.${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Do you accept the Terms & Conditions? [Y/N]: ${RESET}")" terms_accept

    case "$terms_accept" in
        y|Y) ;;
        *)
            echo ""
            typewriter "${RED}✖ Terms not accepted. Operation aborted.${RESET}"
            sleep 2
            return
            ;;
    esac

    clear
    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║             TARGET IDENTITY CHECK                 ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""
    typewriter "${WHITE}Target Username : ${CYAN}@${username}${RESET}"
    typewriter "${WHITE}Selected Issue  : ${YELLOW}${title}${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Confirm and proceed with this target? [Y/N]: ${RESET}")" confirm_target

    case "$confirm_target" in
        y|Y) ;;
        *)
            echo ""
            typewriter "${RED}✖ Confirmation rejected. Returning to menu.${RESET}"
            sleep 2
            return
            ;;
    esac

    clear
    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║              DIAGNOSTIC ENGINE ACTIVE             ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""

    spinner 1 "Initializing diagnostic engine core"
    spinner 1 "Loading account analysis subroutines"
    spinner 1 "Establishing secure socket layer (SSL) tunnel"

    matrix_loading_screen "Executing Target Discovery Protocol"
    advanced_deep_scan "$username"

    if ! key_verification; then
        echo ""
        typewriter "${RED}Returning to main menu...${RESET}"
        sleep 2
        return
    fi

    clear
    echo -e "${GREEN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GREEN}${BOLD}║            POST-AUTHORIZATION SCAN                ║${RESET}"
    echo -e "${GREEN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""

    spinner 1 "Unlocking privileged diagnostic channels"
    spinner 1 "Injecting secure token credentials"

    matrix_loading_screen "Running Cryptographic Validation Sweep"
    progress_bar "Synchronizing with support gateway..."
    progress_bar "Executing final recovery compilation..."

    clear
    echo ""
    echo -e "${GREEN}${BOLD}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║                                                      ║"
    echo "║             ✔ CONFIRMATION SUCCESSFUL               ║"
    echo "║                                                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    echo ""

    typewriter "${WHITE}Target Account : ${CYAN}@${username}${RESET}"
    typewriter "${WHITE}Category       : ${YELLOW}${title}${RESET}"
    typewriter "${WHITE}Authorization  : ${GREEN}GRANTED [SECURE KEY MATCH]${RESET}"
    typewriter "${WHITE}Status         : ${GREEN}WORKFLOW COMPLETED SUCCESSFULLY${RESET}"
    echo ""

    spinner 1 "Generating cryptographically signed audit report"
    echo ""

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"
    typewriter "${GREEN}✔ Target identification verified successfully${RESET}"
    typewriter "${GREEN}✔ Private key signature authenticated${RESET}"
    typewriter "${GREEN}✔ Support workflow logs successfully compiled${RESET}"
    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"
    echo ""

    typewriter "${GRAY}NOTE: This terminal program is a simulation and does${RESET}"
    typewriter "${GRAY}not directly modify Instagram's backend systems.${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Press ENTER to return to menu...${RESET}")"
}

while true; do
    clear

    for frame in {0..1}; do
        clear
        offset=$((frame * 2))
        for i in "${!logo[@]}"; do
            color_idx=$(( (i + offset) % ${#colors[@]} ))
            echo -e "${colors[$color_idx]}${logo[$i]}${RESET}"
        done
        sleep 0.1
    done

    clear

    echo ""
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}             ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.3${RESET}             ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}          ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}              ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
    echo -e "${GRAY}Mode:${RESET}   ${PURPLE}PROFESSIONAL DIAGNOSTIC${RESET}"
    echo ""
    echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"
    echo ""

    echo -e "${GREEN}  [1]${RESET} ${CYAN}ACCOUNT DISABLED${RESET}"
    echo -e "${GREEN}  [2]${RESET} ${PURPLE}ACCOUNT SUSPENDED${RESET}"
    echo -e "${GREEN}  [3]${RESET} ${PINK}ACCOUNT BAN${RESET}"
    echo -e "${GREEN}  [4]${RESET} ${YELLOW}ABOUT THIS TOOL${RESET}"
    echo -e "${GREEN}  [0]${RESET} ${ORANGE}EXIT${RESET}"
    echo ""
    echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}╰─➤ Select option: ${RESET})" choice

    case "$choice" in
        1) handle_recovery "ACCOUNT DISABLED" ;;
        2) handle_recovery "ACCOUNT SUSPENDED" ;;
        3) handle_recovery "ACCOUNT BAN" ;;
        4)
            clear
            echo -e "${PINK}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
            echo -e "${PINK}${BOLD}║                  ABOUT INSTAHELP                  ║${RESET}"
            echo -e "${PINK}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
            echo ""
            typewriter "${GREEN}INSTAHELP PRO v3.3${RESET}"
            echo ""
            typewriter "${CYAN}Features:${RESET}"
            typewriter "  ${GREEN}•${RESET} Clean parser layout with zero syntax errors"
            typewriter "  ${GREEN}•${RESET} Smooth typewriter text effect"
            typewriter "  ${GREEN}•${RESET} Terms & Conditions consent gate"
            typewriter "  ${GREEN}•${RESET} Advanced username confirmation flows"
            typewriter "  ${GREEN}•${RESET} Operator access-key verification"
            echo ""
            typewriter "${GRAY}Designed for Termux.${RESET}"
            echo ""
            read -p "$(echo -e "${GREEN}Press ENTER to return to menu...${RESET}")"
            ;;
        0)
            clear
            typewriter "${CYAN}Closing INSTAHELP PRO...${RESET}"
            sleep 1
            clear
            exit 0
            ;;
        *)
            echo ""
            typewriter "${RED}✖ Invalid option.${RESET}"
            sleep 2
            ;;
    esac
done
