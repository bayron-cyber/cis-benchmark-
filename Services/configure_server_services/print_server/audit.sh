# dpkg-query -s cups &>/dev/null && echo "cups is installed"
or
# systemctl is-enabled cups.socket cups.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active cups.socket cups.service 2>/dev/null | grep '^active'
Nothing should be returned
