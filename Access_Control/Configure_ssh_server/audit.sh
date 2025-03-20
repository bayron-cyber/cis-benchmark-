#!/bin/bash

# Audit de la configuration SSH
echo "Audit de la configuration SSH..."

# Fichier de configuration SSH
sshd_config="/etc/ssh/sshd_config"

# Vérifier les paramètres de sécurité
echo "Vérification de PermitRootLogin..."
grep "^PermitRootLogin" "$sshd_config"

echo "Vérification de PasswordAuthentication..."
grep "^PasswordAuthentication" "$sshd_config"

echo "Vérification de PermitEmptyPasswords..."
grep "^PermitEmptyPasswords" "$sshd_config"

echo "Vérification de MaxAuthTries..."
grep "^MaxAuthTries" "$sshd_config"

echo "Vérification de AllowUsers..."
grep "^AllowUsers" "$sshd_config"

echo "Vérification de PubkeyAuthentication..."
grep "^PubkeyAuthentication" "$sshd_config"


