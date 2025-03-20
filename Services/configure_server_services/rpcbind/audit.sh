# dpkg-query -s rpcbind &>/dev/null && echo "rpcbind is installed"
or
# systemctl is-enabled rpcbind.socket rpcbind.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active rpcbind.socket rpcbind.service 2>/dev/null | grep '^active'
Nothing should be returned
