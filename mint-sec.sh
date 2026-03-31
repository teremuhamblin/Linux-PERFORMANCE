#!/usr/bin/env bash
# ============================================================
#  Mint Engineering Edition – Module Sécurité avancé
# ============================================================

set -euo pipefail
source "./mint-tools.sh"
require_root

setup_ufw() {
    run_cmd "apt -y install ufw"
    run_cmd "ufw default deny incoming"
    run_cmd "ufw default allow outgoing"
    run_cmd "ufw --force enable"
}

harden_ssh() {
    run_cmd "sed -i 's/^#\\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config"
    run_cmd "sed -i 's/^#\\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config"
    run_cmd "systemctl restart ssh || systemctl restart sshd || true"
}

sysctl_security() {
    run_cmd "cat > /etc/sysctl.d/90-security.conf << 'EOF'
net.ipv4.tcp_syncookies=1
net.ipv4.conf.all.rp_filter=1
net.ipv4.conf.default.rp_filter=1
net.ipv4.conf.all.accept_redirects=0
net.ipv4.conf.default.accept_redirects=0
EOF"
    run_cmd "sysctl -p /etc/sysctl.d/90-security.conf"
}

main() {
    log INFO "=== Module Sécurité ==="
    run_step "Pare-feu UFW" setup_ufw
    run_step "Durcissement SSH" harden_ssh
    run_step "Paramètres sysctl sécurité" sysctl_security
}

main "$@"
