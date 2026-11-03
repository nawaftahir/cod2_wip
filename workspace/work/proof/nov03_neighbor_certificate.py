"""Independently certify surrounding code using previously accepted anchors."""
from pathlib import Path
import bisect
import hashlib
import json
import sys
import capstone
import pefile

gfx = next(p for p in Path(__file__).resolve().parents if p.name == 'gfx')
sys.path.insert(0, str(gfx / 'tools'))
import pdbsyms

work = gfx / 'target/work'
build = work / 'build'
original = gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(original.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
own, retail = pefile.PE(str(build / 'gfx.dll')), pefile.PE(str(original))
raw = json.loads((build / 'cmp.json').read_text())
rows = {r['name']: r for r in raw}
seed = work / 'proof/nov03_callee_old_referee_replay.json'
assert hashlib.sha256(seed.read_bytes()).hexdigest() == '8a82f36ad81318ce6e142503110ba61342af13b43c84f32ccd4d0546cd87e3f0'
old = json.loads(seed.read_text())
addresses = {n: a for a, n, obj, function in pdbsyms.map_symbols(
    str(build / 'gfx.map'), str(build / 'gfx.dll'), str(build / 'gfx.pdb')) if function}
known = {addresses[n]: int(r['t'], 16) for n, r in old.items() if not r['why'] and n in addresses}
anchors = {addresses[n]: (n, r) for n, r in old.items()
           if not r['why'] and n in addresses and r['n'] >= 32}
ordered = sorted(anchors)
relocations = lambda pe: {pe.OPTIONAL_HEADER.ImageBase + e.rva
                         for block in pe.DIRECTORY_ENTRY_BASERELOC for e in block.entries if e.type == 3}
orel, trel = relocations(own), relocations(retail)
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
pins = []
for name, row in rows.items():
    if not name.startswith('?') or '@std@@' in name or ':' in row['obj']:
        continue
    if len(row['hits']) < 2 or name not in addresses or name in old and not old[name]['why']:
        continue
    address = addresses[name]
    index = bisect.bisect_left(ordered, address)
    if index == 0 or index == len(ordered):
        continue
    left, right = ordered[index-1:index+1]
    target = known[left]
    delta = target-left
    end = right + anchors[right][1]['n']
    if known[right]-right != delta or address+row['size'] > right:
        continue
    members = {n: r for n, r in rows.items() if n in addresses and left <= addresses[n] < end}
    if any(n not in members for n, a in addresses.items() if left <= a < end):
        continue
    if any(hex(addresses[n]+delta) not in r['hits'] for n, r in members.items()):
        continue
    sites = {a-left for a in orel if left <= a < end}
    if sites != {a-target for a in trel if target <= a < end+delta}:
        continue
    source = bytearray(own.get_data(left-own.OPTIONAL_HEADER.ImageBase, end-left))
    other = bytearray(retail.get_data(target-retail.OPTIONAL_HEADER.ImageBase, end-left))
    if len(source) != end-left or len(other) != len(source):
        continue
    mask = {k+j for k in sites for j in range(4)}
    valid = True
    for instruction in decoder.disasm(bytes(source), left):
        offset = instruction.address-left
        relative = (instruction.size == 5 and instruction.bytes[0] in (0xe8, 0xe9)
                    or instruction.size == 6 and instruction.bytes[0] == 0x0f
                    and 0x80 <= instruction.bytes[1] <= 0x8f)
        if not relative or any(offset+j in mask for j in range(instruction.size)):
            continue
        operand = offset+instruction.size-4
        destination = instruction.address+instruction.size+int.from_bytes(source[operand:operand+4], 'little', signed=True)
        if left <= destination < end:
            continue
        actual = target+operand+4+int.from_bytes(other[operand:operand+4], 'little', signed=True)
        if known.get(destination) != actual:
            valid = False
            break
        mask.update(range(operand, operand+4))
    if not valid or any(source[k] != other[k] for k in range(len(source)) if k not in mask):
        continue
    pins.append(dict(name=name, target=hex(address+delta), source=hex(address),
                     left_anchor=anchors[left][0], right_anchor=anchors[right][0],
                     source_start=hex(left), target_start=hex(target), span=end-left,
                     source_sha256=hashlib.sha256(source).hexdigest(),
                     target_sha256=hashlib.sha256(other).hexdigest(), masked_offsets=sorted(mask)))
    row['hits'] = [hex(address+delta)]
assert len(pins) >= 2, 'No complete buffer neighborhood was certified'
(work / 'proof/nov03_neighbor_pins.json').write_text(json.dumps(pins, indent=2)+'\n')
(work / 'proof/nov03_neighbor_candidates.json').write_text(json.dumps(raw, indent=2)+'\n')
print('Independently certified:', [(p['name'], p['target']) for p in pins])
