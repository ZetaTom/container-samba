#!/bin/bash
echo "Setting up users."
addgroup -g 1000 smbusers
while read -r line <&10; do
	username=$(cut -d ':' -f 1 <<< "$line")
	password=$(cut -d ':' -f 2 <<< "$line")
	adduser -s /bin/false -G smbusers -H -D "$username"
	echo -e "$password\n$password" | smbpasswd -a -s "$username"
done 10< /etc/samba/users.conf
unset username password
exec $@
