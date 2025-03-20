#!/bin/bash

# Audit des permissions des fichiers système critiques
echo "Audit des permissions des fichiers système critiques..."

# Définir les fichiers à vérifier et leurs permissions attendues
declare -A files_permissions=(
    ["/etc/passwd"]="644"
    ["/etc/shadow"]="640"
    ["/etc/group"]="644"
    ["/etc/gshadow"]="640"
    ["/etc/sudoers"]="440"
)

# Vérifier les permissions
for file in "${!files_permissions[@]}"; do
    if [ -e "$file" ]; then
        current_perm=$(stat -c "%a" "$file")
        expected_perm=${files_permissions[$file]}
        echo "$file: Permissions actuelles = $current_perm, Permissions attendues = $expected_perm"
        if [ "$current_perm" != "$expected_perm" ]; then
            echo "ALERT: Permissions incorrectes sur $file"
        fi
    else
        echo "WARNING: $file n'existe pas"
    fi
done


