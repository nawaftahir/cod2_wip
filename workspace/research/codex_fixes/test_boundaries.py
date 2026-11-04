"""A repeated static name must bound its neighboring function at every occurrence."""
from pathlib import Path
from types import SimpleNamespace
import importlib.util
import sys

sys.path.insert(0, "tools")
import link
import verify

spec = importlib.util.spec_from_file_location("verify_fixed", "workspace/research/codex_fixes/verify_fixed.py")
fixed = importlib.util.module_from_spec(spec)
spec.loader.exec_module(fixed)
mapping = """
 0001:00000000       _helper 00401000 f   first.obj
 0001:00000020       _neighbor 00401020 f   middle.obj
 0001:00000040       _helper 00401040 f   second.obj
 0001:00000060       _next 00401060 f   last.obj
"""

class FakePE:
    OPTIONAL_HEADER = SimpleNamespace(ImageBase=0x400000)

    def get_data(self, rva, size):
        # Real bytes continue at the duplicate helper; do not trim by RET heuristics.
        return b"\x55" * size

old_map, old_pe = link.MAP, verify.pefile.PE
try:
    link.MAP = SimpleNamespace(read_text=lambda **_: mapping)
    verify.pefile.PE = lambda *_, **__: FakePE()
    before = verify.Linked()
    after = fixed.Linked()
    assert before.code("_neighbor")[1] == b"\x55" * 64
    assert after.code("_neighbor")[1] == b"\x55" * 32
    assert after.syms["_helper"] == before.syms["_helper"] == 0x401000
    assert after.labels[0x401040] == {"_helper"}
    assert after.starts == [0x401000, 0x401020, 0x401040, 0x401060]
    # Byte and callee predicates are untouched; only the map reader's extent changes.
    assert fixed.check.__code__.co_code == verify.check.__code__.co_code
    assert fixed.masks.__code__.co_code == verify.masks.__code__.co_code
finally:
    link.MAP, verify.pefile.PE = old_map, old_pe
print("PASS: duplicate helper boundaries; symbol selection, labels and predicates retained")
