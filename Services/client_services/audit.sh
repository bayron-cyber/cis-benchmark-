#!/bin/bash

# Liste des clients non essentiels à vérifier
clients=("telnet" "rsh-client" "ftp" "nfs-common")

# Audit des clients
echo "Audit des clients non essentiels..."
for client in "${clients[@]}"; do
    if dpkg -l | grep -q "$client"; then
        echo "Client $client est installé."
    else
        echo "Client $client n'est pas installé."
    fi
done

