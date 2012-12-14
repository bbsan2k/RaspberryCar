

install:
				wget http://webpy.org/static/web.py-0.37.tar.gz
				tar -xvzf web.py-0.37.tar.gz
				cd web.py-0.37; sudo python setup.py install
				wget http://pypi.python.org/packages/source/p/pyserial/pyserial-2.6.tar.gz
				tar -xvzf pyserial-2.6.tar.gz
				cd pyserial-2.6; sudo python setup.py install
				sudo rm -rf web.py*
				sudo rm -rf pyserial*
				ln -s ./ /Server/
				ln -s ./RaspCar /etc/init.d/RaspCar
				chmod +x /etc/init.d/RaspCar
				update-rc.d /etc/init.d/RaspCar

run:
				sudo python index.py
