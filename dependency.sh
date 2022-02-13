#!/bin/sh
apt-get -y install postfix
apt-get -y install sendemail
git clone git clone https://github.com/kimocoder/wifite2.git
cd wifite2
python3 setup.py install
make deps