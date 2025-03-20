# dpkg-query -s bind9 &>/dev/null && echo "bind9 is installed"
or
# systemctl is-enabled bind9.service 2>/dev/null | grep 'enabled'
Nothing should be returned
# systemctl is-active bind9.service 2>/dev/null | grep '^active'
Nothing should be returned
