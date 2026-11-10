import sys
# dup.py: find copies of AngleVectors' body in retail (masking absolute addresses)
d = open('/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe', 'rb').read()
base = 0x400000
def off(va):
    return va - base  # .text raw == va-base assumed; checked by printing bytes
o = off(0x4279c0)
print(d[o:o+32].hex())
pat = d[o:o+347]
# count windows of 24 bytes from inside the body that recur elsewhere
for start in range(0, 340, 24):
    w = pat[start:start+24]
    n = d.count(w)
    print(hex(0x4279c0+start), n)
