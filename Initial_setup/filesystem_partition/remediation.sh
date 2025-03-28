#!/usr/bin/env bash

# Initialisation des variables
l_output=""
l_remediation_output=""
l_critical_partitions=("/tmp" "/var" "/home")
l_mount_options=("nodev" "nosuid" "noexec")

# Fonction pour vérifier et remédier aux options de montage
check_and_remediate_mount_options() {
    local mount_point="$1"
    local missing_options=()
    local fstab_updated=false
    
    # Récupérer les options de montage actuelles
    mount_info=$(mount | grep "${mount_point} ")
    
    if [[ -z "$mount_info" ]]; then
        l_output="$l_output\n - Partition: \"$mount_point\" n'est pas montée."
    else
        options=$(echo "$mount_info" | awk '{print $6}' | tr -d '()')
        
        # Vérifier les options manquantes
        for option in "${l_mount_options[@]}"; do
            if ! echo "$options" | grep -q "$option"; then
                missing_options+=("$option")
            fi
        done
    fi
    
    # Si des options sont manquantes, mise à jour de /etc/fstab et remonter la partition
    if [[ ${#missing_options[@]} -gt 0 ]]; then
        l_output="$l_output\n - Partition: \"$mount_point\" ne contient pas les options de montage: ${missing_options[*]}"
        
        # Vérifier si la partition est déjà dans /etc/fstab
        if grep -q "${mount_point}" /etc/fstab; then
            sed -i.bak "/${mount_point}/ s/defaults/defaults,${missing_options[*]}/" /etc/fstab
        else
            echo "$mount_point    tmpfs    defaults,${l_mount_options[*]}    0 0" >> /etc/fstab
        fi
        
        mount -o remount,"${missing_options[*]}" "$mount_point"
        l_remediation_output="$l_remediation_output\n - Remédiation appliquée sur \"$mount_point\" : ajout des options ${missing_options[*]}"
    fi
}

# Audit et remédiation des partitions critiques
for partition in "${l_critical_partitions[@]}"; do
    check_and_remediate_mount_options "$partition"
done

# Rapport des résultats
if [ -z "$l_output" ]; then
    echo -e "\nToutes les partitions critiques sont correctement montées avec les options appropriées."
else
    echo -e "\nProblèmes détectés :$l_output"
fi

if [ -n "$l_remediation_output" ]; then
    echo -e "\nRemédiation effectuée :$l_remediation_output"
else
    echo -e "\nAucune remédiation nécessaire."
fi
