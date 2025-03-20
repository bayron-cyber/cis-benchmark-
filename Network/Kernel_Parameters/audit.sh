#!/bin/bash

# Audit des paramètres de sécurité réseau
echo "Audit des paramètres de sécurité réseau..."

# Vérifier ip_forward
ip_forward=$(sysctl net.ipv4.ip_forward)
echo "$ip_forward"

# Vérifier icmp_redirects
icmp_redirects=$(sysctl net.ipv4.conf.all.accept_redirects)
echo "$icmp_redirects"

# Vérifier rp_filter
rp_filter=$(sysctl net.ipv4.conf.all.rp_filter)
echo "$rp_filter"

# Vérifier source route
source_route=$(sysctl net.ipv4.conf.all.accept_source_route)
echo "$source_route"


