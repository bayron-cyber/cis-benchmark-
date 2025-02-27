# dpkg-query -s squid &>/dev/null && echo "squid is installed"
or

# systemctl is-enabled squid.service 2>/dev/null | grep 'enabled'
Nothing should be returned


# systemctl is-active squid.service 2>/dev/null | grep '^active'
Nothing should be returned

