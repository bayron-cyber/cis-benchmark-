#!/bin/bash

# Audit de UFW
echo "Audit de UFW..."

# Vérifier si UFW est installé
if command -v ufw > /dev/null; then
    echo "UFW est installé."
else
    echo "UFW n'est pas installé."
fi

# Vérifier l'état de UFW
ufw_status=$(sudo ufw status verbose)
echo "État de UFW :"
echo "$ufw_status"

# Vérifier les règles configurées
echo "Règles configurées :"
sudo ufw status numbered


