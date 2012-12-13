'''
Created on 19.11.2012

@author: bbsan
'''
import DriveHandler
import time

if __name__ == '__main__':
    handler = DriveHandler.driveHandler()
    print("fwd")
    handler.drive("fwd", 1)
    time.sleep(2)
    print("ffd")
    handler.drive("fwd", 2)
    time.sleep(2)
    print("left")
    handler.drive("left", 1)
    time.sleep(2)
    print("right")
    handler.drive("right", 1)
    time.sleep(2)
    print("stop")
    handler.drive("stop", 0)
    
    
    
