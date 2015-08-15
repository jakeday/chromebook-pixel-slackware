**Slackware64 on the Chromebook Pixel 2015**

*Prerequisites*
USB drive (at least 4 GB)
USB mouse (just until you load the touchpad drivers)

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
7. Plug in the USB mouse and reboot
8. Press CTRL+L again during boot
9. If you have an sd card inserted, press Esc and choose item 2
10. You're now booted into Slackware64!
