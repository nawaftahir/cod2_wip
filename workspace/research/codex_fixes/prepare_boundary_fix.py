"""Draft the boundary correction without editing owner-only tools/."""
from pathlib import Path
import difflib

original = Path("tools/verify.py").read_text()
fixed = original.replace("self.syms, self.obj, self.inline = {}, {}, set()", "self.syms, self.obj, self.inline = {}, {}, set()\n        starts = set()")
fixed = fixed.replace("            if m:\n                if m.group(3):", "            if m:\n                starts.add(int(m.group(2), 16))\n                if m.group(3):")
fixed = fixed.replace("self.starts = sorted(set(self.syms.values()))", "self.starts = sorted(starts)")
assert fixed != original
assert fixed.count("starts.add(int(m.group(2), 16))") == 1
Path("workspace/research/codex_fixes/verify_fixed.py").write_text(fixed)
diff = "".join(difflib.unified_diff(original.splitlines(keepends=True), fixed.splitlines(keepends=True),
                                fromfile="a/tools/verify.py", tofile="b/tools/verify.py"))
Path("workspace/research/codex_fixes/function_boundaries.patch").write_text(diff)
