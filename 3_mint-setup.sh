#!/usr/bin/env bash
# ============================================================
#  Mint Engineering Edition – Script principal avancé
# ============================================================

set -euo pipefail

TOOLS="./mint-tools.sh"
source "$TOOLS"

MODULE_PERF="./mint-perf.sh"
MODULE_SEC="./mint-sec.sh"
MODULE_DESKTOP="./mint-desktop.sh"
PLUGIN_PREFIX="mint-plugin-"

AUTO_YES=0

usage() {
    cat <<EOF
Usage : $(basename "$0") [options]

Options :
  -y, --yes        Ne poser aucune question (tout OUI)
      --dry-run    Simulation : aucune modification réelle
      --debug      Logs détaillés
      --no-color   Désactiver les couleurs
      --plugins    Exécuter les plugins mint-plugin-*.sh
      --install    Installer les scripts dans /usr/local/bin
  -h, --help       Afficher cette aide
EOF
}

parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -y|--yes)    AUTO_YES=1; shift ;;
            --dry-run)   DRY_RUN=1; shift ;;
            --debug)     DEBUG=1; shift ;;
            --no-color)  NO_COLOR=1; shift ;;
            --plugins)   RUN_PLUGINS=1; shift ;;
            --install)   DO_INSTALL=1; shift ;;
            -h|--help)   usage; exit 0 ;;
            *)           die "Option inconnue : $1" ;;
        esac
    done
}

ask_or_auto() {
    local question="$1"
    if [[ "$AUTO_YES" -eq 1 ]]; then
        log INFO "[AUTO] $question : OUI"
        return 0
    fi
    confirm "$question"
}

check_module() {
    [[ -x "$1" ]] || die "Module introuvable ou non exécutable : $1"
}

run_plugins() {
    log INFO "Recherche de plugins (${PLUGIN_PREFIX}*.sh)..."
    shopt -s nullglob
    local plugins=(./${PLUGIN_PREFIX}*.sh)
    shopt -u nullglob

    if [[ ${#plugins[@]} -eq 0 ]]; then
        log INFO "Aucun plugin trouvé."
        return 0
    fi

    for p in "${plugins[@]}"; do
        if ask_or_auto "Exécuter le plugin $(basename "$p") ?"; then
            run_step "Plugin $(basename "$p")" "$p"
        else
            log INFO "Plugin $(basename "$p") ignoré."
        fi
    done
}

install_scripts() {
    local target="/usr/local/bin"
    require_root
    for f in mint-setup.sh mint-tools.sh mint-perf.sh mint-sec.sh mint-desktop.sh; do
        run_cmd "install -m 0755 ./$f $target/$f"
    done
    log INFO "Scripts installés dans $target."
}

main() {
    RUN_PLUGINS=0
    DO_INSTALL=0

    parse_args "$@"
    require_root

    log DEBUG "DRY_RUN=$DRY_RUN DEBUG=$DEBUG AUTO_YES=$AUTO_YES"

    check_module "$MODULE_PERF"
    check_module "$MODULE_SEC"
    check_module "$MODULE_DESKTOP"

    if [[ "$DO_INSTALL" -eq 1 ]]; then
        run_step "Installation des scripts" install_scripts
        exit 0
    }

    log INFO "Démarrage de Mint Engineering Edition."

    if ask_or_auto "Mettre à jour le système ?"; then
        run_step "Mise à jour du système" bash -c "run_cmd 'apt update' && run_cmd 'apt -y upgrade'"
    fi

    if ask_or_auto "Appliquer les optimisations de performance ?"; then
        run_step "Module Performance" "$MODULE_PERF"
    fi

    if ask_or_auto "Appliquer le durcissement de sécurité ?"; then
        run_step "Module Sécurité" "$MODULE_SEC"
    fi

    if ask_or_auto "Appliquer les réglages Desktop / UX ?"; then
        run_step "Module Desktop / UX" "$MODULE_DESKTOP"
    fi

    if [[ "$RUN_PLUGINS" -eq 1 ]]; then
        run_step "Exécution des plugins" run_plugins
    fi

    log INFO "Configuration terminée."
}

main "$@"
