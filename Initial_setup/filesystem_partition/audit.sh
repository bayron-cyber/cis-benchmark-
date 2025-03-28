#!/usr/bin/env bash

# Initialisation des variables
l_output=""
l_critical_partitions=("/tmp" "/var" "/home")
l_mount_options=("nodev" "nosuid" "noexec")

# Fonction pour vérifier les options de montage
check_mount_options() {
    local mount_point="$1"
    local expected_options="$2"
    
    # Récupérer les options de montage actuelles
    mount_info=$(mount | grep "$mount_point")
    
    if [[ -z "$mount_info" ]]; then
        l_output="$l_output\n - Partition: \"$mount_point\" n'est pas montée."
    else
        options=$(echo "$mount_info" | awk '{print $6}') # Obtenir les options de montage

        # Vérifier si toutes les options attendues sont présentes
        for option in ${expected_options[@]}; do
            if ! echo "$options" | grep -q "$option"; then
                l_output="$l_output\n - Partition: \"$mount_point\" ne contient pas l'option de montage: \"$option\"."
            fi
        done
    fi
}

# Audit des partitions critiques
for partition in "${l_critical_partitions[@]}"; do
    check_mount_options "$partition" "${l_mount_options[@]}"
done

# Rapport des résultats
if [ -z "$l_output" ]; then
    echo -e "\nAprès l'audit, toutes les partitions critiques sont correctement montées avec les options appropriées."
else
    echo -e "\nAprès l'audit, les problèmes suivants ont été identifiés :$l_output"
fi
