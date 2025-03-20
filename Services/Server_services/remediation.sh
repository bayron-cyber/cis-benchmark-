#!/bin/bash

# Liste des services non essentiels à désactiver
services=("autofs" "avahi-daemon" "ftp" "telnet" "nfs-common")

# Désactivation des services
echo "Désactivation des services non essentiels..."
for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "Désactivation de $service..."
        sudo systemctl stop "$service"
        sudo systemctl disable "$service"
        echo "Service $service désactivé."
    else
        echo "Service $service est déjà désactivé."
    fi
done

# Vérification finale
echo "Vérification des services désactivés..."
for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "Service $service est encore actif."
    else
        echo "Service $service est désactivé."
    fi
done
