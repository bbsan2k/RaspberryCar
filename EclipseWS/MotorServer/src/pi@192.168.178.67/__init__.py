import web
import DriveHandler

urls = ("/", "hello",
        "/drive", "drive")
app = web.application(urls, globals())
handler = DriveHandler.driveHandler()

class hello:
    def GET(self, name):
        if name:
            return 'Hello, ' + name
        
        return 'Hello, world!'


class drive:
    def GET(self):
        print("test")
        input = web.input()
        if not input:
            return "Keine Parameter eingegeben!"
        handler.drive(input.direction, input.speed)
        return input.dir



if __name__ == "__main__":    
    app.run()

    

