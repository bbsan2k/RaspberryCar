'''
Created on 08.01.2013

@author: bbsan
'''
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
    
class rpcServer():
    def run(self):
        rpcSrv = Server(('localhost',8085))
        rpcSrv.register_function(drive)
        rpcSrv.register_function(setVelocity)
        print("RPC up and running")
        rpcSrv.serve_forever()
        

if __name__ == "__main__":
    rpcServer().run()
