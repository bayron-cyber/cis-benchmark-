# dpkg-query -s ypserv &>/dev/null && echo "ypserv is installed"
or
# systemctl is-enabled ypserv.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active ypserv.service 2>/dev/null | grep '^active'
Nothing should be returned
