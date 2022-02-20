# 🥧 PiFi - A Raspberry Pi wifi hacker 📡 

Whenever the Raspberry Pi Device is turned on, it attempts to attack all the wifi networks within the area using [wifite](https://github.com/kimocoder/wifite2) and then 📧 emails the succesful results to an email address of your choosing by running the `script.sh` script.


https://user-images.githubusercontent.com/69246015/154826402-699d605c-c78b-43df-abe6-2496f34fe309.mp4


## 📝Prerequisites📝

* Any [Raspberry Pi](https://www.raspberrypi.com/products/) Zero/Zero W, Zero 2/ Zero 2 W, 1, 2, 3, 4 or 400
* Bootable USB or microSD with the latest 🐧 [Kali Linux image](https://www.kali.org/get-kali/#kali-arm) (32-bit recommended). At least 16GB capacity. Class 10 cards are highly recommended.
* all Raspberry Pi models from the Raspberry Pi 3 Model B (2016) and later ship with on-board WiFi. If you have an older model on hand, or if your on-board WiFi module is not functioning, you will need to use an **external USB WiFi adapter**.

## ✔️Steps for Setup✔️

### Creating a bootable USB or microSD

1. Download the [Kali Linux image](https://www.kali.org/get-kali/#kali-arm)
2. Flash the image onto the USB or microSD card using [balenaEtcher](https://www.balena.io/etcher/) or any other preffered method of flashing.
   ***Note! This will format the drive so make sure to backup any needed data on the drive.***

### Startup the Pi

1. With the newly flashed microSD card or USB drive in the Raspberry Pi, plug it into power, and plug the Micro-HDMI cable into a monitor. Plug in a keyboard and mouse to the Pi 4 Model B’s USB ports, and wait for it to boot to the loading screen. *(Note this is possible without a Monitor using ssh)*
2. Once at the Kali loading screen, enter the default login and password, *kali* and *kali* , to log in.
3. Connect to network and then open a terminal window and run the following command. Keep in mind that it can take up to an hour to upgrade on a slow connection. `sudo apt update && apt upgrade`

### **Optional** Change Root Password and Optional SSH Setup

1. Switch to root user `sudo su root`
2. Change the password with: `passwd root`
3. Setup SSH with starting the service on boot by going into the root directory and running the following commandss

   ```bash
   cd ~/../..
   cd /etc/ssh/
   dpkg-reconfigure openssh-server
   update-rc.d -f ssh remove
   update-rc.d -f ssh defaults
   nano /etc/ssh/sshd_config
   ```

   > In the nano window that opens, make sure that “PermitRootLogin” is
   > un-tabbed to allow root login. After this is done, you can hit *Control-x* to exit the nano window after applying the changes. Enable the updates with:
   >

   ```bash
   sudo service ssh restart
   update-rc.d -f ssh enable 2 3 4 5
   ```

### Autologin to Root When Booting

1. Open the configuaration file `nano /etc/lightdm/lightdm.conf`
2. Under `[Seat:*]` uncomment and set the variables to these values
   ```bash
   autologin-user=root
   autologin-user-timeout=0
   ```

### Making the PI headless

1. Some Pi's will not boot if there is nothing plugged into the HDMI port so we will uncomment a line to circumvent this issue `nano /boot/config.txt`. Yet again use ctrl+x to exit and save
   ```bash
   hdmi_force_hotplug=1
   ```

### Installing Dependencies for the Attack

1. clone this repo and then run the `dependency.sh` script
   ```bash
   git clone https://github.com/Hariss-Gills/pifi
   cd pifi
   bash dependency.sh
   ```

### Run Attack on Startup

1. edit the `bash.bashrc` by:
   ```bash
   nano /etc/bash.bashrc
   ```
2. Add these lines at the end of the file, Yet again use ctrl+x to exit and save:
   ```bash
   echo Running at boot 
   bash /root/pifi/script.sh
   ```

## ⚠️Going through an Attack⚠️

### Right before

1. Go to [TempMail](https://temp-mail.org/en/) and generate a temporary email address - you'll recieve the passwords/handshakes on this address
2. replace the `username@email.com` with the generated address. This can be done remotely with `ssh` or using `sed` before commiting an attack with: `sed -i 's/username@email.com/generated@email.com/g' script.sh`

### During
1. Just plug in the Pi and wait until you get the email

### After
1. Escape the scene

## 📖Sources📖
* [article](https://mr-intern.medium.com/2021-guide-to-making-your-raspberry-pi-4-a-headless-ethical-hacking-computer-eeca9d24317a) to setup a headless Raspberry Pi
* [article](https://null-byte.wonderhowto.com/forum/to-spoof-e-mail-using-sendemail-and-postfix-0355693/) to setup Postfix
