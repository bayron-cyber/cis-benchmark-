# Audit des interfaces réseau
echo "Audit des interfaces réseau..."

# Vérifier les interfaces sans fil
echo "Vérification des interfaces sans fil..."
iwconfig 2>/dev/null | grep -E 'no wireless extensions' || echo "Des interfaces sans fil sont actives."

# Vérifier les interfaces Bluetooth
echo "Vérification des interfaces Bluetooth..."
if systemctl is-active --quiet bluetooth; then
    echo "Bluetooth est actif."
else
    echo "Bluetooth est désactivé."
fi


