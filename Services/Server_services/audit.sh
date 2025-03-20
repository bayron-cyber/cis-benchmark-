
#!/bin/bash

# Liste des services non essentiels à vérifier
services=("autofs" "avahi-daemon" "ftp" "telnet" "nfs-common")

# Audit des services
echo "Audit des services non essentiels..."
for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "Service $service est actif."
    else
        echo "Service $service est désactivé."
    fi
done

