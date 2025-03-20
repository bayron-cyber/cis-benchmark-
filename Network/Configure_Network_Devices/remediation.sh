#!/bin/bash

# Désactivation des interfaces sans fil
echo "Désactivation des interfaces sans fil..."
sudo ip link set down wlan0  # Remplacez wlan0 par le nom de votre interface sans fil

# Désactivation du service Bluetooth
echo "Désactivation du service Bluetooth..."
if systemctl is-active --quiet bluetooth; then
    echo "Arrêt de Bluetooth..."
    sudo systemctl stop bluetooth
    sudo systemctl disable bluetooth
    echo "Bluetooth désactivé."
else
    echo "Bluetooth est déjà désactivé."
fi

# Vérification finale
echo "Vérification des interfaces..."
iwconfig 2>/dev/null | grep -E 'no wireless extensions' || echo "Des interfaces sans fil sont encore actives."
if systemctl is-active --quiet bluetooth; then
    echo "Bluetooth est encore actif."
else
    echo "Bluetooth est désactivé."
fi
