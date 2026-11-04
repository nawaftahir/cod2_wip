#!/usr/bin/env python3
"""Extract COFF archive members and sweep authentic .lib objects against Radiant."""
import argparse, glob, json, os, struct, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_cod2radiant as matcher


def archive_members(path):
    data=open(path,'rb').read()
    if not data.startswith(b'!<arch>\n'):
        return []
    off=8; members=[]; longnames=b""
    while off+60<=len(data):
        header=data[off:off+60]
        try: size=int(header[48:58].decode().strip())
        except Exception: break
        member=data[off+60:off+60+size]
        raw_name=header[:16]
        if raw_name.startswith(b"/"):
            suffix=raw_name[1:].strip()
            if suffix.isdigit() and longnames:
                start=int(suffix); end=longnames.find(b"\n",start)
                name=longnames[start:end].decode(errors="replace")
            else:
                name="/"+suffix.decode(errors="replace")
        else:
            name=raw_name.split(b"/")[0].decode(errors="replace")
        if not name.startswith('/'):
            members.append((name,path,off+60,member))
        if name=="//":
            longnames=member
        off += 60 + size + (size & 1)
    return members


def object_entries(paths):
    entries=[]; seen=set()
    for path in paths:
        for symbol_name, source, offset, data in archive_members(path):
            try:
                sections,symbols=matcher.parse_coff(data)
            except Exception:
                continue
            for symbol in symbols:
                if symbol['section']<=0 or symbol['class'] not in (2,3): continue
                name=symbol['name']
                if not name or name.startswith('.') or name.startswith('$$'): continue
                try: payload,mask,resolved=matcher.object_function(data,name)
                except Exception: continue
                if not (2<=len(payload)<=4096): continue
                normalized=matcher.normalize(payload,mask)
                key=(len(normalized),normalized)
                if key in seen: continue
                seen.add(key)
                entries.append({'symbol':name,'member':source,'offset':offset,
                                'size':len(payload),'bytes':normalized})
    return entries


def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--libs',nargs='+',required=True); ap.add_argument('--output',required=True); ap.add_argument('--max-bytes',type=int,default=512); args=ap.parse_args()
    inventory=matcher.FUNCTIONS; targets=[]
    for address,meta in sorted(inventory.items()):
        if meta['thunk'] or not (2<=int(meta['size'])<=args.max_bytes): continue
        target,_=matcher.carve(address); va=int(address,16)
        mask=matcher.absolute_masks(target,matcher.pe_relocations(va,len(target),target))
        targets.append((address,meta['name'],len(target),matcher.normalize(target,mask)))
    print(f'targets={len(targets)}',file=sys.stderr)
    entries=object_entries(args.libs)
    print(f'object_functions={len(entries)}',file=sys.stderr)
    matches=[]
    for address,name,size,target in targets:
        candidates=[e for e in entries if e['size']==size]
        for entry in candidates:
            if entry['bytes']==target:
                matches.append({'address':address,'name':name,'size':size,
                                'object_symbol':entry['symbol'],'object':f"{os.path.basename(entry['member'])}@{entry['offset']}"})
                break
    json.dump(matches,open(args.output,'w'),indent=2)
    total=sum(x['size'] for x in matches)
    print(json.dumps({'matches':len(matches),'bytes':total,'percent':total/0x12620e*100},indent=2))

if __name__=='__main__': main()
