"""Retain preceding typed tables and zero-credit SDK destructor identities."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex31_program/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0e925d2b59ea7404db5ed9288cd9e65dfa5179c93a8c3d5bb69bc90dabb735c4'
source = prior.read_text().replace('codex31_program', 'codex35_program_flow')
source = source.replace("PROGRAM_HERE / 'clean_packet.json'", "PROGRAM_HERE.parent / 'codex31_program/clean_packet.json'")
exec(compile(source, str(prior), 'exec'), globals())
