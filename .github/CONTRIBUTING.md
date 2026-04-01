# Contribuer à Linux PERFORMANCE

Merci de votre intérêt pour contribuer au projet **Linux PERFORMANCE**.

## 🧱 Structure du projet
Le projet est organisé en modules :
- scripts/ : scripts shell modulaires
- docs/ : documentation technique
- config/ : configuration globale
- logs/ : journaux d’exécution (non versionnés)

## 🛠 Prérequis
- Linux Mint (ou Ubuntu/Debian)
- Bash 5+
- Git
- Connaissances de base en administration système

## 🔧 Workflow Git
1. Fork du dépôt
2. Création d’une branche :
   `
   git checkout -b feature/nom-fonction
   `
3. Commits clairs et atomiques :
   `
   feat: ajout du module CPU governor
   fix: correction du scheduler I/O
   docs: mise à jour de la documentation perf
   `
4. Push et Pull Request

🧪 Tests
Avant toute PR :
- tester les scripts sur une VM
- vérifier qu’aucun fichier non désiré n’est ajouté
- respecter .gitattributes et .gitignore

📄 Licence
Toute contribution est publiée sous licence MIT.
`

---
