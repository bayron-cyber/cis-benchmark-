#!/bin/bash

# Remédiation de UFW
echo "Installation et configuration de UFW..."

# Installer UFW si ce n'est pas déjà fait
if ! command -v ufw > /dev/null; then
    echo "Installation de UFW..."
    sudo apt update
    sudo apt install -y ufw
else
    echo "UFW est déjà installé."
fi

# Configurer les règles UFW
echo "Configuration des règles UFW..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Autoriser SSH (port 22)
sudo ufw allow ssh

# Activer UFW
echo "Activation de UFW..."
sudo ufw enable

# Vérification finale
echo "État de UFW après configuration :"
sudo ufw status verbose
