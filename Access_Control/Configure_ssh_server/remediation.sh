#!/bin/bash

# Remédiation de la configuration SSH
echo "Configuration des paramètres de sécurité SSH..."

# Fichier de configuration SSH
sshd_config="/etc/ssh/sshd_config"

# Sauvegarder la configuration actuelle
sudo cp "$sshd_config" "$sshd_config.bak"

# Configurer les paramètres de sécurité
echo "PermitRootLogin no" | sudo tee -a "$sshd_config" > /dev/null
echo "PasswordAuthentication no" | sudo tee -a "$sshd_config" > /dev/null
echo "PermitEmptyPasswords no" | sudo tee -a "$sshd_config" > /dev/null
echo "MaxAuthTries 3" | sudo tee -a "$sshd_config" > /dev/null
# Remplacez 'username' par les utilisateurs autorisés si nécessaire
echo "AllowUsers username" | sudo tee -a "$sshd_config" > /dev/null
echo "PubkeyAuthentication yes" | sudo tee -a "$sshd_config" > /dev/null

# Redémarrer le service SSH pour appliquer les modifications
echo "Redémarrage du service SSH..."
sudo systemctl restart sshd

# Vérification finale
echo "État de la configuration SSH après remédiation :"
sudo grep -E "PermitRootLogin|PasswordAuthentication|PermitEmptyPasswords|MaxAuthTries|AllowUsers|PubkeyAuthentication" "$sshd_config"

