"""Report unchanged-referee game matches; reject every lost baseline extent."""
import hashlib
import json
import sys
from pathlib import Path

gfx = next(p for p in Path(__file__).resolve().parents
           if p.name == 'gfx' and (p / 'tools/gamecov.py').is_file())
baseline = gfx / 'target/scratch/codex30_merge/proof_30011/bind.json'
assert hashlib.sha256(baseline.read_bytes()).hexdigest() == 'aad32296ade6e37e048177c77ad3548c3f5b8b5414423be33e520e8427cc1e3c'

def accepted(path):
    rows = {}
    for name, row in json.loads(path.read_text()).items():
        va = int(row['t'], 16)
        if row['why'] or not (0x10001000 <= va < 0x10041db0 or 0x10057990 <= va < 0x10062200):
            continue
        assert va not in rows or rows[va]['n'] == row['n'], ('conflicting extent', hex(va))
        rows[va] = dict(row, name=name)
    return rows

candidate = Path(sys.argv[1])
old, new = accepted(baseline), accepted(candidate)
checkpoint = gfx / 'target/scratch/codex35/proof_checkpoint1/bind.json'
assert hashlib.sha256(checkpoint.read_bytes()).hexdigest() == '2a458ff42bb761e9d271828b86600102a4f698ddad6bd393f7c3b8e7be026497'
required = {va: row for va, row in accepted(checkpoint).items()
            if va in old or '@std@@' not in row['name']}
latest = gfx / 'target/scratch/codex35/bind_35.json'
assert hashlib.sha256(latest.read_bytes()).hexdigest() == 'e800dee86084c5fe604f76dcd9da7a45a65e8cf770e98b2cbd76278f4aebb677'
required.update({va: row for va, row in accepted(latest).items()
                 if va in old or '@std@@' not in row['name']})
final = gfx / 'target/scratch/codex35/bind_76.json'
assert hashlib.sha256(final.read_bytes()).hexdigest() == 'cb0134555a897410b1bef78894f29ba0de92c3902567388209540d45d3a031ca'
required.update({va: row for va, row in accepted(final).items()
                 if va in old or '@std@@' not in row['name']})
insertion = gfx / 'target/scratch/codex35/bind_78.json'
assert hashlib.sha256(insertion.read_bytes()).hexdigest() == '676017da20f1a0f91a640d2f6a8848c631c50c355f3da2e625c5d6dfaab36057'
required.update({va: row for va, row in accepted(insertion).items()
                 if va in old or '@std@@' not in row['name']})
recursive = gfx / 'target/scratch/codex35/bind_82.json'
assert hashlib.sha256(recursive.read_bytes()).hexdigest() == '402890a8d30afbf7bb3dd2423a5c65b8fb6ae5742f1b4c186f6dfb13409f1f86'
required.update({va: row for va, row in accepted(recursive).items()
                 if va in old or '@std@@' not in row['name']})
clipping = gfx / 'target/scratch/codex35/bind_83.json'
assert hashlib.sha256(clipping.read_bytes()).hexdigest() == '758ef31d6554ab2080b6e0d936120702c3314bfcb51b7683b1de6d0ef2e582e4'
required.update({va: row for va, row in accepted(clipping).items()
                 if va in old or '@std@@' not in row['name']})
occlusion = gfx / 'target/scratch/codex35/bind_84.json'
assert hashlib.sha256(occlusion.read_bytes()).hexdigest() == 'c2516edd36a2bbb2118d5dcdc453f235737ab69b66b5ccacb8fac19c6535c017'
required.update({va: row for va, row in accepted(occlusion).items()
                 if va in old or '@std@@' not in row['name']})
planes = gfx / 'target/scratch/codex35/bind_86.json'
assert hashlib.sha256(planes.read_bytes()).hexdigest() == '88a96f18cfe476aca24b7fba91c3f4b8ce772d5bd1722066f667f2a83718c01e'
required.update({va: row for va, row in accepted(planes).items()
                 if va in old or '@std@@' not in row['name']})
hull_portal = gfx / 'target/scratch/codex35/bind_87.json'
assert hashlib.sha256(hull_portal.read_bytes()).hexdigest() == '76044dc8153386a5f5d4243561682ed248a68f3d35d10ee6e9f14744b115a23d'
required.update({va: row for va, row in accepted(hull_portal).items()
                 if va in old or '@std@@' not in row['name']})
lighting = gfx / 'target/scratch/codex35/bind_102.json'
assert hashlib.sha256(lighting.read_bytes()).hexdigest() == '1eca134382029c94d9984adb02e1dcf7dd9023c45accfac943125d3fe3dd4d38'
required.update({va: row for va, row in accepted(lighting).items()
                 if va in old or '@std@@' not in row['name']})
shader = gfx / 'target/scratch/codex35/proof_checkpoint4/bind.json'
assert hashlib.sha256(shader.read_bytes()).hexdigest() == '0648d545d1aee1efb267c9157f200f8c0797ee20ecb52a5b24e0fdce471566be'
required.update({va: row for va, row in accepted(shader).items()
                 if va in old or '@std@@' not in row['name']})
sun_quad = gfx / 'target/scratch/codex35/proof_checkpoint6/bind.json'
assert hashlib.sha256(sun_quad.read_bytes()).hexdigest() == '9622e818247f17b1ebe3600e0390168617a4d8d0603b968a6737a81b32dee1c6'
required.update({va: row for va, row in accepted(sun_quad).items()
                 if va in old or '@std@@' not in row['name']})
filter_warm = gfx / 'target/scratch/codex35/bind_138.json'
assert hashlib.sha256(filter_warm.read_bytes()).hexdigest() == 'e306e2c79fb120f76aa0eb60c5e8702ba152eec79351c8b11c1c4d5c0e41e8da'
required.update({va: row for va, row in accepted(filter_warm).items()
                 if va in old or '@std@@' not in row['name']})
shadow_warm = gfx / 'target/scratch/codex35/bind_143.json'
assert hashlib.sha256(shadow_warm.read_bytes()).hexdigest() == '6a20d9d2ccad72f59719ef5bfe8f5397dd5ed274ea29a62409a53dbfff15ea95'
required.update({va: row for va, row in accepted(shadow_warm).items()
                 if va in old or '@std@@' not in row['name']})
fit_warm = gfx / 'target/scratch/codex35/bind_159.json'
assert hashlib.sha256(fit_warm.read_bytes()).hexdigest() == 'aaf049b5161f2cc2ce7fbded67cecd649d58b8a9397389ad9679b1a34c394939'
required.update({va: row for va, row in accepted(fit_warm).items()
                 if va in old or '@std@@' not in row['name']})
wavelet_warm = gfx / 'target/scratch/codex35/bind_167.json'
assert hashlib.sha256(wavelet_warm.read_bytes()).hexdigest() == 'fef65896c1cb0745f87c1dc6bec9dc5b7bbc992aa40dc62577453bc1d25fc552'
required.update({va: row for va, row in accepted(wavelet_warm).items()
                 if va in old or '@std@@' not in row['name']})
wavelet_level = gfx / 'target/scratch/codex35/bind_177.json'
assert hashlib.sha256(wavelet_level.read_bytes()).hexdigest() == '5eee89605cafed870628a94300da896cd485ca39668ee97149f7b0d3b39fc0d4'
required.update({va: row for va, row in accepted(wavelet_level).items()
                 if va in old or '@std@@' not in row['name']})
image_header = gfx / 'target/scratch/codex35/bind_178.json'
assert hashlib.sha256(image_header.read_bytes()).hexdigest() == '331d37f38685ff4958b06305e2dfbebb2a956d5f15ff2e2bb84e13f70fd662db'
required.update({va: row for va, row in accepted(image_header).items()
                 if va in old or '@std@@' not in row['name']})
mipmap_count = gfx / 'target/scratch/codex35/bind_185.json'
assert hashlib.sha256(mipmap_count.read_bytes()).hexdigest() == '2c9874363ff05288c9d9f8457beb834fd26a312b3f73d07eee33e840366f05b8'
required.update({va: row for va, row in accepted(mipmap_count).items()
                 if va in old or '@std@@' not in row['name']})
small_depth = gfx / 'target/scratch/codex35/bind_191.json'
assert hashlib.sha256(small_depth.read_bytes()).hexdigest() == '0cbad357c8caf2c09bf76f581ae26c95faeaaf681528be4307c12444399ae811'
required.update({va: row for va, row in accepted(small_depth).items()
                 if va in old or '@std@@' not in row['name']})
framebuffer = gfx / 'target/scratch/codex35/bind_202.json'
assert hashlib.sha256(framebuffer.read_bytes()).hexdigest() == 'c002898ed9d2087b325cdceb06d3188fe58208d21cd79db8441a4c3f66f0e35c'
required.update({va: row for va, row in accepted(framebuffer).items()
                 if va in old or '@std@@' not in row['name']})
cell_link = gfx / 'target/scratch/codex35/bind_216.json'
assert hashlib.sha256(cell_link.read_bytes()).hexdigest() == '467f3dc6731e2a2e44bebeba797e3c00d21c42371308d7f1c858530661a4f5f7'
required.update({va: row for va, row in accepted(cell_link).items()
                 if va in old or '@std@@' not in row['name']})
bounds_dispatch = gfx / 'target/scratch/codex35/bind_222.json'
assert hashlib.sha256(bounds_dispatch.read_bytes()).hexdigest() == 'ff9229b68726bcb9395d4a46910019b84f677b4e66d801d27792bbe3d3d7751a'
required.update({va: row for va, row in accepted(bounds_dispatch).items()
                 if va in old or '@std@@' not in row['name']})
shader_rules = gfx / 'target/scratch/codex35/bind_244.json'
assert hashlib.sha256(shader_rules.read_bytes()).hexdigest() == '303e07c68966570692f4b3e4ff6205dd0ab166feb959f3ce5508b77cb6960918'
required.update({va: row for va, row in accepted(shader_rules).items()
                 if va in old or '@std@@' not in row['name']})
fog_helpers = gfx / 'target/scratch/codex35/bind_250.json'
assert hashlib.sha256(fog_helpers.read_bytes()).hexdigest() == '5419c79dd99a5ea903caaa1e15c8c2bf253a04087377af873fe68c0f7899b5c6'
required.update({va: row for va, row in accepted(fog_helpers).items()
                 if va in old or '@std@@' not in row['name']})
fog_state = gfx / 'target/scratch/codex35/bind_255.json'
assert hashlib.sha256(fog_state.read_bytes()).hexdigest() == '9b0f40b89fc4cc7c3403b4f71f0df488ed68d8fdb74f513523d930947e01517c'
required.update({va: row for va, row in accepted(fog_state).items()
                 if va in old or '@std@@' not in row['name']})
mark_clip = gfx / 'target/scratch/codex35/bind_269.json'
assert hashlib.sha256(mark_clip.read_bytes()).hexdigest() == 'a88f9dd8fd3f9a1e914ce5de990e88c34bebb8019f4a6798d76851e87b845b0e'
required.update({va: row for va, row in accepted(mark_clip).items()
                 if va in old or '@std@@' not in row['name']})
glow = gfx / 'target/scratch/codex35/bind_289.json'
assert hashlib.sha256(glow.read_bytes()).hexdigest() == '2d898cef3363e303fef2a5ce3cdfecd4002b429fb2671e9f071b3f418ead659d'
required.update({va: row for va, row in accepted(glow).items()
                 if va in old or '@std@@' not in row['name']})
draw_state = gfx / 'target/scratch/codex35/bind_293.json'
assert hashlib.sha256(draw_state.read_bytes()).hexdigest() == '1fb20f50ac075d846fdd0a2963744c9a8e4320f30e1a637b7f2b1a1a59fbdf49'
required.update({va: row for va, row in accepted(draw_state).items()
                 if va in old or '@std@@' not in row['name']})
lost = [hex(va) for va, row in old.items() if va not in new or new[va]['n'] != row['n']]
checkpoint_lost = [hex(va) for va, row in required.items()
                   if va not in new or new[va]['n'] != row['n']]
gains = [dict(target=hex(va), bytes=row['n'], name=row['name'], object=row['obj'])
         for va, row in sorted(new.items()) if va not in old]
inventory = json.loads((gfx.parent / 'glm/data/functions_gfx10.json').read_text())['functions']
total = sum(row['size'] for row in inventory if not row['thunk'] and
            (0x10001000 <= int(row['addr'], 16) < 0x10041db0 or
             0x10057990 <= int(row['addr'], 16) < 0x10062200))
library = {va: row for va, row in new.items() if va not in old and '@std@@' in row['name']}
scored = {va: row for va, row in new.items() if va not in library}
gains = [row for row in gains if int(row['target'], 16) not in library]
# Require full unchanged-referee extents; exclude embedded tables and padding.
embedded_table_bytes = 0
for va, extent, code, label in [
    (0x1000d090, 92, 66, 'picmip semantic'),
    (0x1000e840, 187, 135, 'source slice size'),
    (0x1000e900, 274, 226, 'upload copy block'),
    (0x1000ef40, 219, 149, 'mip memory'),
    (0x10023800, 200, 183, 'scene entity comparator'),
    (0x10038cf0, 733, 636, 'shader matrix'),
    (0x1000f900, 316, 261, 'image dispatcher'),
    (0x10022710, 172, 79, 'format description'),
]:
    if va in scored:
        assert scored[va]['n'] == extent, label + ' extent changed'
        embedded_table_bytes += extent - code
done = sum(row['n'] for row in scored.values()) - embedded_table_bytes
print(json.dumps(dict(functions=len(scored), bytes=done, total=total, percent=100*done/total,
                      baseline_lost=lost, gains=gains,
                      checkpoint_lost=checkpoint_lost,
                      excluded_new_library_functions=len(library),
                      excluded_new_embedded_table_bytes=embedded_table_bytes,
                      excluded_new_library_bytes=sum(row['n'] for row in library.values())), indent=2))
assert not lost, ('baseline loss', lost)
assert not checkpoint_lost, ('checkpoint loss', checkpoint_lost)
build = candidate.parent
assert (build / 'gfx.dll').stat().st_mtime <= (build / 'cmp.json').stat().st_mtime <= candidate.stat().st_mtime
