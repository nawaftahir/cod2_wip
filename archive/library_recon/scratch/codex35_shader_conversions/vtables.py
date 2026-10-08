"""Retain existing table/constructor binding locators; none earns new credit."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_comment/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '86e261b054a2b165efc03bb894fd368b6e46836f20de2991c08e6bef4e4b866b'
source = prior.read_text().replace('codex35_shader_comment', 'codex35_shader_conversions')
exec(compile(source, str(prior), 'exec'), globals())
