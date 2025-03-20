#!/bin/bash

# Ajouter une clé GPG
echo "Ajout de la clé GPG..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys YOUR_GPG_KEY_ID

# Configurer les dépôts de paquets
echo "Configuration des dépôts de paquets..."
echo "deb http://archive.ubuntu.com/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/custom.list

# Mettre à jour la liste des paquets
echo "Mise à jour de la liste des paquets..."
sudo apt update

echo "Configuration terminée."


