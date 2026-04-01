✅ Les fichiers .git* que Git utilise réellement

Voici tous les fichiers et dossiers commençant par .git que Git reconnaît, utilise ou crée automatiquement.

🧱 1. .git/ — le dossier principal
C’est le cœur du dépôt Git.  
Il contient toute la base de données interne :

- HEAD  
- config  
- index  
- objects/  
- refs/  
- hooks/  
- logs/  
- info/  
- packed-refs  

👉 Tu ne dois jamais modifier ce dossier manuellement.

---

📄 2. .gitignore
Fichier pour ignorer des fichiers/dossiers dans le dépôt.

Tu l’as déjà.

---

📄 3. .gitattributes
Fichier pour :

- normaliser les fins de ligne  
- définir les types de fichiers  
- améliorer les diffs  
- gérer les fichiers binaires  

Tu l’as déjà aussi.

---

📄 4. .gitmodules
Présent uniquement si tu utilises des submodules Git.

Exemple :

`
[submodule "libfoo"]
    path = libs/libfoo
    url = https://github.com/foo/libfoo.git
`

Si tu n’utilises pas de submodules → ce fichier n’existe pas.

---

📄 5. .gitmessage
Fichier optionnel contenant un template de message de commit.

Exemple :

`
feat: 
fix:
docs:
`

Tu peux en créer un si tu veux imposer un style de commit.

---

📄 6. .gitconfig
⚠️ Attention :  
Ce fichier existe dans ton HOME, pas dans ton projet.

Il configure Git pour ton utilisateur.

Exemple :

`
~/.gitconfig
`

---

📄 7. .gitignore_global
Fichier global pour ignorer des fichiers sur toute ta machine.

Exemple :

`
~/.gitignore_global
`

---

📄 8. .gitkeep
Ce fichier n’existe pas dans Git, mais les développeurs l’utilisent pour :

- versionner un dossier vide  
- garder une structure propre  

Contenu typique :

`

Keep this folder in Git
`

---

📄 9. .gitreview
Utilisé uniquement si tu travailles avec Gerrit (rare).

---

📄 10. .git-blame-ignore-revs
Fichier permettant d’ignorer certains commits dans git blame.

Très utile pour :

- reformattage massif  
- indentation  
- nettoyage de code  

---

📄 11. .git-credentials
Fichier local contenant des identifiants Git (rare, déconseillé).

---

📄 12. .gitignore.d/
Certains projets créent un dossier pour organiser plusieurs règles d’ignore.

Exemple :

`
.gitignore.d/python
.gitignore.d/node
`

Mais ce n’est pas natif Git.

---

📄 13. .gitlab-ci.yml
Uniquement pour GitLab CI/CD.  
Pas un fichier Git, mais commence par .git.

---

📄 14. .github/
Dossier contenant :

- templates d’issues  
- templates de PR  
- workflows GitHub Actions  
- CODEOWNERS  
- SECURITY.md  
- SUPPORT.md  

Ce n’est pas un fichier Git, mais il commence par .git.

---

🎯 Résumé : les fichiers .git* réellement utilisés par Git

| Fichier | Rôle |
|--------|------|
| .git/ | Base de données interne du dépôt |
| .gitignore | Ignorer des fichiers |
| .gitattributes | Normalisation & attributs |
| .gitmodules | Submodules |
| .gitmessage | Template de commit |
| .gitconfig | Config utilisateur |
| .gitignore_global | Ignore global |
| .git-blame-ignore-revs | Ignore commits dans blame |

---

⭐ Conclusion

👉 Les seuls fichiers .git* que tu dois créer toi-même sont :  
- .gitignore  
- .gitattributes  
- .gitmessage (optionnel)  
- .git-blame-ignore-revs (optionnel)  
- .gitkeep (pour dossiers vides)

👉 Tu ne mets jamais rien dans .git/  
👉 Tu ne déplaces jamais .gitignore dans .github/

---
