# grep "^set superusers" /boot/grub/grub.cfg
set superusers="<username>"
# awk -F. '/^\s*password/ {print $1"."$2"."$3}' /boot/grub/grub.cfg

password_pbkdf2 <username> grub.pbkdf2.sha512
