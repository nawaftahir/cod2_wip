"""Read-only diagnostic of retail CoD2Radiant floating-point constants."""
import pefile
import struct

retail = pefile.PE("binaries/CoD2Radiant.exe", fast_load=True)
base = retail.OPTIONAL_HEADER.ImageBase
for va in (0x00556a58, 0x00556a60, 0x00556a7c, 0x00556ac0):
    raw = retail.get_data(va-base, 8)
    print("RETAIL", hex(va), raw.hex(), "f32=", struct.unpack("<f",raw[:4])[0],
          "f64=", struct.unpack("<d",raw)[0], flush=True)
