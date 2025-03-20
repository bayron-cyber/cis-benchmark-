# dpkg-query -s vsftpd &>/dev/null && echo "vsftpd is installed"
or
# systemctl is-enabled vsftpd.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active vsftpd.service 2>/dev/null | grep '^active'
Nothing should be returned
