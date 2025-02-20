# dpkg-query -s bluez &>/dev/null && echo "bluez is installed"
# systemctl is-enabled bluetooth.service 2>/dev/null | grep 'enabled'
Nothing should be returned
# systemctl is-active bluetooth.service 2>/dev/null | grep '^active'
Nothing should be returned
