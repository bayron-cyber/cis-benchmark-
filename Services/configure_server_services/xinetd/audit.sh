# dpkg-query -s xinetd &>/dev/null && echo "xinetd is installed"
or
# systemctl is-enabled xinetd.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active xinetd.service 2>/dev/null | grep '^active'
Nothing should be returned

