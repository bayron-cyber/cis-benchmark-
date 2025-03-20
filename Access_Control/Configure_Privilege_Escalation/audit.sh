#!/bin/bash

# Audit de la configuration de sudo
echo "Audit de la configuration de sudo..."

# Vérifier si sudo est installé
if command -v sudo > /dev/null; then
    echo "sudo est installé."
else
    echo "sudo n'est pas installé."
    exit 1
fi

# Vérifier le fichier de configuration sudo
sudoers_file="/etc/sudoers"

# Vérification des paramètres de sécurité
echo "Vérification des règles dans $sudoers_file..."
sudo grep -E '^(Defaults|admin)' "$sudoers_file"

# Vérifier les groupes ayant accès à sudo
echo "Groupes ayant accès à sudo :"
sudo grep '^%sudo' "$sudoers_file"



