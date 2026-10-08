"""Reuse full-section diagnostic probe. No source credit or acceptance here."""
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_constants/probe.py'
sys.argv = ['probe.py', 'nodes.obj', 'nodes.cpp']
source = prior.read_text().replace("obj = HERE / 'obj' /", "obj = HERE.parent / 'codex30_token/obj' /")
exec(compile(source, str(prior), 'exec'))
