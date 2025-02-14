# grub-mkpasswd-pbkdf2 --iteration-count=600000 --salt=64
Enter password: <password> Reenter password: <password>
PBKDF2 hash of your password is <encrypted-password>
cat <<EOF
exec tail -n +2 $0
set superusers="<username>"
password_pbkdf2 <username> <encrypted-password> EOF
CLASS="--class gnu-linux --class gnu --class os --unrestricted"
# update-grub
