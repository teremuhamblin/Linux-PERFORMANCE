#!/usr/bin/env bash
# ============================================================
#  Mint Engineering Edition – Installateur automatique
# ============================================================

set -euo pipefail
source "./mint-tools.sh"
require_root

install_scripts() {
    local target="/usr/local/bin"
    for f in mint-setup.sh mint-tools.sh mint-perf.sh mint-sec.sh mint-desktop.sh; do
        run_cmd "install -m 0755 ./$f $target/$f"
    done
}

main() {
    log INFO "Installation des scripts dans /usr/local/bin"
    run_step "Installation" install_scripts
    log INFO "Installation terminée."
}

main "$@"
