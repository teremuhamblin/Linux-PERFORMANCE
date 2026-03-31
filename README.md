# Linux "PERFORMANCE"

### 🎯 Objectif
- Ce projet transforme une installation standard de `Linux Mint Cinnamon` en un système plus performant, plus stable et mieux sécurisé, grâce à `une suite de scripts modulaires, reproductibles et faciles à maintenir`.

---

### 📁 Structure du projet

mint-setup.sh       # Script principal
mint-perf.sh   # Optimisations de performance
mint-sec.sh    # Durcissement de la sécurité
mint-desktop.sh     # Réglages Cinnamon / UX
mint-tools.sh       # Fonctions communes (log, root check…)

---

### 🚀 Installation

Clone le dépôt :

`bash
git clone https://github.com/ton-projet/mint-engineering.git
cd mint-engineering/bin


Rends les scripts exécutables :

`bash
chmod +x *.sh
`

---

### ▶️ Utilisation

Lance simplement le script principal :

`bash
sudo ./mint-setup.sh
`

Tu pourras choisir, étape par étape :

- Mise à jour du système  
- Optimisations de performance  
- Durcissement de la sécurité  
- Réglages Cinnamon / UX  

Chaque action est journalisée dans le dossier logs/.

---

### 🧩 Modules

🔧 Performance (mint-perf.sh)
- Nettoyage système  
- Réglages du noyau (swappiness, zswap…)  
- Désactivation de services inutiles  

### 🔐 Sécurité (mint-sec.sh)
- Activation et configuration UFW  
- Durcissement SSH  
- Paramètres sysctl de sécurité  

### 🖥️ Desktop / UX (mint-desktop.sh)
- Optimisations Cinnamon  
- Réglages dconf  
- Nettoyage des autostarts  

---

### 🛡️ Philosophie du projet
- Modulaire : chaque partie peut être activée ou non  
- Reproductible : même résultat sur chaque installation  
- Traçable : logs complets  
- Sécurisé : aucune modification dangereuse sans confirmation  

---

### 📌 Pré-requis
- Linux Mint Cinnamon (version récente)  
- Accès root  
- Connexion Internet pour les mises à jour  

---

### 📣 Contributions
Les contributions sont les bienvenues : modules, améliorations, documentation, tests.

---
