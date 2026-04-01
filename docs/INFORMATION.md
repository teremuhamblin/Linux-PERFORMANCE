# 🧩 Ordre d’installation et d’exécution recommandé

1️⃣ mint-install.sh
(optionnel mais recommandé en premier)
Objectif : installer proprement tous les scripts dans /usr/local/bin  
Pourquoi en premier :  
- Tu mets en place ton environnement d’administration  
- Tu garantis que tous les scripts sont accessibles globalement  
- Tu évites les chemins relatifs et les erreurs d’exécution

👉 C’est ton “bootstrap” du framework.

---

2️⃣ mint-tools.sh (chargé automatiquement par les autres scripts)
Objectif : fournir les fondations :  
- logging avancé  
- dry-run  
- debug  
- exécution sécurisée  
- gestion des erreurs  
- confirmation  
- wrapper run_cmd  

Pourquoi en deuxième :  
- Tous les autres scripts en dépendent  
- Il doit être présent et fonctionnel avant toute action système

👉 C’est le cœur technique de ton framework.

---

3️⃣ mint-setup.sh (orchestrateur principal)
Objectif :  
- orchestrer les modules  
- gérer les options globales (--dry-run, --debug, --yes)  
- exécuter les plugins  
- lancer les modules dans le bon ordre  

Pourquoi maintenant :  
- C’est le chef d’orchestre  
- Il doit être prêt avant d’appeler les modules  
- Il valide que tout est en place

👉 C’est ton “gestionnaire de configuration” central.

---

4️⃣ mint-perf.sh (optimisations de performance)
Objectif :  
- nettoyer le système  
- optimiser le noyau (swappiness, zram, etc.)  
- désactiver services inutiles  
- améliorer la réactivité globale  

Pourquoi avant la sécurité :  
- Certaines optimisations modifient des services  
- Le nettoyage peut supprimer des paquets non essentiels  
- Le système doit être propre avant d’être durci

👉 On optimise d’abord, on verrouille ensuite.

---

5️⃣ mint-sec.sh (durcissement de la sécurité)
Objectif :  
- configurer UFW  
- durcir SSH  
- appliquer sysctl sécurité  
- renforcer le réseau  

Pourquoi après la performance :  
- Le durcissement peut bloquer des services utilisés par les optimisations  
- On évite de devoir rouvrir des ports ou modifier des règles  
- On sécurise un système déjà optimisé

👉 On verrouille une base saine et performante.

---

6️⃣ mint-desktop.sh (réglages Cinnamon / UX)
Objectif :  
- améliorer la réactivité de Cinnamon  
- appliquer des réglages d’interface  
- charger éventuellement un profil dconf  

Pourquoi en dernier :  
- Les réglages UX ne doivent pas être perturbés par les optimisations système  
- Certains paramètres peuvent dépendre de services déjà optimisés  
- C’est la couche la plus “haute” du système

👉 On finit par l’expérience utilisateur, une fois le système solide.

---

7️⃣ Plugins (mint-plugin-*.sh)
Objectif :  
- ajouter des fonctionnalités modulaires  
- installer des environnements (dev, docker, pentest, etc.)  
- personnaliser selon le rôle de la machine  

Pourquoi en tout dernier :  
- Les plugins dépendent d’un système déjà optimisé et sécurisé  
- Ils peuvent installer des paquets, services, environnements  
- Ils doivent s’appuyer sur une base stable

👉 Les plugins sont la couche “fonctionnelle” finale.

---

🧱 Résumé visuel (ordre strict)

`
1. mint-install.sh     (optionnel mais recommandé)
2. mint-tools.sh       (fondation)
3. mint-setup.sh       (orchestrateur)
4. mint-perf.sh        (performance)
5. mint-sec.sh         (sécurité)
6. mint-desktop.sh     (UX / Cinnamon)
7. mint-plugin-*.sh    (extensions)
`

---

🧠 Pourquoi cet ordre est le plus stable ?

- On installe → on prépare → on optimise → on sécurise → on personnalise.  
- C’est exactement la logique utilisée dans les environnements professionnels (DevOps, SRE, SecOps).  
- Tu évites les conflits entre modules.  
- Tu garantis une cohérence totale du système.  
- Tu peux rejouer les scripts sans casser la machine.  

---
