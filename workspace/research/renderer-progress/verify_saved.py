#!/usr/bin/env python3
"""Check saved source integrity; this is not a binary-match referee."""
import hashlib
import json
from pathlib import Path


def main():
    root = Path(__file__).resolve().parent
    manifest = json.loads((root / 'manifest.json').read_text())
    for name, digest in manifest['files'].items():
        path = (root / name).resolve()
        if not path.is_relative_to(root) or not path.is_file():
            raise ValueError('Invalid checkpoint path: ' + name)
        if hashlib.sha256(path.read_bytes()).hexdigest() != digest:
            raise ValueError('Changed saved input: ' + name)
    seen = set()
    total = 0
    for function in manifest['jpeg_functions']:
        address = function['address']
        if address in seen or function['unresolved'] != 0:
            raise ValueError('Duplicate or unresolved function: ' + address)
        seen.add(address)
        digest = manifest['files'][function['checkpoint_source']]
        if digest != function['source_sha256']:
            raise ValueError('Source provenance differs: ' + address)
        total += function['bytes']
    if len(seen) != 162 or total != 54883 or total != manifest['jpeg_matched_bytes']:
        raise ValueError('JPEG accounting differs')
    material = json.loads((root / 'evidence/material_packet.json').read_text())
    for name, digest in material['sources'].items():
        if manifest['files']['src/renderer/' + name] != digest:
            raise ValueError('Renderer provenance differs: ' + name)
    if material['bytes'] != 425 or manifest['renderer_matched_bytes'] != 425:
        raise ValueError('Renderer accounting differs')
    print('PASS: saved input hashes; 162 JPEG functions / 54883 bytes + renderer 425 bytes')
    print('Integrity only; no whole-file identity or independent acceptance claimed.')


if __name__ == '__main__':
    main()
