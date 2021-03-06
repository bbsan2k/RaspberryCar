import web
import threading
from web import form
import DriveHandler
##from SimpleXMLRPCServer import SimpleXMLRPCServer as Server
from jsonrpclib.SimpleJSONRPCServer import SimpleJSONRPCServer as Server
from daemon import Daemon


## Drivehandler

##handler = DriveHandler.driveHandler()
maxVelocity = 255

def drive(direction):
    ##success = handler.drive(direction)
    if (success): return "Success"
    else: return "FAILED"

def setVelocity(velo):
    maxVelocity = int(velo)
    ##success = handler.setVelocity(maxVelocity)
    if (success): return "Success"
    else: return "FAILED"
    
## Web.py Part

render = web.template.render('/Server/templates/')

driveForm = form.Form(
              form.Button(type="submit", name = "button", html="Forward", value="fwd"),
              form.Button(type="submit", name = "button", html="Right", value="right"),
              form.Button(type="submit", name = "button", html="Left", value="left"),
              form.Button(type="submit", name = "button", html ="Backward", value="bwd"),
              form.Button(type="submit", name = "button", html ="Stop", value="stop")        )

class webServer(threading.Thread):  
    def run(self):
        urls = ('/', 'webServer')
        app = web.application(urls, globals())
        app.run()
        
    def GET(self):
        form = driveForm()
        return render.formtest(driveForm)
    def POST(self):
        i = web.input()
        drive(i.button)
        return render.formtest(driveForm)
 
## RPC Server Part

class rpcServer(threading.Thread):
    def run(self):
        rpcSrv = Server(('',8085))
        rpcSrv.register_function(drive)
        rpcSrv.register_function(setVelocity)
        print("RPC up and running")
        rpcSrv.serve_forever()

def run(self):
    webServer().start()
    rpcServer().start()


class serverDaemon(Daemon):
    def run(self):
        webServer().start()
        rpcServer().start()

if __name__ == "__main__":
    server = serverDaemon('/tmp/raspiPID')
    server.start()

## Daemon from https://github.com/gkmngrgn/python-daemon




