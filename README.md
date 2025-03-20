# README du CIS Benchmark

## Introduction

Le CIS Benchmark est un ensemble de bonnes pratiques et de recommandations élaborées par le Center for Internet Security (CIS) pour sécuriser les systèmes d'exploitation Linux. Ce document fournit un cadre pour évaluer et améliorer la sécurité d'un système en suivant des contrôles spécifiques. Les recommandations sont basées sur des analyses de sécurité approfondies et des expériences pratiques, visant à minimiser les vulnérabilités et à assurer une gestion sécurisée des systèmes.

## Objectif

L'objectif principal de ce benchmark est de fournir une liste de vérifications automatisées et manuelles que les administrateurs systèmes peuvent suivre pour renforcer la sécurité de leurs installations Linux. Cela inclut des configurations pour :

- **Configuration initiale** : Vérification des modules du noyau, des partitions, et des configurations de sécurité de base.
- **Gestion des services** : Assurer que seuls les services nécessaires sont en cours d'exécution.
- **Contrôle d'accès** : Configurer SSH, l'élévation de privilèges, et les modules d'authentification.
- **Journalisation et audit** : Mettre en place des systèmes de journalisation efficaces et de vérification de l'intégrité des fichiers.
- **Maintenance du système** : Gérer les permissions des fichiers critiques et les paramètres des utilisateurs.

## Utilisation

Ce document contient des scripts d'audit et de remédiation organisés en différentes sections selon les recommandations du CIS Benchmark. Chaque section peut être utilisée pour vérifier et corriger les configurations des systèmes Linux.

### Étapes d'Utilisation

1. **Clonez le dépôt** :
   ```bash
   git clone <URL_du_dépôt>
   cd <nom_du_dossier>
2. **Accédez aux sections** :
Les scripts sont organisés par catégories. Accédez à la section de votre choix, par exemple pour l'audit :
 ```bash
cd access_control/audit
```
Exécutez les scripts d'audit :
Pour vérifier l'état actuel de votre système par rapport aux recommandations, exécutez les scripts d'audit :
```bash
chmod +x *.sh
./nom_du_script_audit.sh
```
Remédiez les configurations :
Après avoir passé en revue les résultats des audits, utilisez les scripts de remédiation pour appliquer les configurations nécessaires :
```bash
cd ../remediation
./nom_du_script_remediation.sh
```
Vérifiez les résultats :
Après exécution des scripts, vérifiez à nouveau avec les scripts d'audit pour confirmer que les modifications ont été appliquées avec succès.  
### Résumé Global
Le CIS Benchmark pour Linux est un guide exhaustif qui aide les administrateurs à sécuriser leurs systèmes en suivant des recommandations spécifiques. Il couvre des domaines essentiels tels que :

**Sécurité du système de fichiers** : Configuration des partitions et des modules du noyau.  
**Gestion des services** : Désactivation des services inutiles pour réduire la surface d'attaque.  
**Contrôle d'accès** : Renforcement des paramètres SSH et des droits d'accès des utilisateurs.  
**Journalisation**: Mise en place de solutions d'audit et de journalisation pour assurer la traçabilité des actions.  
**Maintenance** : Gestion des permissions des fichiers critiques et des comptes utilisateurs.  
En suivant ce benchmark, les administrateurs peuvent améliorer significativement la sécurité de leurs systèmes Linux, réduire les risques de vulnérabilités et garantir une meilleure conformité aux normes de sécurité.    


## Conclusion  

Le CIS Benchmark est un outil précieux pour toute organisation cherchant à protéger ses systèmes Linux. En intégrant ces pratiques dans vos procédures de gestion des systèmes, vous contribuez à créer un environnement plus sécurisé et résilient face aux menaces potentielles. N'hésitez pas à consulter la documentation et à adapter les recommandations à votre cadre opérationnel spécifique.
