#!/bin/sh
sleep 1m
`sudo wifite --kill | tee output.txt`
sleep 1m
'xdotool key ctrl+c'
'xdotool key Enter'
