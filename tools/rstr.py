from renderer_paths import retail_anchor
# rstr.py <va-hex>...: print the NUL-terminated retail string at each VA
import sys, pefile
pe = pefile.PE(str(retail_anchor()), fast_load=True)
b = pe.OPTIONAL_HEADER.ImageBase
for a in sys.argv[1:]:
    d = pe.get_data(int(a, 16) - b, 256)
    print(a, repr(d[:d.index(b'\0')].decode('latin1')))
