# PiFi - A Raspberry Pi wifi hacker

Whenever the Raspberry Pi Device is turned on, it attempts to attack all the wifi networks within the area and then emails the succesful results to an email address of your choosing by running the `script.sh` script.

## Prequiestes

* Any [Raspberry Pi](https://www.raspberrypi.com/products/) Zero/Zero W, Zero 2/ Zero 2 W, 1, 2, 3, 4 or 400
* Bootable USB or microSD with the latest [Kali Linux image](https://www.kali.org/get-kali/#kali-arm) (32-bit recommended). At least 16GB capacity. Class 10 cards are highly recommended.
* all Raspberry Pi models from the Raspberry Pi 3 Model B (2016) and later ship with on-board WiFi. If you have an older model on hand, or if your on-board WiFi module is not functioning, you will need to use an **external USB WiFi adapter**.

## Steps

### Creating a bootable USB or microSD

1. Download the [Kali Linux image](https://www.kali.org/get-kali/#kali-arm)
2. Flash the image onto the USB or microSD card using [balenaEtcher](https://www.balena.io/etcher/) or any other preffered method of flashing.
   ***Note! This will format the drive so make sure to backup any needed data on the drive.***

### Startup the Pi

1. With the newly flashed microSD card or USB drive in the Raspberry Pi, plug it into power, and plug the Micro-HDMI cable into a monitor. Plug in a keyboard and mouse to the Pi 4 Model B’s USB ports, and wait for it to boot to the loading screen. *(Note this is possible without a Monitor using ssh)*
2. Once at the Kali loading screen, enter the default login and password, *kali* and *kali* , to log in.
3. Connect to network and then open a terminal window and run the following command. Keep in mind that it can take up to an hour to upgrade on a slow connection. `sudo apt update && apt upgrade`


Follow the [article](https://mr-intern.medium.com/2021-guide-to-making-your-raspberry-pi-4-a-headless-ethical-hacking-computer-eeca9d24317a) to setup a headless Raspberry Pi
