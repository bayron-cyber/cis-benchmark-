#!/bin/bash

# Vérifier les clés GPG
echo "Vérification des clés GPG..."
gpg --list-keys

# Vérifier les dépôts de paquets
echo "Vérification des dépôts de paquets..."
if [ -f /etc/apt/sources.list ]; then
    echo "Contenu de /etc/apt/sources.list :"
    cat /etc/apt/sources.list
else
    echo "/etc/apt/sources.list n'existe pas."
fi

# Vérifier les fichiers de sources supplémentaires
echo "Vérification des fichiers de sources supplémentaires dans /etc/apt/sources.list.d/..."
if [ -d /etc/apt/sources.list.d ]; then
    ls /etc/apt/sources.list.d/
else
    echo "/etc/apt/sources.list.d/ n'existe pas."
fi


