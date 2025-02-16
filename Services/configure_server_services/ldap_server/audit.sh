# dpkg-query -s slapd &>/dev/null && echo "slapd is installed"
or
# systemctl is-enabled slapd.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active slapd.service 2>/dev/null | grep '^active'
Nothing should be returned
