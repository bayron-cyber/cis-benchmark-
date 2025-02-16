# dpkg-query -s dnsmasq &>/dev/null && echo "dnsmasq is installed"
or
# systemctl is-enabled dnsmasq.service 2>/dev/null | grep 'enabled'
Nothing should be returned
# systemctl is-active dnsmasq.service 2>/dev/null | grep '^active'
Nothing should be returned
