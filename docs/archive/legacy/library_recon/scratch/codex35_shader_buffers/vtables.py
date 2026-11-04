"""Retain previously proven table/constructor locators, with zero new credit."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_conversions/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b854cdd62314741f685c3ccf317b5de1e1c2ab12f3aa70c56acca7206f54f7d2'
source = prior.read_text().replace('codex35_shader_conversions', 'codex35_shader_buffers')
exec(compile(source, str(prior), 'exec'), globals())
