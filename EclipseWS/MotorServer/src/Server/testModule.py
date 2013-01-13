'''
Created on 08.01.2013

@author: bbsan
'''
##import Drivehandler
##import threading
from jsonrpclib.SimpleJSONRPCServer import SimpleJSONRPCServer as Server

def drive(direction):
    print(direction)
    return "SUCCESS"
    
def setVelocity(velo):
        if (int(velo) < 10):
            print("vel00"+str(velo))
        elif (int(velo) < 100):
            print("vel0"+str(velo))
        elif (int(velo) < 255):
            print("vel"+str(velo))
        elif (int(velo) < 0):
            print("vel000")
        else: 
            print("vel255");
        return "SUCCESS"
    
        
        
        
if __name__ == "__main__":
    rpcSrv = Server(('',8085))
    rpcSrv.register_function(drive)
    ##rpcSrv.register_function(setVelocity)
    print("RPC up and running on port")
    rpcSrv.serve_forever()