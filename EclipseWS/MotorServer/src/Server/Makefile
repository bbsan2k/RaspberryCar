

install:
				sudo apt-get install -y python-setuptools hostapd dnsmasq subversion
				cp hostapd /etc/network/
				cp hostapd.conf /etc/hostapd/
				cp dnsmasq.conf /etc/
				easy_install web.py pySerial jsonrpclib
				ln -s $(CURDIR) /Server
				sudo mv RaspCar /etc/init.d/RaspCar
				chmod +x /etc/init.d/RaspCar
				update-rc.d RaspCar defaults

run:
				service RaspCar start
