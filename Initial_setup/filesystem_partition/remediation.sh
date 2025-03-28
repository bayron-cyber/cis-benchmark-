#!/usr/bin/env bash

# Initialisation des variables
l_remediation_output=""
l_critical_partitions=("/tmp" "/var" "/home")
l_mount_options=("nodev" "nosuid" "noexec")

# Fonction pour remédier aux options de montage
remediate_mount_options() {
    local mount_point="$1"
    
    # Ajouter les options de montage dans /etc/fstab
    if ! grep -q "$mount_point" /etc/fstab; then
        echo "$mount_point    $mount_point    tmpfs    defaults,nodev,nosuid,noexec    0 0" >> /etc/fstab
        l_remediation_output="$l_remediation_output\n - Ajout de \"$mount_point\" à /etc/fstab avec les options appropriées."
    else
        # Modifier la ligne existante pour ajouter les options appropriées
        sed -i.bak "s|^$mount_point.*|$mount_point    $mount_point    tmpfs    defaults,nodev,nosuid,noexec    0 0|" /etc/fstab
        l_remediation_output="$l_remediation_output\n - Mise à jour de \"$mount_point\" dans /etc/fstab avec les options appropriées."
    fi

    # Remonter la partition
    mount -o remount "$mount_point"
}

# Remédiation des partitions critiques
for partition in "${l_critical_partitions[@]}"; do
    remediate_mount_options "$partition"
done

# Rapport des résultats
if [ -n "$l_remediation_output" ]; then
    echo -e "\nRemédiation effectuée :$l_remediation_output"
else
    echo -e "\nAucune remédiation nécessaire."
fi
