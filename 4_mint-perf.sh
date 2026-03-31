#!/usr/bin/env bash
# ============================================================
#  Mint Engineering Edition – Module Performance avancé
# ============================================================

set -euo pipefail
source "./mint-tools.sh"
require_root

cleanup() {
    run_cmd "apt -y autoremove"
    run_cmd "apt -y autoclean"
}

tune_swappiness() {
    run_cmd "echo 'vm.swappiness=30' > /etc/sysctl.d/90-swappiness.conf"
    run_cmd "sysctl -p /etc/sysctl.d/90-swappiness.conf"
}

optimize_services() {
    # Exemple : désactiver des services non essentiels (à adapter)
    # run_cmd "systemctl disable bluetooth.service"
    true
}

main() {
    log INFO "=== Module Performance ==="
    run_step "Nettoyage système" cleanup
    run_step "Réglage swappiness" tune_swappiness
    run_step "Optimisation services" optimize_services
}

main "$@"
