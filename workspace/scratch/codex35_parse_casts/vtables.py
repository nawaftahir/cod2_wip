"""Retain previous table/constructor locators, without new source credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_buffers/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ec39dc66ee3cc8fe5eeffb195873fad7e27be480a742309976a388b51bbe99b6'
source = prior.read_text().replace('codex35_shader_buffers', 'codex35_parse_casts')
exec(compile(source, str(prior), 'exec'), globals())
