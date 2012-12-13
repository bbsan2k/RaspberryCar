import web
import threading
from web import form
import DriveHandler
from SimpleXMLRPCServer import SimpleXMLRPCServer as Server

## Drivehandler

handler = DriveHandler.driveHandler()

def drive(direction):
    handler.drive(direction)


    
## Web.py Part

render = web.template.render('templates/')

driveForm = form.Form(
              form.Button(type="submit", name = "button", html="Forward", value="fwd"),
              form.Button(type="submit", name = "button", html="Right", value="right"),
              form.Button(type="submit", name = "button", html="Left", value="left"),
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
##        if (i.button == "fwd"):
##            drive("fwd")
##        elif (i.button == "right"):
##            drive("right")
##        elif (i.button == "left"):
##            drive("left")
##        elif (i.button == "stop"):
##            drive("stop")
        
## RPC Server Part

class rpcServer(threading.Thread):
    def run(self):
        rpcSrv = Server(("",81))
        rpcSrv.register_function(drive)
        print("RPC up and running")
        rpcSrv.serve_forever()

def run(self):
    webServer().start()
    rpcServer().start()

if __name__ == "__main__":
        webServer().start()
        rpcServer().start()




