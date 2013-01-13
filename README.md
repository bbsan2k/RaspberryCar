Raspberry Pi Arduino Car
------------------------------------------------------------------
RaspCar Project
------------------------------------------------------------------

This is my github for my Bachelor Thesis RaspberryCar Project (short: RaspCar).
As this is my first public github repository, I hope I mentioned all used libs well.
If I used libraries and didn't declare it, please just contact me and I'll mention it in this README.



Warning
--------
The Makefile for the RaspberryPi Server Part is not finished yet, so use it only if you know what you're doing!

Dependencies
--------
For all my tests I used Raspbian Distro.
Dependencies for this project are:
* libv4l-dev
* libjpeg8-dev
* imagemagick
* pySerial
* web.py
* mjpg_streamer

I also used a Wifi-AP, but the project would still work if just logged in to a Wifi Network.

Hardware
----------
I used a supported Wifi Dongle and a Logitech C170 Webcam, but this should work with every libv4l supported Webcam.

I also used an Arduino Uno equipped with a ladyada Motorshield. The Motors are from a cheap ebay Robot Platform and 
are not very strong (I think 9V DC Motors).

To convert the Voltages I used a CD4050 BC Chip.
