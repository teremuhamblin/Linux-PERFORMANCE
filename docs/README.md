📘 README — Documentation Linux PERFORMANCE

Le dossier docs/ contient l’ensemble de la documentation technique du projet Linux PERFORMANCE, une suite modulaire destinée à automatiser, optimiser et sécuriser une installation Linux Mint de manière reproductible et professionnelle.

Cette documentation accompagne les scripts du dossier scripts/ et fournit des informations détaillées sur :

- l’architecture du projet  
- les modules et leur rôle  
- les choix techniques  
- les paramètres système modifiés  
- les bonnes pratiques d’utilisation  
- les guides d’installation et de maintenance  

---

📂 Contenu du dossier

1. Architecture du projet
Décrit la structure globale :

- organisation des scripts  
- logique de pipeline  
- dépendances entre modules  
- conventions de nommage  
- philosophie d’ingénierie (stabilité, performance, sécurité, reproductibilité)

2. Guides d’installation
Documentation destinée à l’utilisateur final ou à l’administrateur :

- installation de Linux Mint  
- préparation du système  
- exécution des scripts dans l’ordre recommandé  
- vérifications post‑installation  

3. Documentation des modules
Chaque script du dossier scripts/ possède une fiche dédiée :

- objectifs du module  
- opérations effectuées  
- paramètres modifiés  
- risques potentiels  
- recommandations d’usage  
- commandes associées  

Modules documentés :

- 1_mint-install  
- 2_mint-tools  
- 3_mint-setup  
- 4_mint-perf  
- 5_mint-sec  
- 6_mint-desktop  

4. Optimisations système
Documentation technique détaillée :

- CPU governor  
- swappiness, zram, VFS cache  
- I/O scheduler (NVMe / SSD / HDD)  
- sysctl réseau  
- tuning systemd  
- gestion des services  

Chaque optimisation est expliquée avec :

- justification technique  
- impact attendu  
- risques éventuels  
- méthode de rollback  

5. Sécurisation
Documentation sur les durcissements appliqués :

- nftables  
- sysctl sécurité  
- permissions & umask  
- désactivation des surfaces d’attaque  
- bonnes pratiques de durcissement  

6. Desktop & UX
Documentation des optimisations Cinnamon :

- réduction des animations  
- paramètres d’énergie  
- amélioration de la réactivité  
- configuration utilisateur  

7. Notes techniques
Section dédiée aux détails avancés :

- benchmarks  
- choix techniques justifiés  
- compatibilité matériel  
- limitations connues  
- roadmap technique  

---

🧭 Objectifs de la documentation

- Centraliser toutes les informations techniques du projet  
- Faciliter la maintenance et l’évolution du code  
- Permettre une compréhension rapide de chaque module  
- Offrir une base solide pour les contributions externes  
- Garantir la reproductibilité des installations  

---

🛠️ Bonnes pratiques

- Mettre à jour la documentation à chaque modification de script  
- Documenter les paramètres système modifiés  
- Ajouter des exemples d’usage lorsque nécessaire  
- Versionner les docs avec les scripts pour garder la cohérence  
- Utiliser un style clair, concis et technique  

---

📜 Licence

La documentation est distribuée sous licence MIT, comme le reste du projet.

---
