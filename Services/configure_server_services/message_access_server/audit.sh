# dpkg-query -s dovecot-imapd &>/dev/null && echo "dovecot-imapd is installed"
# dpkg-query -s dovecot-pop3d &>/dev/null && echo "dovecot-pop3d is installed"
or
# systemctl is-enabled dovecot.socket dovecot.service 2>/dev/null | grep 'enabled'
Nothing should be returned

# systemctl is-active dovecot.socket dovecot.service 2>/dev/null | grep '^active'
Nothing should be returned
