#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
#                 INSTAHELP PRO v3.1
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
# SPINNER
# =========================================================

spinner() {

    local duration="$1"
    local message="$2"

    local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

    local start=$SECONDS
    local i=0

    while [ $((SECONDS-start)) -lt "$duration" ]; do

        printf "\r${CYAN}${frames[$i]}${RESET} ${WHITE}%-58s${RESET}" "$message"

        i=$(( (i+1) % ${#frames[@]} ))

        sleep 0.08

    done

    printf "\r${GREEN}✔${RESET} ${WHITE}%-58s${RESET}\n" "$message"
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
    echo -e "${YELLOW}${BOLD}║              TERMS & CONDITIONS                   ║${RESET}"
    echo -e "${YELLOW}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Please confirm the following:${RESET}"
    echo ""

    echo -e "${CYAN}•${RESET} Use only usernames you are authorized to check."
    echo -e "${CYAN}•${RESET} This tool provides a simulated diagnostic workflow."
    echo -e "${CYAN}•${RESET} No account credentials are requested."
    echo -e "${CYAN}•${RESET} Scan results are simulated."

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
    echo -e "${YELLOW}${BOLD}║              TARGET CONFIRMATION                 ║${RESET}"
    echo -e "${YELLOW}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Username :${RESET} ${CYAN}@${username}${RESET}"
    echo -e "${WHITE}Issue    :${RESET} ${YELLOW}${title}${RESET}"

    echo ""

    echo -e "${GRAY}Please verify the username before continuing.${RESET}"

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
# PROFESSIONAL SCAN
# =========================================================

professional_scan() {

    local username="$1"

    clear

    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║             ADVANCED USERNAME SCAN               ║${RESET}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}"

    echo ""

    spinner 1 "Initializing diagnostic engine"
    spinner 1 "Loading analysis modules"
    spinner 1 "Validating username structure"
    spinner 1 "Preparing scan environment"

    echo ""

    echo -e "${PURPLE}${BOLD}SCAN MODULES${RESET}"
    echo ""

    scan_bar "Username signature"
    scan_bar "Username consistency"
    scan_bar "Public information"
    scan_bar "Account status"
    scan_bar "Restriction indicators"
    scan_bar "Support compatibility"
    scan_bar "Diagnostic consistency"

    echo ""

    progress_bar "Compiling scan results..."

    echo ""

    echo -e "${GREEN}${BOLD}✔ USERNAME SCAN COMPLETED${RESET}"

    sleep 2
}

# =========================================================
# PRIVATE KEY VERIFICATION
# =========================================================

key_verification() {

    clear

    echo -e "${PURPLE}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PURPLE}${BOLD}║             PRIVATE KEY REQUIRED                  ║${RESET}"
    echo -e "${PURPLE}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${GRAY}Enter the local operator key to continue.${RESET}"

    echo ""

    read -s -p "$(echo -e "${YELLOW}Private key: ${RESET}")" entered_key

    echo ""

    spinner 2 "Verifying authorization key"
    spinner 1 "Checking key signature"
    spinner 1 "Validating local authorization"

    if [ "$entered_key" = "$ACCESS_KEY" ]; then

        echo ""

        echo -e "${GREEN}${BOLD}✔ PRIVATE KEY VERIFIED${RESET}"

        sleep 2

        return 0

    else

        echo ""

        echo -e "${RED}${BOLD}✖ INVALID PRIVATE KEY${RESET}"

        sleep 2

        return 1

    fi
}

# =========================================================
# POST KEY SCAN
# =========================================================

post_key_scan() {

    local username="$1"

    clear

    echo -e "${GREEN}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GREEN}${BOLD}║            FINAL DIAGNOSTIC SCAN                 ║${RESET}"
    echo -e "${GREEN}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}"

    echo ""

    spinner 1 "Loading authorized diagnostic session"
    spinner 1 "Synchronizing analysis modules"
    spinner 1 "Validating authorization"
    spinner 1 "Running final consistency check"
    spinner 1 "Preparing support workflow"
    spinner 1 "Generating diagnostic report"

    echo ""

    echo -e "${CYAN}${BOLD}FINAL VERIFICATION${RESET}"
    echo ""

    scan_bar "Authorization state"
    scan_bar "Diagnostic state"
    scan_bar "Workflow state"
    scan_bar "Report integrity"
    scan_bar "Final consistency"

    echo ""

    progress_bar "Finalizing verification..."

    echo ""

    echo -e "${GREEN}${BOLD}✔ FINAL SCAN COMPLETED${RESET}"

    sleep 2
}

# =========================================================
# SUCCESS SCREEN
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

    echo -e "${WHITE}Username      :${RESET} ${CYAN}@${username}${RESET}"
    echo -e "${WHITE}Issue         :${RESET} ${YELLOW}${title}${RESET}"
    echo -e "${WHITE}Authorization :${RESET} ${GREEN}VERIFIED${RESET}"
    echo -e "${WHITE}Username Scan :${RESET} ${GREEN}COMPLETED${RESET}"
    echo -e "${WHITE}Final Scan    :${RESET} ${GREEN}COMPLETED${RESET}"
    echo -e "${WHITE}Workflow      :${RESET} ${GREEN}SUCCESSFUL${RESET}"

    echo ""

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"

    echo -e "${GREEN}✔ Target confirmed${RESET}"
    echo -e "${GREEN}✔ Terms accepted${RESET}"
    echo -e "${GREEN}✔ Username scan completed${RESET}"
    echo -e "${GREEN}✔ Private key verified${RESET}"
    echo -e "${GREEN}✔ Final scan completed${RESET}"
    echo -e "${GREEN}✔ Confirmation successful${RESET}"

    echo -e "${CYAN}════════════════════════════════════════════════════${RESET}"

    echo ""

    read -p "$(echo -e "${GREEN}Press ENTER to return to menu...${RESET}")"

}

# =========================================================
# RECOVERY FLOW
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
    spinner 1 "Loading analysis modules"
    spinner 1 "Preparing username scanner"
    spinner 1 "Preparing diagnostic session"

    echo ""

    echo -e "${WHITE}Target:${RESET} ${CYAN}@${username}${RESET}"

    sleep 1

    # =====================================================
    # TERMS
    # =====================================================

    if ! terms_and_conditions; then
        return
    fi

    # =====================================================
    # CONFIRM USERNAME
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

        echo -e "${RED}Authorization failed.${RESET}"

        sleep 2

        return
    fi

    # =====================================================
    # FINAL SCAN
    # =====================================================

    post_key_scan "$username"

    # =====================================================
    # SUCCESS
    # =====================================================

    success_screen "$username" "$title"
}

# =========================================================
# ABOUT
# =========================================================

about_screen() {

    clear

    echo -e "${PINK}${BOLD}╔════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PINK}${BOLD}║                  ABOUT INSTAHELP                 ║${RESET}"
    echo -e "${PINK}${BOLD}╚════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${GREEN}${BOLD}INSTAHELP PRO v3.1${RESET}"

    echo ""

    echo -e "${CYAN}Features${RESET}"
    echo ""
    echo -e "  ${GREEN}•${RESET} RGB terminal interface"
    echo -e "  ${GREEN}•${RESET} Username confirmation"
    echo -e "  ${GREEN}•${RESET} Terms & Conditions"
    echo -e "  ${GREEN}•${RESET} Multi-stage scanning"
    echo -e "  ${GREEN}•${RESET} Private-key verification"
    echo -e "  ${GREEN}•${RESET} Final verification"
    echo -e "  ${GREEN}•${RESET} Animated progress bars"

    echo ""

    read -p "$(echo -e "${GREEN}Press ENTER to return to menu...${RESET}")"

}

# =========================================================
# STARTUP LOGO
# =========================================================

clear

for frame in {0..3}; do

    clear

    offset=$((frame * 2))

    for i in "${!logo[@]}"; do

        color_idx=$(( (i + offset) % ${#colors[@]} ))

        echo -e "${colors[$color_idx]}${logo[$i]}${RESET}"

    done

    sleep 0.12

done

# =========================================================
# KEEP LOGO ON SCREEN
# =========================================================

echo ""
echo -e "${GRAY}INSTAHELP PRO${RESET}"
echo ""
echo -e "${GREEN}Press ENTER to continue...${RESET}"

read -r

# =========================================================
# MAIN MENU
# =========================================================

while true; do

    clear

    echo ""

    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}             ${YELLOW}I${ORANGE}N${GREEN}S${CYAN}T${BLUE}A${PURPLE}H${PINK}E${RED}L${YELLOW}P${RESET} ${GRAY}PRO v3.1${RESET}             ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}          ${GREEN}ACCOUNT SUPPORT TERMINAL${RESET}              ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"

    echo ""

    echo -e "${GRAY}System:${RESET} ${GREEN}● ONLINE${RESET}"
    echo -e "${GRAY}Mode:${RESET}   ${PURPLE}DIAGNOSTIC${RESET}"

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

done
