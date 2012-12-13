'''
Created on 07.11.2012

@author: bbsan
'''

import serial
import time


class driveHandler:
    
    
    def __init__(self):
        global ser
        ser = serial.Serial('/dev/ttyAMA0',9600)
        ##ser = serial.Serial('/dev/tty.usbmodem411',9600)
        time.sleep(2)

    def drive(self, direction):
        if (direction == "stop"):
            ser.write("00")
        elif (direction == "fwd"):
            ser.write("11")
        elif (direction == "right"):
            ser.write("21")
        elif (direction == "left"):
            ser.write("12")
        
    def __del__(self):
        ser.close()

    