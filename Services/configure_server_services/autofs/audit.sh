# dpkg-query -s autofs &>/dev/null && echo "autofs is installed"
# systemctl is-enabled autofs.service 2>/dev/null | grep 'enabled'
Nothing should be returned
# systemctl is-active autofs.service 2>/dev/null | grep '^active'
Nothing should be returned
