
#!/bin/bash

# Remédiation des permissions des fichiers système critiques
echo "Configuration des permissions des fichiers système critiques..."

# Définir les fichiers à configurer et leurs permissions souhaitées
declare -A files_permissions=(
    ["/etc/passwd"]="644"
    ["/etc/shadow"]="640"
    ["/etc/group"]="644"
    ["/etc/gshadow"]="640"
    ["/etc/sudoers"]="440"
)

# Configurer les permissions
for file in "${!files_permissions[@]}"; do
    if [ -e "$file" ]; then
        expected_perm=${files_permissions[$file]}
        echo "Configuration des permissions de $file à $expected_perm..."
        sudo chmod "$expected_perm" "$file"
    else
        echo "WARNING: $file n'existe pas"
    fi
done

# Vérification finale des permissions
echo "Permissions des fichiers système critiques après remédiation :"
for file in "${!files_permissions[@]}"; do
    if [ -e "$file" ]; then
        current_perm=$(stat -c "%a" "$file")
        echo "$file: Permissions actuelles = $current_perm"
    fi
done


