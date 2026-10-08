#!/usr/bin/env python3
"""Reuse complete-section discovery; no coverage credit."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_crt/discover.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '00e1771d5d67a63d360d573d9278e1bbb38e039eecebcf568059c486212b9131'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'discover.py')})
