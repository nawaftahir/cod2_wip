"""Audit deflate's full code inventory, table dispatch and referenced storage."""
import re
import struct
import sys
from pathlib import Path
sys.path.insert(0, 'tools')
import verify as v
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

source = 'src/zlib/deflate.c'
image = v.Linked()
retail = v.pefile.PE(str(v.link.RETAIL), fast_load=True)
names = v.known_names()
md = Cs(CS_ARCH_X86, CS_MODE_32); md.detail = True
expected = (
    (0x4ad1a0, 25, '_deflateInit_'), (0x4ad1c0, 487, '_deflateInit2_'),
    (0x4ad3b0, 238, '_deflateSetDictionary'), (0x4ad4a0, 104, '_deflateReset'),
    (0x4ad510, 625, '_deflateParams'), (0x4ad790, 39, '_putShortMSB'),
    (0x4ad7c0, 100, '_flush_pending'), (0x4ad830, 654, '_deflate'),
    (0x4adac0, 178, '_deflateEnd'), (0x4adb80, 425, '_deflateCopy'),
    (0x4add30, 109, '_read_buf'), (0x4adda0, 135, '_lm_init'),
    (0x4ade30, 359, '_longest_match'), (0x4adfa0, 279, '_fill_window'),
    (0x4ae0c0, 433, '_deflate_stored'), (0x4ae280, 758, '_deflate_fast'),
    (0x4ae580, 990, '_deflate_slow'),
)
rows = [r for r in v.read_tsv('ledger/matches.tsv') if r['source'] == source]
assert {(int(r['addr'],16),int(r['size']),r['symbol']) for r in rows} == set(expected)
assert {(int(r['addr'],16),int(r['size'])) for r in v.read_tsv('data/tu_map.tsv') if r['tu']==source} == {(a,z) for a,z,_ in expected}
assert set(image.of_source(source)) == {s for _,_,s in expected}, 'unaccounted emitted helper/initializer'
assert not any(r['source']==source for r in v.read_tsv('ledger/compiler.tsv'))
assert [image.syms[s] for _,_,s in expected] == sorted(image.syms[s] for _,_,s in expected)

def data_symbol(symbol):
    found = re.findall(r'^\s*000[23]:[0-9a-f]+\s+'+re.escape(symbol)+r'\s+([0-9a-f]+)\s',v.link.MAP.read_text(),re.M)
    assert len(found)==1, (symbol,found)
    return int(found[0],16)

def read(pe, address, size):
    data = pe.get_data(address-pe.OPTIONAL_HEADER.ImageBase,size)
    assert len(data)==size, (hex(address),size)
    return data

def string(pe, address):
    data = pe.get_data(address-pe.OPTIONAL_HEADER.ImageBase,256)
    assert b'\0' in data
    return data.split(b'\0',1)[0]

config_base = 0x53ddd0
errors = 0x598380
version = 0x5971f0
bindings = {}
calls = callback_refs = data_refs = padding = 0
end = 0x4ad1a0
for address,size,symbol in expected:
    gap = read(retail,end,address-end)
    assert all(b in (0xcc,0x90) for b in gap)
    padding += len(gap); end = address+size
    assert v.check(image,hex(address),symbol,names)[0]=='MATCH',symbol
    target,_ = v.matcher.carve(hex(address)); start,actual = image.code(symbol)
    left = list(md.disasm(target,address)); right = list(md.disasm(actual,start))
    assert len(left)==len(right)
    for a,b in zip(left,right):
        assert (a.address-address,a.size,a.mnemonic)==(b.address-start,b.size,b.mnemonic)
        for x,y in zip(a.operands,b.operands):
            assert x.type==y.type
            if x.type==X86_OP_IMM:
                p,q = x.imm,y.imm
                if a.mnemonic.startswith('j') or a.mnemonic=='call':
                    if address<=p<address+size: assert q-start==p-address
                    else:
                        assert p in names and names[p] in image.labels[q], (symbol,hex(p),hex(q))
                        calls += 1
                    continue
                if p in (0x4b3ca0,0x4b3ce0):
                    wanted = '_zcalloc' if p==0x4b3ca0 else '_zcfree'
                    assert wanted in image.labels[q]
                    callback_refs += 1
                    continue
            elif x.type==X86_OP_MEM:
                p,q = x.mem.disp,y.mem.disp
            else: continue
            if not 0x400000<=p<0x1400000: continue
            if config_base<=p<config_base+120:
                key,pointer = config_base,q-(p-config_base)
            elif errors<=p<errors+40:
                key,pointer = errors,q-(p-errors)
                assert pointer==data_symbol('_z_errmsg')
            elif 0x53e700<=p<0x53e900:
                key,pointer = 0x53e700,q-(p-0x53e700)
                assert pointer==data_symbol('__dist_code')
            elif 0x53e900<=p<0x53ea00:
                key,pointer = 0x53e900,q-(p-0x53e900)
                assert pointer==data_symbol('__length_code')
            else:
                assert p==version, ('unaccounted address',symbol,hex(p))
                key,pointer = version,q
            assert bindings.setdefault(key,pointer)==pointer
            data_refs += 1
last = read(retail,end,0x4ae960-end)
assert all(b in (0xcc,0x90) for b in last)
padding += len(last)
assert padding==142
assert set(bindings)=={config_base,errors,version,0x53e700,0x53e900}

configs = ((0,0,0,0),(4,4,8,4),(4,5,16,8),(4,6,32,32),(4,4,16,16),
           (8,16,32,32),(8,16,128,128),(8,32,128,256),(32,128,258,1024),(32,258,258,4096))
for index,values in enumerate(configs):
    target = struct.unpack('<4HI',read(retail,config_base+12*index,12))
    actual = struct.unpack('<4HI',read(image.pe,bindings[config_base]+12*index,12))
    address = 0x4ae0c0 if index==0 else 0x4ae280 if index<4 else 0x4ae580
    assert target==(*values,address)
    assert actual==(*values,image.syms[names[address]])
for address,size in ((0x53e700,512),(0x53e900,256)):
    assert read(retail,address,size)==read(image.pe,bindings[address],size)
messages = (b'need dictionary',b'stream end',b'',b'file error',b'stream error',b'data error',b'insufficient memory',b'buffer error',b'incompatible version',b'')
for index,text in enumerate(messages):
    a = struct.unpack('<I',read(retail,errors+4*index,4))[0]
    b = struct.unpack('<I',read(image.pe,bindings[errors]+4*index,4))[0]
    assert string(retail,a)==string(image.pe,b)==text
for pe,address in ((retail,version),(image.pe,bindings[version])):
    assert string(pe,struct.unpack('<I',read(pe,address,4))[0])==b'1.1.4'
    assert pe.get_section_by_rva(address-pe.OPTIONAL_HEADER.ImageBase).Characteristics & 0x80000000
copyright = b' deflate 1.1.4 Copyright 1995-2002 Jean-loup Gailly \0'
assert retail.__data__.find(copyright)>=0
assert read(image.pe,data_symbol('_deflate_copyright'),len(copyright))==copyright
assert callback_refs==2 and calls>30
print('PASS: deflate 17/17 routines / 5938 B; 142 B original padding; no extra emitted helpers/EH/initializers')
print('PASS: 120 B configuration table / ten bound callbacks; 512+256 B code tables; ten error strings; version/copyright')
print('PASS:',calls,'direct callee references;',callback_refs,'allocator callbacks;',data_refs,'absolute data references; image placement PENDING')
