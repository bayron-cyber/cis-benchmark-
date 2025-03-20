#!/bin/bash

# Remédiation de la configuration de sudo
echo "Configuration de sudo pour limiter l'élévation de privilèges..."

# Fichier de configuration sudo
sudoers_file="/etc/sudoers"

# Sauvegarder la configuration actuelle
sudo cp "$sudoers_file" "$sudoers_file.bak"

# Ajouter ou modifier les paramètres de sécurité dans sudoers
echo "Defaults    env_reset" | sudo tee -a "$sudoers_file" > /dev/null
echo "Defaults    mail_badge" | sudo tee -a "$sudoers_file" > /dev/null
echo "Defaults    secure_path=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"" | sudo tee -a "$sudoers_file" > /dev/null

# Limiter l'accès à un utilisateur nommé 'admin' (ou un autre nom)
echo "admin ALL=(ALL) ALL" | sudo tee -a "$sudoers_file" > /dev/null

# Vérification finale
echo "Configuration de sudo après remédiation :"
sudo grep -E '^(Defaults|admin)' "$sudoers_file"

