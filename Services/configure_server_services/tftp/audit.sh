# dpkg-query -s tftpd-hpa &>/dev/null && echo "tftpd-hpa is installed"
or
# systemctl is-enabled tftpd-hpa.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-enabled tftpd-hpa.service 2>/dev/null | grep 'enabled'
Nothing should be returned

