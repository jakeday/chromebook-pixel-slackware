**Slackware64 on the Chromebook Pixel 2015**

*Prerequisites*
USB drive (at least 4 GB)

*Prep Work*
Download the latest slackware64-current iso from http://taper.alienbase.nl/mirrors/slackware/slackware64-current-iso/

Flash the iso to your usb drive (assuming it's sdb, you may need to change it)

# dd if=slackware64-current-install-dvd.iso of=/dev/sdb

*Dev Mode on Pixel*
To install slackware, you'll need to put your Pixel in dev mode. To do so, follow these steps:

1. Power off
2. Enter recovery by holding Esc and Refresh while hitting the Power button
3. Now press CTRL+D and Enter
4. Follow the steps on the screen (this will wipe your Pixel and go into dev mode)
5. Boot into ChromeOS by pressing CTRL+D
6. When booted, press CTRL+ALT+T to open a terminal and enter the following commands
$ shell
$ sudo bash
$ crossystem dev_boot_usb=1 dev_boot_legacy=1
7. Power off

*Install Slackware*
Now we're going to install slackware. To do so, follow these steps:

1. Plug in your USB drive that you flashed the slackware iso to and power on the Pixel
2. Instead of pressing CTRL+D, this time we will press CTRL+L and then Esc
3. Choose 1 to boot from the USB drive
4. At the slackware boot prompt, enter kms.s (this will allow the framebuffer to work properly)
5. Press enter to boot, and then follow the normal slackware install instructions.

// you should be instaling slackware now like normal

6. When completed, remove the USB drive
7. Reboot
8. Press CTRL+L again during boot
9. If you have an sd card inserted, press Esc and choose item 2
10. You're now booted into Slackware64!

*Compiling Slackware Kernel*
For everything to work correctly, we need to compile the 4.1 series kernel. I used 4.1.5 and will use that in this guide.

Now that you are booted into slackware, we need to pull down the latest kernel. Now run these commands:

# cd /usr/src/
# wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.1.5.tar.xz
# tar -xf linux-4.1.5.tar.xz
# rm linux
# ln -s linux-4.1.5 linux

Now copy the config-samus-4.1.5 file from the kernel directory of my repo to /usr/src/linux/.config

Back to running commands in the same terminal as a minute ago (it will take awhile while running the make commands):

# cd linux
# make bzImage
# make modules
# make modules_install
# cp System.map /boot/System.map-samus-4.1.5
# cp .config /boot/config-samus-4.1.5
# cp arch/x86_64/boot/bzImage /boot/vmlinuz-samus-4.1.5
# rm /boot/System.map
# rm /boot/config
# rm /boot/vmlinuz
# ln -s /boot/System.map-samus-4.1.5 /boot/System.map
# ln -s /boot/config-samus-4.1.5 /boot/config
# ln -s /boot/vmlinuz-samus-4.1.5 /boot/vmlinuz
# lilo

Now follow these steps:

1. Reboot
2. Press CTRL+L again during boot
3. If you have an sd card inserted, press Esc and choose item 2
4. You're now running the the 4.1.5 kernel with working drivers!

You should notice that the touchpad and touchscreen both work now when you go into X.
