#!/usr/bin/env python3
"""Mechanical isolated DX error-decompile build probe; not accepted source."""
from pathlib import Path
import hashlib
import json

from batch_existing import HERE
from audit_legacy import ROOT


def main():
    out = HERE / 'scratch/codex_dxerr_probe'
    out.mkdir(exist_ok=True)
    provenance = []
    for address, name in [('100efe3c', 'Renderer_ErrorDescription'),
                          ('100f2b25', 'Renderer_ErrorDescriptionW')]:
        source = ROOT / 'glm/data/decomp' / f'{address}_FUN_{address}.c'
        original = source.read_text()
        kind = 'wchar_t' if address == '100f2b25' else 'char'
        text = original.replace(f'{kind} * FUN_{address}(int param_1)',
                                f'const {kind} *__stdcall {name}(int param_1)')
        assert text != original
        if kind == 'wchar_t':
            text = '#include <stddef.h>\n' + text
        text = text.replace(') {', ')\n  {').replace('else {', 'else\n  {')
        target = out / f'j_{address}.c'
        if target.exists() and target.read_text() != text:
            raise ValueError('existing probe changed: ' + str(target))
        target.write_text(text)
        provenance.append(dict(input=str(source), input_sha256=hashlib.sha256(
            source.read_bytes()).hexdigest(), output=str(target),
            status='DECOMPILE-PROBE-NOT-RECONSTRUCTION',
            output_sha256=hashlib.sha256(target.read_bytes()).hexdigest()))
    (out / 'provenance.json').write_text(json.dumps(provenance, indent=2) + '\n')
    print('Prepared two isolated decompile probes; no matched-source claim.')


if __name__ == '__main__':
    main()
