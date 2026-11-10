"""Definitions sort by retail address; other items, preprocessor runs and unbound followers stay put."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from retail_order import items, plan

src = '''static int g;
void B(void) { g = 1; }
void helper(void) { /* } */ }
void A(int x)
{
    const char *s = "}";
}
#if 1
void D(void) {}
void C(void) {}
#endif
'''
chunks = items(src)
assert ''.join(c[1] for c in chunks) == src
out = ''.join(c[1] for c in plan(chunks, {'A': 0x10, 'B': 0x20, 'C': 0x30, 'D': 0x40}))
assert out.index('void A(int x)\n') < out.index('void B(void) {') < out.index('void helper(void) {'), out
assert out.index('void C(void) {') < out.index('void D(void) {') and out.index('#if') < out.index('void C') < out.index('#endif'), out
assert out.startswith('static int g;'), out
assert out.index('void A(int x);') < out.index('void A(int x)\n'), out
# across mode: definitions cross data, data keeps its slot
src2 = 'void B(void) {}\nint g;\nvoid A(void) {}\n'
c2 = items(src2)
out2 = ''.join(c[1] for c in plan(c2, {'A': 1, 'B': 2}, across=True))
assert out2.index('int g;') < out2.index('void A(void) {') < out2.index('void B(void) {'), out2
assert ''.join(c[1] for c in plan(c2, {'A': 1, 'B': 2})) == src2
# broken case: an unknown order leaves the file unchanged
assert ''.join(c[1] for c in plan(chunks, {})) == src
print('PASS: retail order moves only definitions, keeps unbound followers glued and preprocessor runs closed')
