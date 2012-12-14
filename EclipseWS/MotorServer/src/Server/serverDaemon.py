#!/usr/bin/env python

'''
Created on 13.12.2012
Source : http://www.jejik.com/articles/2007/02/a_simple_unix_linux_daemon_in_python/
@author: bbsan
'''
from daemon import Daemon
import index

class MyDaemon(Daemon):
        def run(self):
            index().run()
            
 
