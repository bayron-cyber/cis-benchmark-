# dpkg-query -s samba &>/dev/null && echo "samba is installed"
or
# systemctl is-enabled smbd.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active smbd.service 2>/dev/null | grep '^active'
Nothing should be returned
