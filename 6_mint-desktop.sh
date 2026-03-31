#!/usr/bin/env bash
# ============================================================
#  Mint Engineering Edition – Module Desktop / UX avancé
# ============================================================

set -euo pipefail
source "./mint-tools.sh"
require_root

tune_cinnamon() {
    run_cmd "gsettings set org.cinnamon.desktop.interface enable-animations false"
    run_cmd "gsettings set org.cinnamon.desktop.interface menus-have-icons true"
}

main() {
    log INFO "=== Module Desktop / UX ==="
    run_step "Réglages Cinnamon" tune_cinnamon
}

main "$@"
