# dpkg-query -s rsync &>/dev/null && echo "rsync is installed"
or
# systemctl is-enabled rsync.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active rsync.service 2>/dev/null | grep '^active'
Nothing should be returned
