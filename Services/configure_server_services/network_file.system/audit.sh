# dpkg-query -s nfs-kernel-server &>/dev/null && echo "nfs-kernel-server is installed"
or
# systemctl is-enabled nfs-server.service 2>/dev/null | grep 'enabled'

Nothing should be returned

# systemctl is-active nfs-server.service 2>/dev/null | grep '^active'

Nothing should be returned

