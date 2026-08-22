#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 INSTAHELP PRO v3.0
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
    echo -e "${GREEN}✔ Deep telemetry analysis successfully concluded.${RESET}"
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
    echo -e "\n${GREEN}✔ Memory buffer stable & synchronized.${RESET}\n"
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

    matrix_loading_screen "Validating Cryptographic Private Key Payload"

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
    # TERMS & CONDITIONS AGREEMENT
    # =====================================================

    clear

    echo -e "${YELLOW}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}${BOLD}║          TERMS & CONDITIONS AGREEMENT             ║${RESET}"
    echo -e "${YELLOW}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GRAY}Please review and accept the operational guidelines:"
    echo -e " 1. This utility simulates account diagnostic support workflows."
    echo -e " 2. Operators must possess explicit user consent for target handles."
    echo -e " 3. Automated diagnostic data is strictly non-binding.${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Do you accept the Terms & Conditions? [Y/N]: ${RESET}")" terms_accept

    case "$terms_accept" in
        y|Y)
            ;;
        *)
            echo ""
            echo -e "${RED}✖ Terms not accepted. Operation aborted.${RESET}"
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
    echo -e "${WHITE}Target Username : ${CYAN}@${username}${RESET}"
    echo -e "${WHITE}Selected Issue  : ${YELLOW}${title}${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Confirm and proceed with this target? [Y/N]: ${RESET}")" confirm_target

    case "$confirm_target" in
        y|Y)
            ;;
        *)
            echo ""
            echo -e "${RED}✖ Confirmation rejected. Returning to menu.${RESET}"
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
        echo -e "${RED}Returning to main menu...${RESET}"
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

    echo -e "${WHITE}Target Account :${RESET} ${CYAN}@${username}${RESET}"
    echo -e "${WHITE}Category       :${RESET} ${YELLOW}${title}${RESET}"
    echo -e "${WHITE}Authorization  :${RESET} ${GREEN}GRANTED [SECURE KEY MATCH]${RESET}"
    echo -e "${WHITE}Status         :${RESET} ${GREEN}WORKFLOW COMPLETED SUCCESSFULLY${RESET}"

    echo ""

    spinner 1 "Generating cryptographically signed audit report"

    echo ""

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"
    echo -e "${GREEN}✔ Target identification verified successfully${RESET}"
    echo -e "${GREEN}✔ Private key signature authenticated${RESET}"
    echo -e "${GREEN}✔ Support workflow logs successfully compiled${RESET}"
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
echo -e "${CYAN}${BOLD}║${RESET}             ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.0${RESET}             ${CYAN}${BOLD}║${RESET}"
echo -e "${CYAN}${BOLD}║${RESET}          ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}              ${CYAN}${BOLD}║${RESET}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"

echo ""

echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
echo -e "${GRAY}Mode:${RESET}   ${PURPLE}PROFESSIONAL DIAGNOSTIC${RESET}"

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

        echo -e "${GREEN}INSTAHELP PRO v3.0${RESET}"

        echo ""

        echo -e "${CYAN}Features:${RESET}"
        echo -e "  ${GREEN}•${RESET} RGB animated interface"
        echo -e "  ${GREEN}•${RESET} Terms & Conditions consent gate"
        echo -e "  ${GREEN}•${RESET} Advanced username confirmation flows"
        echo -e "  ${GREEN}•${RESET} Multi-stage deep telemetry scanning screens"
        echo -e "  ${GREEN}•${RESET} Operator access-key verification & memory buffer checks"
        echo -e "  ${GREEN}•${RESET} Post-authorization security validation sweeps"
        echo -e "  ${GREEN}•${RESET} Professional confirmation success banner"

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
# RGB INSTAGRAM LOGO
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
# RGB LOGO ANIMATION
# =========================================================

rgb_logo() {

    local colors=(
        "$RED"
        "$ORANGE"
        "$YELLOW"
        "$GREEN"
        "$CYAN"
        "$BLUE"
        "$PURPLE"
        "$PINK"
    )

    # Short RGB animation
    for frame in 0 1 2; do

        clear

        local offset=$((frame * 2))

        for i in "${!logo[@]}"; do

            local color_index=$(( (i + offset) % ${#colors[@]} ))

            printf "%b%s%b\n" \
                "${colors[$color_index]}" \
                "${logo[$i]}" \
                "$RESET"

        done

        sleep 0.12

    done

    # Final logo
    clear

    local i=0

    for line_text in "${logo[@]}"; do

        case $((i % 8)) in

            0)
                printf "%b%s%b\n" "$YELLOW" "$line_text" "$RESET"
                ;;

            1)
                printf "%b%s%b\n" "$ORANGE" "$line_text" "$RESET"
                ;;

            2)
                printf "%b%s%b\n" "$RED" "$line_text" "$RESET"
                ;;

            3)
                printf "%b%s%b\n" "$PINK" "$line_text" "$RESET"
                ;;

            4)
                printf "%b%s%b\n" "$PURPLE" "$line_text" "$RESET"
                ;;

            5)
                printf "%b%s%b\n" "$BLUE" "$line_text" "$RESET"
                ;;

            6)
                printf "%b%s%b\n" "$CYAN" "$line_text" "$RESET"
                ;;

            7)
                printf "%b%s%b\n" "$GREEN" "$line_text" "$RESET"
                ;;

        esac

        ((i++))

    done

    sleep 0.8
}

# =========================================================
# BASIC UI FUNCTIONS
# =========================================================

line() {

    printf "${GREEN}────────────────────────────────────────────────────────────${RESET}\n"

}

header() {

    printf "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}\n"

    printf "${CYAN}${BOLD}║${RESET}              ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.0${RESET}             ${CYAN}${BOLD}║${RESET}\n"

    printf "${CYAN}${BOLD}║${RESET}             ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}             ${CYAN}${BOLD}║${RESET}\n"

    printf "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}\n"

}

info() {

    printf "${CYAN}[*]${RESET} %s\n" "$1"

}

success() {

    printf "${GREEN}[✓]${RESET} %s\n" "$1"

}

warning() {

    printf "${YELLOW}[!]${RESET} %s\n" "$1"

}

error() {

    printf "${RED}[-]${RESET} %s\n" "$1"

}

# =========================================================
# SPINNER
# =========================================================

spinner() {

    local duration="$1"
    local message="$2"

    local frames=(
        "⠋"
        "⠙"
        "⠹"
        "⠸"
        "⠼"
        "⠴"
        "⠦"
        "⠧"
        "⠇"
        "⠏"
    )

    local start=$SECONDS
    local i=0

    while [ $((SECONDS-start)) -lt "$duration" ]; do

        printf "\r${CYAN}${frames[$i]}${RESET} ${WHITE}%-58s${RESET}" "$message"

        i=$(( (i + 1) % ${#frames[@]} ))

        sleep 0.07

    done

    printf "\r${GREEN}✔${RESET} ${WHITE}%-58s${RESET}\n" "$message"

}

# =========================================================
# PROGRESS BAR
# =========================================================

progress() {

    local title="$1"
    local width=30

    for ((i=0; i<=width; i++)); do

        local percent=$((i * 100 / width))

        local filled
        local empty

        filled=$(printf "%${i}s" | tr ' ' '█')
        empty=$(printf "%$((width-i))s" | tr ' ' '░')

        printf "\r${CYAN}%-34s${RESET} ${GREEN}%s${GRAY}%s${RESET} ${YELLOW}%3d%%${RESET}" \
            "$title" \
            "$filled" \
            "$empty" \
            "$percent"

        sleep 0.035

    done

    printf "\n"

}

# =========================================================
# USERNAME SCANNER
# =========================================================

scan() {

    printf "\n"

    printf "${PURPLE}${BOLD}╭──────────────────── USERNAME SCANNER ────────────────────╮${RESET}\n"

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

    printf "${PURPLE}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}\n"

}

# =========================================================
# ACCESS KEY VERIFICATION
# =========================================================

verify_key() {

    printf "\n"

    printf "${YELLOW}${BOLD}╭──────────────────── AUTHORIZATION ───────────────────────╮${RESET}\n"

    printf "${YELLOW}│${RESET} ${WHITE}Operator authorization required to continue.${RESET}\n"

    printf "${YELLOW}│${RESET} ${GRAY}This is the local access key configured by you.${RESET}\n"

    printf "${YELLOW}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}\n"

    printf "\n"

    read -r -s -p "$(printf "${CYAN}Access key ➜ ${RESET}")" entered

    printf "\n"

    spinner 2 "Verifying operator authorization"

    if [ "$entered" = "$ACCESS_KEY" ]; then

        success "Authorization accepted."

        sleep 1

        return 0

    else

        error "Authorization rejected."

        sleep 1

        return 1

    fi

}

# =========================================================
# ACCOUNT DIAGNOSTIC
# =========================================================

diagnose_account() {

    local issue="$1"
    local issue_color="$2"

    clear

    header

    printf "\n"

    printf "${GRAY}Selected issue:${RESET} ${issue_color}${BOLD}${issue}${RESET}\n"

    printf "\n"

    line

    printf "\n"

    # -----------------------------------------------------
    # USERNAME
    # -----------------------------------------------------

    printf "${CYAN}${BOLD}TARGET IDENTIFICATION${RESET}\n"

    printf "\n"

    read -r -p "$(printf "${GREEN}Username ➜ ${RESET}")" username

    if [ -z "$username" ]; then

        printf "\n"

        error "Username cannot be empty."

        sleep 2

        return

    fi

    # Remove @ if user enters it
    username="${username#@}"

    printf "\n"

    printf "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}\n"

    printf "\n"

    # -----------------------------------------------------
    # INITIALIZATION
    # -----------------------------------------------------

    spinner 1 "Initializing diagnostic engine"

    spinner 1 "Loading account analysis modules"

    spinner 1 "Preparing username scanner"

    spinner 1 "Creating diagnostic session"

    printf "\n"

    # -----------------------------------------------------
    # CONFIRMATION
    # -----------------------------------------------------

    printf "${YELLOW}${BOLD}╭──────────────────── TARGET CONFIRMATION ────────────────╮${RESET}\n"

    printf "${YELLOW}│${RESET} Username : ${CYAN}@${username}${RESET}\n"

    printf "${YELLOW}│${RESET} Issue    : ${issue_color}${issue}${RESET}\n"

    printf "${YELLOW}│${RESET}\n"

    printf "${YELLOW}│${RESET} Is this your username?\n"

    printf "${YELLOW}│${RESET} Have you authorized this diagnostic?\n"

    printf "${YELLOW}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}\n"

    printf "\n"

    read -r -p "$(printf "${GREEN}Continue? [Y/N] ➜ ${RESET}")" confirm

    case "$confirm" in

        y|Y)
            ;;

        n|N)

            printf "\n"

            warning "Diagnostic cancelled."

            sleep 2

            return

            ;;

        *)

            printf "\n"

            error "Invalid response. Please enter Y or N."

            sleep 2

            return

            ;;

    esac

    # -----------------------------------------------------
    # DIAGNOSTIC ENGINE
    # -----------------------------------------------------

    printf "\n"

    line

    printf "\n"

    printf "${CYAN}${BOLD}DIAGNOSTIC ENGINE${RESET}\n"

    printf "\n"

    spinner 1 "Starting scan sequence"

    spinner 1 "Analyzing username structure"

    spinner 1 "Checking account status indicators"

    spinner 1 "Analyzing available account information"

    scan

    # -----------------------------------------------------
    # RESULTS
    # -----------------------------------------------------

    printf "\n"

    printf "${GREEN}${BOLD}╭──────────────────── SCAN RESULTS ────────────────────────╮${RESET}\n"

    sleep 0.3

    printf "${GREEN}│${RESET} ✔ Username format valid\n"

    sleep 0.3

    printf "${GREEN}│${RESET} ✔ Target accepted\n"

    sleep 0.3

    printf "${GREEN}│${RESET} ✔ Diagnostic scan completed\n"

    sleep 0.3

    printf "${GREEN}│${RESET} ✔ Username found: ${CYAN}@${username}${RESET}\n"

    printf "${GREEN}${BOLD}╰──────────────────────────────────────────────────────────╯${RESET}\n"

    sleep 1

    # -----------------------------------------------------
    # ACCESS KEY
    # -----------------------------------------------------

    if ! verify_key; then

        printf "\n"

        error "Access verification failed."

        warning "Operation stopped."

        sleep 2

        return

    fi

    # -----------------------------------------------------
    # AUTHORIZED WORKFLOW
    # -----------------------------------------------------

    printf "\n"

    line

    printf "\n"

    printf "${GREEN}${BOLD}AUTHORIZED WORKFLOW${RESET}\n"

    printf "\n"

    spinner 1 "Loading support workflow"

    spinner 1 "Preparing support procedure"

    spinner 1 "Generating diagnostic report"

    printf "\n"

    # -----------------------------------------------------
    # PROGRESS
    # -----------------------------------------------------

    progress "Processing ${issue}"

    progress "Preparing support workflow"

    progress "Finalizing diagnostic report"

    # -----------------------------------------------------
    # FINAL RESULT
    # -----------------------------------------------------

    printf "\n"

    line

    printf "\n"

    printf "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}\n"

    printf "${GREEN}${BOLD}║                                                        ║${RESET}\n"

    printf "${GREEN}${BOLD}║              ✔ PROCESS COMPLETED                       ║${RESET}\n"

    printf "${GREEN}${BOLD}║                                                        ║${RESET}\n"

    printf "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}\n"

    printf "\n"

    printf "${WHITE}Username :${RESET} ${CYAN}@${username}${RESET}\n"

    printf "${WHITE}Issue    :${RESET} ${issue_color}${issue}${RESET}\n"

    printf "${WHITE}Status   :${RESET} ${GREEN}WORKFLOW COMPLETED${RESET}\n"

    printf "\n"

    spinner 1 "Generating final report"

    printf "\n"

    printf "${CYAN}╭──────────────────── FINAL STATUS ────────────────────────╮${RESET}\n"

    printf "${CYAN}│${RESET} ${GREEN}✔ Username verified${RESET}\n"

    printf "${CYAN}│${RESET} ${GREEN}✔ Authorization verified${RESET}\n"

    printf "${CYAN}│${RESET} ${GREEN}✔ Diagnostic completed${RESET}\n"

    printf "${CYAN}│${RESET} ${GREEN}✔ Support workflow completed${RESET}\n"

    printf "${CYAN}╰──────────────────────────────────────────────────────────╯${RESET}\n"

    printf "\n"

    printf "${GRAY}This terminal program simulates a support/recovery workflow;${RESET}\n"

    printf "${GRAY}it does not directly modify Instagram's backend systems.${RESET}\n"

    printf "\n"

    read -r -p "$(printf "${GREEN}Press ENTER to return to menu...${RESET}")"

}

# =========================================================
# ABOUT
# =========================================================

about() {

    clear

    header

    printf "\n"

    printf "${PINK}${BOLD}ABOUT INSTAHELP PRO${RESET}\n"

    printf "\n"

    printf "${WHITE}Version :${RESET} 3.0\n"

    printf "${WHITE}Platform:${RESET} Termux\n"

    printf "${WHITE}Engine  :${RESET} Diagnostic UI\n"

    printf "\n"

    printf "${GREEN}FEATURES${RESET}\n"

    printf "\n"

    printf " ${CYAN}•${RESET} RGB Instagram startup logo\n"

    printf " ${CYAN}•${RESET} Account issue selection\n"

    printf " ${CYAN}•${RESET} Username confirmation\n"

    printf " ${CYAN}•${RESET} Animated username scanner\n"

    printf " ${CYAN}•${RESET} Operator authorization\n"

    printf " ${CYAN}•${RESET} Progress indicators\n"

    printf " ${CYAN}•${RESET} Normal Termux scrolling\n"

    printf " ${CYAN}•${RESET} Multi-stage support workflow\n"

    printf "\n"

    printf "${GRAY}This program is a terminal UI/support simulation.${RESET}\n"

    printf "\n"

    read -r -p "$(printf "${GREEN}Press ENTER to return...${RESET}")"

}

# =========================================================
# STARTUP
# =========================================================

rgb_logo

clear

header

printf "\n"

printf "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}\n"

printf "${GRAY}Engine:${RESET} ${CYAN}DIAGNOSTIC v3.0${RESET}\n"

printf "${GRAY}Mode:${RESET}   ${PURPLE}SUPPORT SIMULATION${RESET}\n"

printf "\n"

line

printf "\n"

# =========================================================
# MAIN MENU
# =========================================================

while true; do

    printf "${GREEN}${BOLD}[1]${RESET} ${CYAN}ACCOUNT DISABLED${RESET}\n"

    printf "${GREEN}${BOLD}[2]${RESET} ${PURPLE}ACCOUNT SUSPENDED${RESET}\n"

    printf "${GREEN}${BOLD}[3]${RESET} ${PINK}ACCOUNT BAN${RESET}\n"

    printf "${GREEN}${BOLD}[4]${RESET} ${YELLOW}ABOUT${RESET}\n"

    printf "${GREEN}${BOLD}[0]${RESET} ${RED}EXIT${RESET}\n"

    printf "\n"

    line

    printf "\n"

    read -r -p "$(printf "${GREEN}╰─➤ Select diagnostic type: ${RESET}")" choice

    case "$choice" in

        1)

            diagnose_account "ACCOUNT DISABLED" "$CYAN"

            ;;

        2)

            diagnose_account "ACCOUNT SUSPENDED" "$PURPLE"

            ;;

        3)

            diagnose_account "ACCOUNT BAN" "$PINK"

            ;;

        4)

            about

            clear

            header

            printf "\n"

            printf "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}\n"

            printf "${GRAY}Engine:${RESET} ${CYAN}DIAGNOSTIC v3.0${RESET}\n"

            printf "${GRAY}Mode:${RESET}   ${PURPLE}SUPPORT SIMULATION${RESET}\n"

            printf "\n"

            line

            printf "\n"

            ;;

        0)

            clear

            printf "${CYAN}Closing INSTAHELP PRO...${RESET}\n"

            sleep 1

            clear

            exit 0

            ;;

        *)

            printf "\n"

            error "Invalid option."

            sleep 1

            ;;

    esac

doneSHOW_CURSOR="${ESC}[?25h"

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
