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
            ser.write("stp")
        elif (direction == "fwd"):
            ser.write("fwd")
        elif (direction == "right"):
            ser.write("rgt")
        elif (direction == "left"):
            ser.write("lft")
        elif (direction == "bwd"):
            ser.write("bwd")
        return True
        
    def setVelocity(self, velo):
        if (int(velo) < 10):
            ser.write("vel00"+str(velo))
        elif (int(velo) < 100):
            ser.write("vel0"+str(velo))
        elif (int(velo) < 255):
            ser.write("vel"+str(velo))
        elif (int(velo) < 0):
            ser.write("vel000")
        else: 
            ser.write("vel255");
        return True
    
    def __del__(self):
        ser.close()

    