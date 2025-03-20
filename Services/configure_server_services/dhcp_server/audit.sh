# dpkg-query -s isc-dhcp-server &>/dev/null && echo "isc-dhcp-server is installed"
or
# systemctl is-enabled isc-dhcp-server.service isc-dhcp-server6.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active isc-dhcp-server.service isc-dhcp-server6.service 2>/dev/null | grep '^active'

Nothing should be returned
