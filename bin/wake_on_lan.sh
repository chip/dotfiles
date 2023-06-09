#!/usr/bin/env python
import socket
s=socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
# mac address for chip's imac: 7C:C3:A1:A4:34:89
s.sendto('\xff'*6+'\x7c\xc3\xa1\xa4\x34\x89'*16, ('192.168.1.255', 8080))
