#!/usr/bin/env python3
"""Fast indexed exact-shape sweep against authentic MSVC COFF archives."""
import argparse, json, os, struct, sys
from collections import defaultdict

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_cod2radiant as matcher


def archive_members(path):
    data = open(path, "rb").read()
    if not data.startswith(b"!<arch>\n"):
        return []
    off = 8; longnames = None; result = []
    while off + 60 <= len(data):
        header = data[off:off+60]
        try:
            size = int(header[48:58])
        except Exception:
            break
        raw = header[:16]; member = data[off+60:off+60+size]
        if raw.startswith(b"/"):
            suffix = raw[1:].strip()
            if suffix == b"": name = "/"
            elif suffix.isdigit():
                start = int(suffix); end = longnames.find(b"\0", start)
                name = longnames[start:end].decode(errors="replace") if longnames is not None else "/" + suffix.decode()
            else:
                name = suffix.decode(errors="replace")
        else:
            name = raw.split(b"/")[0].decode(errors="replace").rstrip()
        if name == "/": longnames = member
        elif name != "//": result.append((name, off, member))
        off += 60 + size + (size & 1)
    return result


def coff_functions(data):
    machine, section_count, _, sym_ptr, sym_count, opt_size, _ = struct.unpack_from("<HHIIIHH", data, 0)
    if machine != 0x14C: return
    sections = []
    base = 20 + opt_size
    for index in range(section_count):
        rec = data[base+index*40:base+(index+1)*40]
        _, _, raw_size, raw_ptr = struct.unpack_from("<IIII", rec, 8)
        reloc_ptr, _, reloc_count = struct.unpack_from("<IIH", rec, 24)
        flags = struct.unpack_from("<I", rec, 36)[0]
        # COMDAT .text sections use 0x60500020 / similar; test executability directly.
        executable = bool(flags & 0x00000020) and not bool(flags & 0x10000000)
        if raw_size and flags & 0x00000020:
            relocs = []
            for j in range(reloc_count):
                pos, _, typ = struct.unpack_from("<IIH", data, reloc_ptr+j*10)
                relocs.append((pos, typ))
            sections.append((index+1, raw_size, raw_ptr, relocs))
    str_base = sym_ptr + sym_count * 18
    str_size = struct.unpack_from("<I", data, str_base)[0]
    strings = data[str_base:str_base+str_size]
    symbols=[]; raw=0
    while raw < sym_count:
        rec=data[sym_ptr+raw*18:sym_ptr+(raw+1)*18]
        first,second=struct.unpack_from("<II",rec)
        if first==0 and second:
            st=str_base+second; en=data.index(b"\0",st); name=data[st:en].decode(errors="replace")
        else: name=rec[:8].rstrip(b"\0").decode(errors="replace")
        value,secnum,_,cls,aux=struct.unpack_from("<IhHBB",rec,8)
        symbols.append((name,value,secnum,cls,aux)); raw += 1+aux
    for secnum,sec_size,sec_ptr,relocs in sections:
        defined=[]
        for idx,(name,value,symbol_sec,cls,aux) in enumerate(symbols):
            if symbol_sec==secnum and cls==2: defined.append((value,name,idx,aux))
        defined.sort()
        for pos,(value,name,idx,aux) in enumerate(defined):
            end=defined[pos+1][0] if pos+1<len(defined) else sec_size
            size=end-value
            if not (2<=size<=8192): continue
            begin=sec_ptr+value; payload=bytearray(data[begin:begin+size]); mask=set()
            for relpos,typ in relocs:
                rel=relpos-value
                if 0<=rel<size and typ in (6,20,22,4): mask.update(range(rel,min(rel+4,size)))
            yield name,size,matcher.normalize(payload,mask)


def load_shapes(paths):
    shapes={}; total=0
    for path in paths:
        lib=os.path.basename(path)
        for member_index,(name,offset,data) in enumerate(archive_members(path)):
            for symbol,size,normalized in coff_functions(data):
                total+=1
                key=(size,normalized)
                shapes.setdefault(key,{"symbol":symbol,"lib":lib,"offset":offset})
        print(lib,"done",flush=True)
    return shapes,total


def main():
    ap=argparse.ArgumentParser(); ap.add_argument("--output",required=True); ap.add_argument("--manifest",default=os.path.join(BASE,"data","sweep_512.json")); args=ap.parse_args()
    root="/home/nawaf/cod2/test/dev/gemini/msvc710"
    libs=[]
    for base, dirs, files in os.walk(root):
        for file in files:
            if file.lower().endswith(".lib") and file.lower() not in ("mfc71.lib","mfc71u.lib","mfc71d.lib","mfc71ud.lib"):
                libs.append(os.path.join(base, file))
    print("loading libraries",flush=True); shapes,total=load_shapes([p for p in libs if os.path.exists(p)])
    print("library functions",total,"unique shapes",len(shapes),flush=True)
    rows=json.load(open(args.manifest)); have={r["address"] for r in rows}; added=[]
    for address,meta in sorted(matcher.FUNCTIONS.items()):
        if meta["thunk"] or address in have: continue
        target,_=matcher.carve(address); va=int(address,16)
        normalized=matcher.normalize(target,matcher.absolute_masks(target,matcher.pe_relocations(va,len(target),target)))
        entry=shapes.get((len(target),normalized))
        if entry: added.append({"address":address,"name":meta["name"],"size":len(target),"object_symbol":entry["symbol"],"object":f"{entry['lib']}@{entry['offset']}"})
    rows.extend(added); rows.sort(key=lambda r:int(r["address"],16)); json.dump(rows,open(args.manifest,"w"),indent=2)
    bytes_total=sum(r["size"] for r in rows)
    print(json.dumps({"added":len(added),"matches":len(rows),"bytes":bytes_total,"percent":bytes_total/0x12620e*100},indent=2))

if __name__=="__main__": main()
