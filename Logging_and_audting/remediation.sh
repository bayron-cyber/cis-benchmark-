#!/bin/bash

# Remédiation de la configuration d'auditd
echo "Installation et configuration d'auditd..."

# Installer auditd si ce n'est pas déjà fait
if ! command -v auditd > /dev/null; then
    echo "Installation de auditd..."
    sudo apt update
    sudo apt install -y auditd
else
    echo "auditd est déjà installé."
fi

# Activer et démarrer auditd
echo "Activation et démarrage de auditd..."
sudo systemctl enable auditd
sudo systemctl start auditd

# Configurer auditd
auditd_config="/etc/audit/auditd.conf"
echo "Configuration des paramètres d'auditd..."
sudo sed -i 's/^max_log_file = .*/max_log_file = 10/' "$auditd_config"  # Limiter la taille du fichier journal
sudo sed -i 's/^space_left_action = .*/space_left_action = email/' "$auditd_config"  # Notification par email
sudo sed -i 's/^action_mail_acct = .*/action_mail_acct = root/' "$auditd_config"  # Compte pour les notifications

# Ajouter des règles d'audit
audit_rules="/etc/audit/audit.rules"
echo "Ajouter des règles d'audit..."
{
    echo "-w /etc/passwd -p wa -k user_modifications"
    echo "-w /etc/shadow -p wa -k user_modifications"
    echo "-w /etc/group -p wa -k group_modifications"
    echo "-w /etc/gshadow -p wa -k group_modifications"
} | sudo tee -a "$audit_rules" > /dev/null

# Redémarrer auditd pour appliquer les modifications
echo "Redémarrage de auditd..."
sudo systemctl restart auditd

# Vérification finale
echo "Configuration d'auditd après remédiation :"
sudo cat "$auditd_config"
echo "Règles d'audit actuelles :"
sudo cat "$audit_rules"

