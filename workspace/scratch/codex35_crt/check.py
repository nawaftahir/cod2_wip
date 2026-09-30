#!/usr/bin/env python3
"""Reuse the unchanged, hash-pinned original-source binding verifier."""
import hashlib
import json
from pathlib import Path
import runpy

HERE = Path(__file__).resolve().parent
checker = HERE.parent / 'codex19_crt/check.py'
assert hashlib.sha256(checker.read_bytes()).hexdigest() == '85b144646e69d5a9aecf72b88e6953e4a79ff9ad2ab8f73b20e1582387eda3d6'
module = runpy.run_path(str(checker))
original_branches = module['main'].__globals__['branch_fields']


def checked_branches(body, address):
    try:
        return original_branches(body, address)
    except ValueError as error:
        raise AssertionError(str(error)) from error


module['main'].__globals__['branch_fields'] = checked_branches
old = json.loads((checker.parent / 'plan.json').read_text())
new = json.loads((HERE / 'discovery.json').read_text())
prior = json.loads((checker.parent / 'packet.json').read_text())['rows']
interiors = []
entries = []
for row in new:
    address = int(row['address'], 16)
    if any(int(p['address'], 16) < address < int(p['address'], 16) + p['bytes']
           for p in prior):
        interiors.append(row | {'reason': 'interior of a previously certified complete function'})
    else:
        entries.append(row)
new = entries
(HERE / 'interior_rejected.json').write_text(json.dumps(interiors, indent=2) + '\n')
plan = []
for row in old + new:
    row = {k: row[k] for k in ('symbol', 'address', 'bytes', 'object')}
    row['object'] = row['object'].replace('scratch/codex19_crt/obj/',
                                        'scratch/codex35_crt/obj/prior19/')
    plan.append(row)
(HERE / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
module['main'].__globals__['HERE'] = HERE
module['main'].__globals__['__file__'] = __file__
module['main']()
