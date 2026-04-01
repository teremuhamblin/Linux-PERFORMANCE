📘 README — Scripts Linux PERFORMANCE

Ce répertoire contient l’ensemble des scripts modulaires utilisés pour automatiser l’installation, la configuration, l’optimisation et la sécurisation d’un système Linux Mint dans le cadre du projet Linux PERFORMANCE.

Chaque script est autonome, idempotent, lisible et conçu pour être exécuté en root.  
L’ensemble forme une pipeline cohérente permettant d’obtenir un système :

- stable
- performant
- sécurisé
- reproductible
- adapté aux besoins d’ingénierie

---

📂 Structure du dossier

1. Installation — 1_mint-install.sh
Responsable de la préparation du système :
- Mise à jour complète
- Installation des paquets essentiels
- Nettoyage et préparation de base
- Vérifications initiales

2. Outils — 2_mint-tools.sh
Installation des outils nécessaires à un environnement d’ingénierie :
- Outils de développement (build-essential, git…)
- Utilitaires système
- Outils réseau et debugging
- Environnement Python / pipx (selon configuration)

3. Setup — 3_mint-setup.sh
Configuration initiale du système :
- Paramètres globaux
- Ajustements de confort et de stabilité
- Préparation de l’environnement utilisateur
- Configuration de services essentiels

4. Performance — 4_mint-perf.sh
Optimisations mesurables et non-destructives :
- CPU governor (schedutil ou performance)
- Swappiness, ZRAM, VFS cache
- I/O scheduler (NVMe / SSD / HDD)
- Optimisations réseau (sysctl)
- Tuning systemd (timeouts, parallelisation)
- Réduction des services inutiles

5. Sécurité — 5_mint-sec.sh
Durcissement du système :
- Activation et configuration de nftables
- Permissions & umask
- sysctl sécurité
- Désactivation des surfaces d’attaque inutiles
- Vérifications de cohérence

6. Desktop — 6_mint-desktop.sh
Optimisations de l’environnement Cinnamon :
- Réduction des animations lourdes
- Paramètres d’énergie
- Tweaks UX
- Nettoyage des services utilisateur

---

🧭 Ordre d’exécution recommandé

Pour une installation complète et cohérente :

`bash
sudo bash 1_mint-install.sh
sudo bash 2_mint-tools.sh
sudo bash 3_mint-setup.sh
sudo bash 4_mint-perf.sh
sudo bash 5_mint-sec.sh
sudo bash 6_mint-desktop.sh
`

Chaque script peut également être exécuté indépendamment selon les besoins.

---

🛠️ Bonnes pratiques

- Toujours exécuter les scripts en root  
- Lire le script avant exécution pour adapter les paramètres si nécessaire  
- Tester sur une VM avant déploiement réel  
- Garder les scripts versionnés dans Git pour assurer la traçabilité  
- Documenter toute modification dans le commit associé  

---

🎯 Objectifs du projet

- Automatiser une installation Linux Mint propre et reproductible  
- Offrir une base stable pour ingénieurs, développeurs et administrateurs  
- Optimiser les performances sans sacrifier la fiabilité  
- Renforcer la sécurité du système  
- Améliorer l’expérience utilisateur sous Cinnamon  
- Fournir une architecture modulaire et maintenable  

---

📜 Licence

Ce projet est distribué sous licence MIT.

---
