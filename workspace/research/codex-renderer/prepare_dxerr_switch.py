#!/usr/bin/env python3
"""Recover a readable switch candidate from a preserved decompile oracle.

This is unverified reference translation, NOT target execution or byte proof.
"""
import hashlib
import json
from pathlib import Path
import re
import subprocess

from batch_existing import HERE


def main():
    source = HERE / 'scratch/codex_dxerr_probe/j_100efe3c.c'
    text = source.read_text()
    values = sorted({int(value, 0) for value in re.findall(
        r'(?:param_1\s*(?:==|<)|case)\s*(-?0x[0-9a-f]+)', text)})
    out = HERE / 'scratch/codex_dxerr_switch'
    out.mkdir(exist_ok=True)
    driver = out / 'oracle.c'
    driver.write_text('#include <stdio.h>\n#define __stdcall\n#include "' +
        str(source) + '"\nint main(void) { unsigned char *p; int i; '
        'int values[]={' + ','.join(map(str, values)) + '}; '
        'for(i=0;i<(int)(sizeof(values)/sizeof(values[0]));i++) {'
        'printf("%d\\t",values[i]); p=(unsigned char*)Renderer_ErrorDescription(values[i]); '
        'while(*p) { printf("%02x",*p);p++; } puts(""); } return 0; }\n')
    executable = out / 'oracle'
    subprocess.run(['cc', '-std=c99', str(driver), '-o', str(executable)], check=True)
    result = subprocess.run([str(executable)], text=True, capture_output=True, check=True)
    cases = []
    for line in result.stdout.splitlines():
        value, encoded = line.split('\t')
        literal = bytes.fromhex(encoded).decode('ascii')
        if literal != 'n/a':
            cases.append((int(value), literal))
    for suffix, wide in [('a', False), ('w', True)]:
        code = '#include <stddef.h>\nconst ' + ('wchar_t' if wide else 'char')
        code += ' *__stdcall Renderer_ErrorDescription' + ('W' if wide else '')
        code += '(int code)\n{\n    switch (code)\n    {\n'
        for value, literal in cases:
            code += f'    case {value}:\n        return ' + ('L' if wide else '') + json.dumps(literal) + ';\n'
        code += '    default:\n        return ' + ('L' if wide else '') + '"n/a";\n    }\n}\n'
        (out / f'j_dxerr_{suffix}.c').write_text(code)
    (out / 'provenance.json').write_text(json.dumps(dict(
        status='UNVERIFIED-SWITCH-CANDIDATE', input=str(source),
        input_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
        known_case_count=len(cases), oracle='decompile compiled by host, NOT target',
        unknowns='wide mappings and complete target behavior require independent proof'), indent=2) + '\n')
    print(f'{len(cases)} switch cases generated, unverified; no progress credit.')


if __name__ == '__main__':
    main()
