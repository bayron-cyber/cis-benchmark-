#!/bin/bash

# Audit de la configuration d'auditd
echo "Audit de la configuration d'auditd..."

# Vérifier si auditd est installé
if command -v auditd > /dev/null; then
    echo "auditd est installé."
else
    echo "auditd n'est pas installé."
    exit 1
fi

# Vérifier si auditd est actif
auditd_status=$(systemctl is-active auditd)
if [ "$auditd_status" == "active" ]; then
    echo "auditd est actif."
else
    echo "auditd n'est pas actif."
fi

# Vérifier la configuration actuelle
auditd_config="/etc/audit/auditd.conf"
echo "Configuration actuelle d'auditd :"
sudo cat "$auditd_config"

# Vérifier les règles d'audit
audit_rules="/etc/audit/audit.rules"
echo "Règles d'audit actuelles :"
sudo cat "$audit_rules"



