#!/usr/bin/env bash

# Liste des modules à désactiver
modules=("cramfs" "freevxfs" "jffs2" "hfs" "hfsplus" "squashfs" "udf")

# Fonction de désactivation des modules
remediate_module() {
    l_mname="$1"
    
    if lsmod | grep -q "$l_mname"; then
        echo "Désactivation de $l_mname..."
        modprobe -r "$l_mname" 2>/dev/null
        echo "- Module \"$l_mname\" a été désactivé."
    else
        echo "- Module \"$l_mname\" est déjà désactivé."
    fi

    # Ajout à la blacklist pour empêcher le chargement futur
    if ! grep -q "^blacklist $l_mname" /etc/modprobe.d/blacklist.conf; then
        echo "blacklist $l_mname" >> /etc/modprobe.d/blacklist.conf
        echo "- Module \"$l_mname\" a été ajouté à la liste noire."
    else
        echo "- Module \"$l_mname\" est déjà dans la liste noire."
    fi
}

# Remédiation pour chaque module
for l_mname in "${modules[@]}"; do
    remediate_module "$l_mname"
done

echo -e "\nRemédiation terminée. Tous les modules non nécessaires ont été vérifiés et désactivés si nécessaire."
