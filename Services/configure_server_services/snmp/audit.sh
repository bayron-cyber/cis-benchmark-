# dpkg-query -s snmpd &>/dev/null && echo "snmpd is installed"

or
# systemctl is-enabled snmpd.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active snmpd.service 2>/dev/null | grep '^active'
Nothing should be returned
