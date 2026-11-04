#!/usr/bin/env python3
"""Pin renderer export-table destinations from decoded GetRefAPI instructions."""
import json
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_INS_MOV, X86_OP_MEM, X86_OP_IMM
from audit_legacy import ROOT, EXPECTED, load_matcher

BASE, COUNT, ENTRY = 0x1076a880, 108, 0x10013270
CHECKED_LABELS = {
    0x10017300: 'R_GetMaterialName', 0x10017310: 'R_GetMaterialSubimageCount',
    0x10017320: 'R_IsMaterialRefractive', 0x1000c8d0: 'R_GetMinSpecImageMemory',
    0x1001d8f0: 'R_SetIgnorePrecacheErrors', 0x1001d900: 'R_GetIgnorePrecacheErrors',
    0x10001430: 'R_SetSunLightOverride', 0x10001460: 'R_ResetSunLightOverride',
    0x1000c000: 'R_TextHeight', 0x1000aac0: 'R_SetCullDist',
    0x1001d910: 'R_ModelBounds', 0x1000bb10: 'R_ClearFogs', 0x1000bc40: 'R_ArchiveFogState',
    0x10020f10: 'R_BeginDelayedDrawing', 0x10020f70: 'R_EndDelayedDrawing',
    0x10020fe0: 'R_IssueDelayedDrawing',
    0x10001230: 'R_GetWorldBounds',
}


def extract(code, address, base, count):
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    decoder.detail = True
    result = {}
    instructions = list(decoder.disasm(code, address))
    if sum(i.size for i in instructions) != len(code):
        raise ValueError('incomplete GetRefAPI decode')
    for ins in instructions:
        if ins.id != X86_INS_MOV or len(ins.operands) != 2:
            continue
        dst, src = ins.operands
        if dst.type != X86_OP_MEM or dst.mem.base or dst.mem.index:
            continue
        offset = dst.mem.disp - base
        if not 0 <= offset < count * 4:
            continue
        if offset % 4 or dst.size != 4 or src.type != X86_OP_IMM:
            raise ValueError('unhandled export-table store at ' + hex(ins.address))
        slot = offset // 4
        if slot in result:
            raise ValueError('multiple writes to slot ' + str(slot))
        result[slot] = {'target': src.imm & 0xffffffff, 'write_instruction': ins.address}
    return result


def main():
    assert extract(bytes.fromhex('c7050020000000300000'), 0x1000, 0x2000, 1) == {
        0: {'target': 0x3000, 'write_instruction': 0x1000}}
    assert extract(bytes.fromhex('c7050020000000300000'), 0x1000, 0x4000, 1) == {}
    m = load_matcher()
    code, _ = m['carve'](ENTRY)
    # Pin exact import copy / table-clear setup rather than infer it from JSON.
    expected_setup = bytes.fromhex(
        '56 8b74240c 57 b9a9000000 bfc8491d10 f3a5 '
        '33c0 b96c000000 bf80a87610 f3ab')
    if not code.startswith(expected_setup) or code[36:39] != bytes.fromhex('83f83b'):
        raise ValueError('import-copy/export-clear setup changed')
    writes = extract(code, ENTRY, BASE, COUNT)
    old = json.loads((ROOT / 'glm/data/refexport_gfx10.json').read_text())
    labels = {row['slot']: row for row in old['slots']}
    slots = []
    for slot in range(COUNT):
        event = writes.get(slot)
        target = event['target'] if event else 0
        reference = labels.get(slot, {})
        if reference and (int(reference['func'], 16) if reference['func'] else 0) != target:
            raise ValueError(f'GLM map disagrees with target slot {slot}')
        slots.append(dict(slot=slot, table_address=hex(BASE + 4 * slot),
                          target=hex(target), write_instruction=hex(event['write_instruction']) if event else None,
                          legacy_name_unverified=reference.get('name'),
                          name_supported=CHECKED_LABELS.get(target), address_confidence='PINNED',
                          inventoried_function=f'{target:x}' in m['INV'] if target else False))
    packet = dict(anchor_sha256=EXPECTED, getrefapi=hex(ENTRY),
                  export_base=hex(BASE), export_slots=COUNT, api_version=59,
                  import_base='0x101d49c8', import_slots=169,
                  notes='Destinations pinned from instructions. Only explicitly cross-checked names are SUPPORTED; other GLM adapter names remain unverified. Signatures not certified.',
                  slots=slots)
    output = Path(__file__).resolve().parent / 'refapi_pinned.json'
    output.write_text(json.dumps(packet, indent=2) + '\n')
    print(f'PINNED: {len(writes)} export writes; {COUNT - len(writes)} zero slots; '
          f'169 import slots; API version 59. {output}')


if __name__ == '__main__':
    main()
