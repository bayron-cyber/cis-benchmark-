#!/usr/bin/env bash

# Initialisation des variables
l_output=""
l_output2=""
l_output3=""
l_searchloc="/lib/modprobe.d/.conf /usr/local/lib/modprobe.d/.conf /run/modprobe.d/.conf /etc/modprobe.d/.conf"

# Liste des modules à vérifier
modules=("cramfs" "freevxfs" "jffs2" "hfs" "hfsplus" "squashfs" "udf")

# Fonction de vérification des modules
check_module() {
    l_mname="$1"
    l_mtype="fs"
    l_mpath="/lib/modules//kernel/$l_mtype"
    l_mpname="$(tr '-' '_' <<< "$l_mname")"
    l_mndir="$(tr '-' '/' <<< "$l_mname")"

    module_loadable_chk
    module_loaded_chk
    module_deny_chk
}

module_loadable_chk() {
    l_loadable="$(modprobe -n -v "$l_mname")"
    [ "$(wc -l <<< "$l_loadable")" -gt "1" ] && l_loadable="$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")"

    if grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$l_loadable"; then
        l_output="$l_output\n - module: \"$l_mname\" is not loadable: \"$l_loadable\""
    else
        l_output2="$l_output2\n - module: \"$l_mname\" is loadable: \"$l_loadable\""
    fi
}

module_loaded_chk() {
    if ! lsmod | grep "$l_mname" > /dev/null 2>&1; then
        l_output="$l_output\n - module: \"$l_mname\" is not loaded"
    else
        l_output2="$l_output2\n - module: \"$l_mname\" is loaded"
    fi
}

module_deny_chk() {
    if modprobe --showconfig | grep -Pq -- '^\h*blacklist\h+'"$l_mpname"'\b'; then
        l_output="$l_output\n - module: \"$l_mname\" is deny listed in: \"$(grep -Pls -- "^\h*blacklist\h+$l_mname\b" $l_searchloc)\""
    else
        l_output2="$l_output2\n - module: \"$l_mname\" is not deny listed"
    fi
}

# Vérification de chaque module
for l_mname in "${modules[@]}"; do
    for l_mdir in $l_mpath; do
        if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
            l_output3="$l_output3\n - \"$l_mdir\""
            module_deny_chk
            if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
                module_loadable_chk
                module_loaded_chk
            fi
        else
            l_output="$l_output\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\""
        fi
    done
done

# Rapport des résultats
[ -n "$l_output3" ] && echo -e "\n\n -- INFO --\n - module: \"$l_mname\" exists in:$l_output3"
if [ -z "$l_output" ] && [ -z "$l_output2" ]; then
    echo -e "\nAprès l'audit, tous les modules ont été vérifiés ; le système est désormais conforme aux recommandations de sécurité."
else
    echo -e "\nAprès l'audit, certains modules doivent être examinés."
fi
