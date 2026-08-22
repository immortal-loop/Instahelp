#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 INSTAHELP PRO v3.0
#          Instagram Account Support Simulator
# =========================================================

# This program is a TERMINAL SIMULATION.
# It does not access, scan, unlock, recover, or modify
# Instagram accounts or Instagram backend systems.

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
# LOCAL OPERATOR KEY
# =========================================================

ACCESS_KEY="recoveracc@123"

# =========================================================
# LOGO
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
# TYPEWRITER
# =========================================================

typewriter() {

    local text="$1"
    local delay=0.012

    for ((i=0; i<${#text}; i++)); do
        printf "%c" "${text:$i:1}"
        sleep "$delay"
    done

    echo ""
}

# =========================================================
# SPINNER
# =========================================================

spinner() {

    local duration="$1"
    local message="$2"

    local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

    local start=$SECONDS
    local i=0

    while [ $((SECONDS-start)) -lt "$duration" ]; do

        printf "\r${CYAN}${frames[$i]}${RESET} ${WHITE}%-60s${RESET}" "$message"

        i=$(( (i+1) % ${#frames[@]} ))

        sleep 0.08

    done

    printf "\r${GREEN}✔${RESET} ${WHITE}%-60s${RESET}\n" "$message"
}

# =========================================================
# PROGRESS BAR
# =========================================================

progress_bar() {

    local title="$1"
    local width=40

    echo ""
    echo -e "${CYAN}${title}${RESET}"
    echo ""

    for ((i=0; i<=width; i++)); do

        local percent=$((i*100/width))

        local filled
        local empty

        filled=$(printf "%${i}s" | tr ' ' '█')
        empty=$(printf "%$((width-i))s" | tr ' ' '░')

        printf "\r${GREEN}${filled}${GRAY}${empty}${RESET} ${YELLOW}%3d%%${RESET}" "$percent"

        sleep 0.035

    done

    echo ""
}

# =========================================================
# SCAN BAR
# =========================================================

scan_bar() {

    local label="$1"

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

    for frame in "${frames[@]}"; do

        printf "\r${CYAN}${label} ${frame}${RESET}"

        sleep 0.08

    done

    echo -e " ${GREEN}OK${RESET}"
}

# =========================================================
# TERMS & CONDITIONS
# =========================================================

terms_and_conditions() {

    clear

    echo -e "${YELLOW}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}${BOLD}║             TERMS & CONDITIONS                    ║${RESET}"
    echo -e "${YELLOW}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Please review before continuing:${RESET}"
    echo ""

    echo -e "${GRAY}  1.${RESET} This utility is a diagnostic/support workflow simulator."
    echo -e "${GRAY}  2.${RESET} Only use usernames you are authorized to check."
    echo -e "${GRAY}  3.${RESET} No Instagram backend is accessed or modified."
    echo -e "${GRAY}  4.${RESET} Scan results shown by this program are simulated."
    echo -e "${GRAY}  5.${RESET} The private key belongs only to this local script."
    echo ""

    echo -e "${CYAN}────────────────────────────────────────────────────────${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Accept Terms & Conditions? [Y/N]: ${RESET}")" terms

    case "$terms" in

        y|Y)

            echo ""
            echo -e "${GREEN}✔ Terms accepted.${RESET}"
            sleep 1
            return 0
            ;;

        *)

            echo ""
            echo -e "${RED}✖ Terms not accepted.${RESET}"
            echo -e "${GRAY}Operation cancelled.${RESET}"
            sleep 2
            return 1
            ;;

    esac
}

# =========================================================
# USERNAME CONFIRMATION
# =========================================================

confirm_username() {

    local username="$1"
    local title="$2"

    clear

    echo -e "${YELLOW}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${YELLOW}${BOLD}║             TARGET CONFIRMATION                  ║${RESET}"
    echo -e "${YELLOW}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Target Username:${RESET} ${CYAN}@${username}${RESET}"
    echo -e "${WHITE}Selected Issue :${RESET} ${YELLOW}${title}${RESET}"

    echo ""

    echo -e "${GRAY}Please verify that the username above is correct.${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Confirm target? [Y/N]: ${RESET}")" confirm

    case "$confirm" in

        y|Y)

            echo ""
            echo -e "${GREEN}✔ Target confirmed.${RESET}"
            sleep 1
            return 0
            ;;

        *)

            echo ""
            echo -e "${RED}✖ Target confirmation cancelled.${RESET}"
            sleep 2
            return 1
            ;;

    esac
}

# =========================================================
# PROFESSIONAL USERNAME SCAN
# =========================================================

professional_scan() {

    local username="$1"

    clear

    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║             ADVANCED DIAGNOSTIC SCAN             ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}"
    echo ""

    spinner 1 "Initializing diagnostic engine"
    spinner 1 "Loading username analysis modules"
    spinner 1 "Validating username structure"
    spinner 1 "Preparing diagnostic environment"

    echo ""

    echo -e "${PURPLE}${BOLD}Running username analysis...${RESET}"
    echo ""

    scan_bar "Username signature"
    scan_bar "Username consistency"
    scan_bar "Public metadata"
    scan_bar "Account status indicators"
    scan_bar "Restriction indicators"
    scan_bar "Support compatibility"
    scan_bar "Diagnostic consistency"

    echo ""

    progress_bar "Compiling diagnostic results..."

    echo ""

    echo -e "${GREEN}✔ Username diagnostic scan completed.${RESET}"

    sleep 2
}

# =========================================================
# PRIVATE KEY VERIFICATION
# =========================================================

key_verification() {

    clear

    echo -e "${PURPLE}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PURPLE}${BOLD}║             PRIVATE KEY VERIFICATION              ║${RESET}"
    echo -e "${PURPLE}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${GRAY}A local operator key is required to continue.${RESET}"
    echo -e "${GRAY}This is NOT an Instagram password.${RESET}"
    echo -e "${GRAY}It is only used by this terminal simulation.${RESET}"

    echo ""

    read -s -p "$(echo -e "${YELLOW}Enter private key: ${RESET}")" entered_key

    echo ""

    spinner 2 "Checking local authorization signature"

    spinner 1 "Validating key format"

    if [ "$entered_key" = "$ACCESS_KEY" ]; then

        echo ""

        echo -e "${GREEN}${BOLD}✔ PRIVATE KEY VERIFIED${RESET}"

        echo -e "${GRAY}Local authorization successful.${RESET}"

        sleep 2

        return 0

    else

        echo ""

        echo -e "${RED}${BOLD}✖ INVALID PRIVATE KEY${RESET}"

        echo -e "${GRAY}Authorization denied.${RESET}"

        sleep 2

        return 1

    fi
}

# =========================================================
# POST-KEY SCAN
# =========================================================

post_key_scan() {

    local username="$1"

    clear

    echo -e "${GREEN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GREEN}${BOLD}║          POST-AUTHORIZATION ANALYSIS             ║${RESET}"
    echo -e "${GREEN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}"
    echo ""

    spinner 1 "Loading authorized diagnostic session"
    spinner 1 "Synchronizing analysis modules"
    spinner 1 "Validating local authorization"
    spinner 1 "Running final consistency check"
    spinner 1 "Preparing simulated support response"
    spinner 1 "Generating final diagnostic report"

    echo ""

    echo -e "${CYAN}${BOLD}Running final verification sweep...${RESET}"
    echo ""

    scan_bar "Authorization state"
    scan_bar "Diagnostic state"
    scan_bar "Workflow state"
    scan_bar "Report integrity"
    scan_bar "Final consistency"

    echo ""

    progress_bar "Finalizing verification..."

    echo ""

    echo -e "${GREEN}✔ Post-authorization scan completed.${RESET}"

    sleep 2
}

# =========================================================
# FINAL SUCCESS SCREEN
# =========================================================

success_screen() {

    local username="$1"
    local title="$2"

    clear

    echo ""

    echo -e "${GREEN}${BOLD}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║                                                      ║"
    echo "║           ✔ CONFIRMATION SUCCESSFUL                 ║"
    echo "║                                                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${RESET}"

    echo ""

    echo -e "${WHITE}Target Account:${RESET} ${CYAN}@${username}${RESET}"
    echo -e "${WHITE}Issue:${RESET}         ${YELLOW}${title}${RESET}"
    echo -e "${WHITE}Authorization:${RESET} ${GREEN}VERIFIED${RESET}"
    echo -e "${WHITE}Username Scan:${RESET} ${GREEN}COMPLETED${RESET}"
    echo -e "${WHITE}Final Scan:${RESET}    ${GREEN}COMPLETED${RESET}"
    echo -e "${WHITE}Workflow:${RESET}      ${GREEN}SUCCESSFUL${RESET}"

    echo ""

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"

    echo -e "${GREEN}✔ Username confirmed${RESET}"
    echo -e "${GREEN}✔ Terms accepted${RESET}"
    echo -e "${GREEN}✔ Diagnostic scan completed${RESET}"
    echo -e "${GREEN}✔ Private key verified${RESET}"
    echo -e "${GREEN}✔ Post-authorization scan completed${RESET}"
    echo -e "${GREEN}✔ Support workflow generated${RESET}"

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"

    echo ""

    typewriter "${GRAY}NOTE: This is a terminal simulation.${RESET}"
    typewriter "${GRAY}It does not access, unlock, recover, or modify${RESET}"
    typewriter "${GRAY}Instagram accounts or Instagram backend systems.${RESET}"

    echo ""

    read -p "$(echo -e "${GREEN}Press ENTER to return to main menu...${RESET}")"
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

    # Remove @ if entered
    username="${username#@}"

    # =====================================================
    # INITIALIZATION
    # =====================================================

    clear

    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║             INITIALIZING SESSION                  ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    spinner 1 "Initializing diagnostic engine"
    spinner 1 "Loading account analysis modules"
    spinner 1 "Preparing username scanner"
    spinner 1 "Establishing diagnostic session"
    spinner 1 "Loading support workflow"

    echo ""

    echo -e "${WHITE}Target Username:${RESET} ${CYAN}@${username}${RESET}"

    sleep 1

    # =====================================================
    # TERMS
    # =====================================================

    if ! terms_and_conditions; then
        return
    fi

    # =====================================================
    # TARGET CONFIRMATION
    # =====================================================

    if ! confirm_username "$username" "$title"; then
        return
    fi

    # =====================================================
    # USERNAME SCAN
    # =====================================================

    professional_scan "$username"

    # =====================================================
    # PRIVATE KEY
    # =====================================================

    if ! key_verification; then

        echo ""

        echo -e "${RED}Returning to main menu...${RESET}"

        sleep 2

        return
    fi

    # =====================================================
    # POST KEY SCAN
    # =====================================================

    post_key_scan "$username"

    # =====================================================
    # FINAL RESULT
    # =====================================================

    success_screen "$username" "$title"
}

# =========================================================
# ABOUT SCREEN
# =========================================================

about_screen() {

    clear

    echo -e "${PINK}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PINK}${BOLD}║                  ABOUT INSTAHELP                 ║${RESET}"
    echo -e "${PINK}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${GREEN}${BOLD}INSTAHELP PRO v3.0${RESET}"

    echo ""

    echo -e "${CYAN}Features:${RESET}"

    echo -e "  ${GREEN}•${RESET} RGB animated terminal interface"
    echo -e "  ${GREEN}•${RESET} Username confirmation"
    echo -e "  ${GREEN}•${RESET} Terms & Conditions gate"
    echo -e "  ${GREEN}•${RESET} Multi-stage diagnostic simulation"
    echo -e "  ${GREEN}•${RESET} Professional scanning animations"
    echo -e "  ${GREEN}•${RESET} Private-key verification"
    echo -e "  ${GREEN}•${RESET} Post-authorization scan"
    echo -e "  ${GREEN}•${RESET} Animated progress bars"
    echo -e "  ${GREEN}•${RESET} Final confirmation screen"

    echo ""

    echo -e "${YELLOW}Simulation only:${RESET}"
    echo -e "${GRAY}No Instagram backend or account is accessed.${RESET}"

    echo ""

    read -p "$(echo -e "${GREEN}Press ENTER to return to menu...${RESET}")"

}

# =========================================================
# STARTUP RGB ANIMATION
# =========================================================

for frame in {0..3}; do

    clear

    local_offset=$((frame * 2))

    for i in "${!logo[@]}"; do

        color_idx=$(( (i + local_offset) % ${#colors[@]} ))

        echo -e "${colors[$color_idx]}${logo[$i]}${RESET}"

    done

    sleep 0.12

done

# =========================================================
# MAIN MENU
# =========================================================

while true; do

    clear

    echo ""

    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}             ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.0${RESET}             ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}          ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}              ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
    echo -e "${GRAY}Mode:${RESET}   ${PURPLE}PROFESSIONAL DIAGNOSTIC SIMULATION${RESET}"

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

    read -p "$(echo -e "${GREEN}╰─➤ Select option: ${RESET}")" choice

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
            about_screen
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

            echo -e "${RED}✖ Invalid option.${RESET}"

            sleep 2

            ;;

    esac

done
