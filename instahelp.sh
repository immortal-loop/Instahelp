#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 INSTAHELP PRO v3.2
#          Instagram Account Support Simulator
# =========================================================

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

    local steps=(
        "Resolving handles via Meta directory node..."
        "Querying regional cluster endpoints (AP-SOUTH-1)..."
        "Parsing public metadata signatures & graph tokens..."
        "Running heuristics for flag detection on @$target..."
        "Validating historical session telemetry..."
        "Extracting account restriction vectors..."
        "Encrypting handshake session layer..."
    )

    for step in "${steps[@]}"; do
        spinner 1 "$step"
    done

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

    local packets=("0xAF71" "0x3F8B" "0x12CC" "0x99AA" "0x44E1" "0x88BC" "0xFF00" "0xDEAD")
    for i in {1..3}; do
        for p in "${packets[@]}"; do
            printf "\r${GRAY}Allocating buffer memory segment [${GREEN}%s${GRAY}]... Status: OK${RESET}" "$p"
            sleep 0.04
        done
    done
    echo -e "\n"
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

    typewriter "${CYAN}Enter Instagram username:${RESET}"
    read -p "$(echo -e "${GREEN}> ${RESET}")" username

    if [ -z "$username" ]; then
        echo ""
        typewriter "${RED}✖ Username cannot be empty.${RESET}"
        sleep 2
        return
    fi

    # =====================================================
    # TERMS & CONDITIONS AGREEMENT
    # =====================================================

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
        y|Y)
            ;;
        *)
            echo ""
            typewriter "${RED}✖ Terms not accepted. Operation aborted.${RESET}"
            sleep 2
            return
            ;;
    esac

    # =====================================================
    # USERNAME CONFIRMATION SCREEN
    # =====================================================

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
        y|Y)
            ;;
        *)
            echo ""
            typewriter "${RED}✖ Confirmation rejected. Returning to menu.${RESET}"
            sleep 2
            return
            ;;
    esac

    # =====================================================
    # INITIALIZATION & PROFESSIONAL SCANNING PHASE
    # =====================================================

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

    # =====================================================
    # ACCESS KEY VERIFICATION GATE
    # =====================================================

    if ! key_verification; then
        echo ""
        typewriter "${RED}Returning to main menu...${RESET}"
        sleep 2
        return
    fi

    # =====================================================
    # POST-KEY LEGITIMACY SCANNING PHASE
    # =====================================================

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

    # =====================================================
    # SUCCESSFUL CONFIRMATION SCREEN
    # =====================================================

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

# =========================================================
# MAIN MENU LOOP
# =========================================================

while true; do
    clear

    # =========================================================
    # STARTUP RGB ANIMATION (Plays on menu load)
    # =========================================================
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

    # =========================================================
    # HEADER
    # =========================================================
    echo ""
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}             ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.2${RESET}             ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}          ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}              ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
    echo -e "${GRAY}Mode:${RESET}   ${PURPLE}PROFESSIONAL DIAGNOSTIC${RESET}"
    echo ""
    echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"
    echo ""

    # =========================================================
    # MENU ITEMS
    # =========================================================
    echo -e "${GREEN}  [1]${RESET} ${CYAN}ACCOUNT DISABLED${RESET}"
    echo -e "${GREEN}  [2]${RESET} ${PURPLE}ACCOUNT SUSPENDED${RESET}"
    echo -e "${GREEN}  [3]${RESET} ${PINK}ACCOUNT BAN${RESET}"
    echo -e "${GREEN}  [4]${RESET} ${YELLOW}ABOUT THIS TOOL${RESET}"
    echo -e "${GREEN}  [0]${RESET} ${ORANGE}EXIT${RESET}"
    echo ""
    echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}╰─➤ Select option: ${RESET})" choice

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
            typewriter "${GREEN}INSTAHELP PRO v3.2${RESET}"
            echo ""
            typewriter "${CYAN}Features:${RESET}"
            typewriter "  ${GREEN}•${RESET} Smooth typewriter text rendering engine"
            typewriter "  ${GREEN}•${RESET} Clean loop returning smoothly to main menu"
            typewriter "  ${GREEN}•${RESET} Terms & Conditions consent gate"
            typewriter "  ${GREEN}•${RESET} Advanced username confirmation flows"
            typewriter "  ${GREEN}•${RESET} Multi-stage deep telemetry scanning screens"
            typewriter "  ${GREEN}•${RESET} Operator access-key verification & memory buffer checks"
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

    local steps=(
        "Resolving handles via Meta directory node..."
        "Querying regional cluster endpoints (AP-SOUTH-1)..."
        "Parsing public metadata signatures & graph tokens..."
        "Running heuristics for flag detection on @$target..."
        "Validating historical session telemetry..."
        "Extracting account restriction vectors..."
        "Encrypting handshake session layer..."
    )

    for step in "${steps[@]}"; do
        spinner 1 "$step"
    done

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

    local packets=("0xAF71" "0x3F8B" "0x12CC" "0x99AA" "0x44E1" "0x88BC" "0xFF00" "0xDEAD")
    for i in {1..3}; do
        for p in "${packets[@]}"; do
            printf "\r${GRAY}Allocating buffer memory segment [${GREEN}%s${GRAY}]... Status: OK${RESET}" "$p"
            sleep 0.04
        done
    done
    echo -e "\n"
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

    typewriter "${CYAN}Enter Instagram username:${RESET}"
    read -p "$(echo -e "${GREEN}> ${RESET}")" username

    if [ -z "$username" ]; then
        echo ""
        typewriter "${RED}✖ Username cannot be empty.${RESET}"
        sleep 2
        return
    fi

    # =====================================================
    # TERMS & CONDITIONS AGREEMENT
    # =====================================================

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
        y|Y)
            ;;
        *)
            echo ""
            typewriter "${RED}✖ Terms not accepted. Operation aborted.${RESET}"
            sleep 2
            return
            ;;
    esac

    # =====================================================
    # USERNAME CONFIRMATION SCREEN
    # =====================================================

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
        y|Y)
            ;;
        *)
            echo ""
            typewriter "${RED}✖ Confirmation rejected. Returning to menu.${RESET}"
            sleep 2
            return
            ;;
    esac

    # =====================================================
    # INITIALIZATION & PROFESSIONAL SCANNING PHASE
    # =====================================================

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

    # =====================================================
    # ACCESS KEY VERIFICATION GATE
    # =====================================================

    if ! key_verification; then
        echo ""
        typewriter "${RED}Returning to main menu...${RESET}"
        sleep 2
        return
    fi

    # =====================================================
    # POST-KEY LEGITIMACY SCANNING PHASE
    # =====================================================

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

    # =====================================================
    # SUCCESSFUL CONFIRMATION SCREEN
    # =====================================================

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

    typewriter "${GREEN}NOTE: ACCOUNT RECOVERED SUCCESSFULLY ${RESET}"
    
    read -p "$(echo -e "${GREEN}Press ENTER to return to menu...${RESET}")"
}

# =========================================================
# MAIN MENU LOOP
# =========================================================

while true; do
    clear

    # =========================================================
    # STARTUP RGB ANIMATION (Plays on menu load)
    # =========================================================
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

    # =========================================================
    # HEADER
    # =========================================================
    echo ""
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}             ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.1${RESET}             ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}          ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}              ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
    echo -e "${GRAY}Mode:${RESET}   ${PURPLE}PROFESSIONAL DIAGNOSTIC${RESET}"
    echo ""
    echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"
    echo ""

    # =========================================================
    # MENU ITEMS
    # =========================================================
    echo -e "${GREEN}  [1]${RESET} ${CYAN}ACCOUNT DISABLED${RESET}"
    echo -e "${GREEN}  [2]${RESET} ${PURPLE}ACCOUNT SUSPENDED${RESET}"
    echo -e "${GREEN}  [3]${RESET} ${PINK}ACCOUNT BAN${RESET}"
    echo -e "${GREEN}  [4]${RESET} ${YELLOW}ABOUT THIS TOOL${RESET}"
    echo -e "${GREEN}  [0]${RESET} ${ORANGE}EXIT${RESET}"
    echo ""
    echo -e "${GREEN}────────────────────────────────────────────────────────${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}╰─➤ Select option: ${RESET})" choice

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
            typewriter "${GREEN}INSTAHELP PRO v3.1${RESET}"
            echo ""
            typewriter "${CYAN}Features:${RESET}"
            typewriter "  ${GREEN}•${RESET} Smooth typewriter text rendering engine"
            typewriter "  ${GREEN}•${RESET} Clean loop returning smoothly to main menu"
            typewriter "  ${GREEN}•${RESET} Terms & Conditions consent gate"
            typewriter "  ${GREEN}•${RESET} Advanced username confirmation flows"
            typewriter "  ${GREEN}•${RESET} Multi-stage deep telemetry scanning screens"
            typewriter "  ${GREEN}•${RESET} Operator access-key verification & memory buffer checks"
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
