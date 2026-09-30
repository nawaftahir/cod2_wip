#!/usr/bin/env python3
"""Recover grammar action pairs from saved decompiles, never instruction bytes."""
import hashlib
import json
from pathlib import Path
import re

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
inputs = {}
for prefix, klass, instance, address, size, final in (
    ('d3dxtok', 'CPreProcessor', 's_pPP', '10066a19', 0x171, 15),
    ('d3dxasm', 'CAssembler', 's_pAsm', '1006b861', 0x127, 16),
    ('d3dxshader', 'CParse', 's_pParse', '100a352e', 0xd88, 40),
):
    path, = (ROOT / 'glm/data/decomp').glob(address + '_*.c')
    text = path.read_text()
    pairs = re.findall(r'case ([^:]+):\s+uVar7 = ([^;]+);\s+uVar6 = ([^;]+);\s+break;', text)
    assert pairs and len(pairs) == len(re.findall(r'\n    case ', text))
    def integer(value):
        return int(value.strip(), 0)
    cases = '\n'.join('        case %d: PARSER_CLASS::PARSER_INSTANCE->Production(%d, %d); break;'
                      % (integer(case), integer(rule), integer(count)) for case, count, rule in pairs)
    (HERE / (prefix + '_actions.inc')).write_text(cases + '\n')
    source = '\n'.join([
        '#define JOIN_(a, b) a##b', '#define JOIN(a, b) JOIN_(a, b)',
        '#define YY(n) JOIN(' + prefix + '_, n)',
        '#define PARSE ' + prefix + '_parse', '#define PARSER_CLASS ' + klass,
        '#define PARSER_INSTANCE ' + instance, '#define TABLE_SIZE ' + str(size),
        '#define FINAL_STATE ' + str(final), '#define ACTIONS "' + prefix + '_actions.inc"',
        '#include "parser_core.h"', ''])
    (HERE / (prefix + '.cpp')).write_text(source)
    inputs[str(path.relative_to(ROOT))] = hashlib.sha256(path.read_bytes()).hexdigest()
(HERE / 'generation_inputs.json').write_text(json.dumps(inputs, indent=2) + '\n')
