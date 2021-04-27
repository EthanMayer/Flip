'''
	Simple socket server using threads
'''

# import socket
#
# HOST = '192.168.1.158'	# Symbolic name, meaning all available interfaces
# PORT = 8000	# Arbitrary non-privileged port

# with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
# 	print ('Socket created')
# 	s.bind((HOST, PORT))
# 	print ('Socket bind complete on', HOST, PORT)
# 	s.listen()
# 	print ('Socket now listening')
# 	conn, addr = s.accept()
# 	with conn:
# 		print('Connected by', addr)
# 		while True:
# 			print("Waiting for data")
# 			data = conn.recv(1024)
# 			print('Data received: ', data)
# 			if not data:
# 				break
#				conn.sendall(data)
#	s.close()

import websockets
import asyncio

data = 0

async def server(websocket, path):
    global data
    print("Server1 awaiting connection")
    data = await websocket.recv()
    print('Data received: ', data)

async def server2(websocket, path):
    global data
    print("Server2 awaiting connection")
    await websocket.send(str(data))
    print("Message sent: ", data)

start_server = websockets.serve(server, '192.168.1.158', 8000)
start_server2 = websockets.serve(server2, '192.168.1.158', 9000)
asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_until_complete(start_server2)
asyncio.get_event_loop().run_forever()
