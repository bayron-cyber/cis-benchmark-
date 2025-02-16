# dpkg-query -s avahi-daemon &>/dev/null && echo "avahi-daemon is installed"
or
# systemctl is-enabled avahi-daemon.socket avahi-daemon.service 2>/dev/null | grep 'enabled'
Nothing should be returned
# systemctl is-active avahi-daemon.socket avahi-daemon.service 2>/dev/null | grep '^active'
Nothing should be returned
