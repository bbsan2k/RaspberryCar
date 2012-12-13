'''
Created on 22.11.2012

@author: bbsan
'''
import DriveHandler
import time

if __name__ == '__main__':
    handler = DriveHandler.driveHandler()
    i = 1
    while (i==1):
        handler.drive('right', 1)
        time.sleep(4)
        handler.drive('left',1)
        time.sleep(4)