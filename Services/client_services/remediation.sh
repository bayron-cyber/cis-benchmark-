#!/bin/bash

# Liste des clients non essentiels à désinstaller
clients=("telnet" "rsh-client" "ftp" "nfs-common")

# Désinstallation des clients
echo "Désinstallation des clients non essentiels..."
for client in "${clients[@]}"; do
    if dpkg -l | grep -q "$client"; then
        echo "Désinstallation de $client..."
        sudo apt remove --purge -y "$client"
        echo "Client $client désinstallé."
    else
        echo "Client $client n'est pas installé."
    fi
done

# Vérification finale
echo "Vérification des clients désinstallés..."
for client in "${clients[@]}"; do
    if dpkg -l | grep -q "$client"; then
        echo "Client $client est encore installé."
    else
        echo "Client $client est désinstallé."
    fi
done
