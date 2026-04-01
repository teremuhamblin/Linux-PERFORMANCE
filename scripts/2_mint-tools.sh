#!/usr/bin/env bash
# ============================================================
#  Mint Engineering Edition – Outils communs avancés
# ============================================================

set -euo pipefail

# --- Flags globaux ---
DRY_RUN="${DRY_RUN:-0}"
DEBUG="${DEBUG:-0}"

# --- Couleurs (désactivables via NO_COLOR=1) ---
if [[ "${NO_COLOR:-0}" -eq 0 ]]; then
    C_RED="\e[31m"; C_GRN="\e[32m"; C_YEL="\e[33m"; C_BLU="\e[34m"; C_RST="\e[0m"
else
    C_RED=""; C_GRN=""; C_YEL=""; C_BLU=""; C_RST=""
fi

# --- Logs ---
LOG_DIR="./logs"
mkdir -p "$LOG_DIR"
LOG_FILE="${LOG_FILE:-"$LOG_DIR/mint-setup-$(date +%Y%m%d-%H%M%S).log"}"

log() {
    local level="$1"; shift
    local msg="$*"
    local ts
    ts="$(date +'%F %T')"

    case "$level" in
        INFO)  echo -e "[$ts] [${C_GRN}INFO${C_RST}]  $msg" ;;
        WARN)  echo -e "[$ts] [${C_YEL}WARN${C_RST}]  $msg" ;;
        ERROR) echo -e "[$ts] [${C_RED}ERROR${C_RST}] $msg" ;;
        DEBUG)
            [[ "$DEBUG" -eq 1 ]] || return 0
            echo -e "[$ts] [${C_BLU}DEBUG${C_RST}] $msg"
            ;;
        *)     echo -e "[$ts] [$level] $msg" ;;
    esac | tee -a "$LOG_FILE"
}

die() {
    log ERROR "$*"
    exit 1
}

require_root() {
    if [[ $EUID -ne 0 ]]; then
        die "Ce script doit être exécuté en root."
    fi
}

confirm() {
    local prompt="$1"
    read -r -p "$prompt [o/N] " ans
    [[ "$ans" == "o" || "$ans" == "O" ]]
}

# --- Exécution respectant DRY_RUN ---
run_cmd() {
    local cmd="$*"
    if [[ "$DRY_RUN" -eq 1 ]]; then
        log INFO "[DRY-RUN] $cmd"
        return 0
    fi
    log DEBUG "Exécution : $cmd"
    eval "$cmd"
}

run_step() {
    local title="$1"; shift
    log INFO ">>> $title"
    if "$@"; then
        log INFO "✓ $title terminé"
    else
        log ERROR "Échec : $title"
        return 1
    fi
}
