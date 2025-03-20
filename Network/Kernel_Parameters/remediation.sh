#!/bin/bash

# Remédiation des paramètres de sécurité réseau
echo "Configuration des paramètres de sécurité réseau..."

# Désactiver ip_forward
sudo sysctl -w net.ipv4.ip_forward=0

# Désactiver icmp_redirects
sudo sysctl -w net.ipv4.conf.all.accept_redirects=0

# Activer rp_filter
sudo sysctl -w net.ipv4.conf.all.rp_filter=1

# Désactiver source route
sudo sysctl -w net.ipv4.conf.all.accept_source_route=0

# Enregistrer les modifications dans /etc/sysctl.conf pour qu'elles persistent après un redémarrage
{
    echo "net.ipv4.ip_forward=0"
    echo "net.ipv4.conf.all.accept_redirects=0"
    echo "net.ipv4.conf.all.rp_filter=1"
    echo "net.ipv4.conf.all.accept_source_route=0"
} | sudo tee -a /etc/sysctl.conf

# Appliquer les modifications
sudo sysctl -p

# Vérification finale
echo "Vérification des paramètres de sécurité réseau..."
sysctl net.ipv4.ip_forward
sysctl net.ipv4.conf.all.accept_redirects
sysctl net.ipv4.conf.all.rp_filter
sysctl net.ipv4.conf.all.accept_source_route
