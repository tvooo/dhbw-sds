#! /usr/bin/env python
import SocketServer, subprocess, sys

HOST = ''
PORT = 50008

class SingleTCPHandler(SocketServer.BaseRequestHandler):
	def setup(self):
		print '+ ', self.client_address, 'connected'
		self.request.send('hi ' + self.client_address[0] + '\n')

	def handle(self):
		# self.request is the client connection
		data = self.request.recv(1024)  # clip input at 1Kb
		print '>', 'Synthesizing', data.strip()
		p = subprocess.Popen("echo \"%s\" | festival --tts" % data.strip(),stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True)
		self.request.close()

	def finish(self):
		print '- ', self.client_address, 'disconnected'

class SimpleServer(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
	# Ctrl-C will cleanly kill all spawned threads
	daemon_threads = True
	# much faster rebinding
	allow_reuse_address = True

	def __init__(self, server_address, RequestHandlerClass):
		SocketServer.TCPServer.__init__(self, server_address, RequestHandlerClass)

if __name__ == "__main__":
	server = SimpleServer((HOST, PORT), SingleTCPHandler)
	# terminate with Ctrl-C
	try:
		server.serve_forever()
	except KeyboardInterrupt:
		sys.exit(0)
