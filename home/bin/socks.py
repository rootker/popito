import socket
import socks
import os
import requests

s = socks.socksocket()
host = "31.210.52.150"
proxy_port = 46202
port = 46202
socks.setdefaultproxy(socks.PROXY_TYPE_SOCKS5, host, port)
# s.set_proxy(socks.SOCKS5, "31.210.52.150", proxy_port)
# s.connect((host, port))
socket.socket = socks.socksocket
url = u"http://icanhazip.com"
print(requests.get(url).text)
