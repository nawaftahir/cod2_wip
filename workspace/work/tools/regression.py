"""Report unchanged-referee game matches; reject every lost baseline extent."""
import hashlib
import json
import sys
from pathlib import Path

gfx = next(p for p in Path(__file__).resolve().parents
           if p.name == 'gfx' and (p / 'tools/gamecov.py').is_file())
baseline = gfx / 'target/work/proof/history/codex30_merge/proof_30011/bind.json'
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
checkpoint = gfx / 'target/work/proof/history/codex35/proof_checkpoint1/bind.json'
assert hashlib.sha256(checkpoint.read_bytes()).hexdigest() == '2a458ff42bb761e9d271828b86600102a4f698ddad6bd393f7c3b8e7be026497'
required = {va: row for va, row in accepted(checkpoint).items()
            if va in old or '@std@@' not in row['name']}
latest = gfx / 'target/work/proof/history/codex35/bind_35.json'
assert hashlib.sha256(latest.read_bytes()).hexdigest() == 'e800dee86084c5fe604f76dcd9da7a45a65e8cf770e98b2cbd76278f4aebb677'
required.update({va: row for va, row in accepted(latest).items()
                 if va in old or '@std@@' not in row['name']})
final = gfx / 'target/work/proof/history/codex35/bind_76.json'
assert hashlib.sha256(final.read_bytes()).hexdigest() == 'cb0134555a897410b1bef78894f29ba0de92c3902567388209540d45d3a031ca'
required.update({va: row for va, row in accepted(final).items()
                 if va in old or '@std@@' not in row['name']})
insertion = gfx / 'target/work/proof/history/codex35/bind_78.json'
assert hashlib.sha256(insertion.read_bytes()).hexdigest() == '676017da20f1a0f91a640d2f6a8848c631c50c355f3da2e625c5d6dfaab36057'
required.update({va: row for va, row in accepted(insertion).items()
                 if va in old or '@std@@' not in row['name']})
recursive = gfx / 'target/work/proof/history/codex35/bind_82.json'
assert hashlib.sha256(recursive.read_bytes()).hexdigest() == '402890a8d30afbf7bb3dd2423a5c65b8fb6ae5742f1b4c186f6dfb13409f1f86'
required.update({va: row for va, row in accepted(recursive).items()
                 if va in old or '@std@@' not in row['name']})
clipping = gfx / 'target/work/proof/history/codex35/bind_83.json'
assert hashlib.sha256(clipping.read_bytes()).hexdigest() == '758ef31d6554ab2080b6e0d936120702c3314bfcb51b7683b1de6d0ef2e582e4'
required.update({va: row for va, row in accepted(clipping).items()
                 if va in old or '@std@@' not in row['name']})
occlusion = gfx / 'target/work/proof/history/codex35/bind_84.json'
assert hashlib.sha256(occlusion.read_bytes()).hexdigest() == 'c2516edd36a2bbb2118d5dcdc453f235737ab69b66b5ccacb8fac19c6535c017'
required.update({va: row for va, row in accepted(occlusion).items()
                 if va in old or '@std@@' not in row['name']})
planes = gfx / 'target/work/proof/history/codex35/bind_86.json'
assert hashlib.sha256(planes.read_bytes()).hexdigest() == '88a96f18cfe476aca24b7fba91c3f4b8ce772d5bd1722066f667f2a83718c01e'
required.update({va: row for va, row in accepted(planes).items()
                 if va in old or '@std@@' not in row['name']})
hull_portal = gfx / 'target/work/proof/history/codex35/bind_87.json'
assert hashlib.sha256(hull_portal.read_bytes()).hexdigest() == '76044dc8153386a5f5d4243561682ed248a68f3d35d10ee6e9f14744b115a23d'
required.update({va: row for va, row in accepted(hull_portal).items()
                 if va in old or '@std@@' not in row['name']})
lighting = gfx / 'target/work/proof/history/codex35/bind_102.json'
assert hashlib.sha256(lighting.read_bytes()).hexdigest() == '1eca134382029c94d9984adb02e1dcf7dd9023c45accfac943125d3fe3dd4d38'
required.update({va: row for va, row in accepted(lighting).items()
                 if va in old or '@std@@' not in row['name']})
shader = gfx / 'target/work/proof/history/codex35/proof_checkpoint4/bind.json'
assert hashlib.sha256(shader.read_bytes()).hexdigest() == '0648d545d1aee1efb267c9157f200f8c0797ee20ecb52a5b24e0fdce471566be'
required.update({va: row for va, row in accepted(shader).items()
                 if va in old or '@std@@' not in row['name']})
sun_quad = gfx / 'target/work/proof/history/codex35/proof_checkpoint6/bind.json'
assert hashlib.sha256(sun_quad.read_bytes()).hexdigest() == '9622e818247f17b1ebe3600e0390168617a4d8d0603b968a6737a81b32dee1c6'
required.update({va: row for va, row in accepted(sun_quad).items()
                 if va in old or '@std@@' not in row['name']})
filter_warm = gfx / 'target/work/proof/history/codex35/bind_138.json'
assert hashlib.sha256(filter_warm.read_bytes()).hexdigest() == 'e306e2c79fb120f76aa0eb60c5e8702ba152eec79351c8b11c1c4d5c0e41e8da'
required.update({va: row for va, row in accepted(filter_warm).items()
                 if va in old or '@std@@' not in row['name']})
shadow_warm = gfx / 'target/work/proof/history/codex35/bind_143.json'
assert hashlib.sha256(shadow_warm.read_bytes()).hexdigest() == '6a20d9d2ccad72f59719ef5bfe8f5397dd5ed274ea29a62409a53dbfff15ea95'
required.update({va: row for va, row in accepted(shadow_warm).items()
                 if va in old or '@std@@' not in row['name']})
fit_warm = gfx / 'target/work/proof/history/codex35/bind_159.json'
assert hashlib.sha256(fit_warm.read_bytes()).hexdigest() == 'aaf049b5161f2cc2ce7fbded67cecd649d58b8a9397389ad9679b1a34c394939'
required.update({va: row for va, row in accepted(fit_warm).items()
                 if va in old or '@std@@' not in row['name']})
wavelet_warm = gfx / 'target/work/proof/history/codex35/bind_167.json'
assert hashlib.sha256(wavelet_warm.read_bytes()).hexdigest() == 'fef65896c1cb0745f87c1dc6bec9dc5b7bbc992aa40dc62577453bc1d25fc552'
required.update({va: row for va, row in accepted(wavelet_warm).items()
                 if va in old or '@std@@' not in row['name']})
wavelet_level = gfx / 'target/work/proof/history/codex35/bind_177.json'
assert hashlib.sha256(wavelet_level.read_bytes()).hexdigest() == '5eee89605cafed870628a94300da896cd485ca39668ee97149f7b0d3b39fc0d4'
required.update({va: row for va, row in accepted(wavelet_level).items()
                 if va in old or '@std@@' not in row['name']})
image_header = gfx / 'target/work/proof/history/codex35/bind_178.json'
assert hashlib.sha256(image_header.read_bytes()).hexdigest() == '331d37f38685ff4958b06305e2dfbebb2a956d5f15ff2e2bb84e13f70fd662db'
required.update({va: row for va, row in accepted(image_header).items()
                 if va in old or '@std@@' not in row['name']})
mipmap_count = gfx / 'target/work/proof/history/codex35/bind_185.json'
assert hashlib.sha256(mipmap_count.read_bytes()).hexdigest() == '2c9874363ff05288c9d9f8457beb834fd26a312b3f73d07eee33e840366f05b8'
required.update({va: row for va, row in accepted(mipmap_count).items()
                 if va in old or '@std@@' not in row['name']})
small_depth = gfx / 'target/work/proof/history/codex35/bind_191.json'
assert hashlib.sha256(small_depth.read_bytes()).hexdigest() == '0cbad357c8caf2c09bf76f581ae26c95faeaaf681528be4307c12444399ae811'
required.update({va: row for va, row in accepted(small_depth).items()
                 if va in old or '@std@@' not in row['name']})
framebuffer = gfx / 'target/work/proof/history/codex35/bind_202.json'
assert hashlib.sha256(framebuffer.read_bytes()).hexdigest() == 'c002898ed9d2087b325cdceb06d3188fe58208d21cd79db8441a4c3f66f0e35c'
required.update({va: row for va, row in accepted(framebuffer).items()
                 if va in old or '@std@@' not in row['name']})
cell_link = gfx / 'target/work/proof/history/codex35/bind_216.json'
assert hashlib.sha256(cell_link.read_bytes()).hexdigest() == '467f3dc6731e2a2e44bebeba797e3c00d21c42371308d7f1c858530661a4f5f7'
required.update({va: row for va, row in accepted(cell_link).items()
                 if va in old or '@std@@' not in row['name']})
bounds_dispatch = gfx / 'target/work/proof/history/codex35/bind_222.json'
assert hashlib.sha256(bounds_dispatch.read_bytes()).hexdigest() == 'ff9229b68726bcb9395d4a46910019b84f677b4e66d801d27792bbe3d3d7751a'
required.update({va: row for va, row in accepted(bounds_dispatch).items()
                 if va in old or '@std@@' not in row['name']})
shader_rules = gfx / 'target/work/proof/history/codex35/bind_244.json'
assert hashlib.sha256(shader_rules.read_bytes()).hexdigest() == '303e07c68966570692f4b3e4ff6205dd0ab166feb959f3ce5508b77cb6960918'
required.update({va: row for va, row in accepted(shader_rules).items()
                 if va in old or '@std@@' not in row['name']})
fog_helpers = gfx / 'target/work/proof/history/codex35/bind_250.json'
assert hashlib.sha256(fog_helpers.read_bytes()).hexdigest() == '5419c79dd99a5ea903caaa1e15c8c2bf253a04087377af873fe68c0f7899b5c6'
required.update({va: row for va, row in accepted(fog_helpers).items()
                 if va in old or '@std@@' not in row['name']})
fog_state = gfx / 'target/work/proof/history/codex35/bind_255.json'
assert hashlib.sha256(fog_state.read_bytes()).hexdigest() == '9b0f40b89fc4cc7c3403b4f71f0df488ed68d8fdb74f513523d930947e01517c'
required.update({va: row for va, row in accepted(fog_state).items()
                 if va in old or '@std@@' not in row['name']})
mark_clip = gfx / 'target/work/proof/history/codex35/bind_269.json'
assert hashlib.sha256(mark_clip.read_bytes()).hexdigest() == 'a88f9dd8fd3f9a1e914ce5de990e88c34bebb8019f4a6798d76851e87b845b0e'
required.update({va: row for va, row in accepted(mark_clip).items()
                 if va in old or '@std@@' not in row['name']})
glow = gfx / 'target/work/proof/history/codex35/bind_289.json'
assert hashlib.sha256(glow.read_bytes()).hexdigest() == '2d898cef3363e303fef2a5ce3cdfecd4002b429fb2671e9f071b3f418ead659d'
required.update({va: row for va, row in accepted(glow).items()
                 if va in old or '@std@@' not in row['name']})
draw_state = gfx / 'target/work/proof/history/codex35/bind_293.json'
assert hashlib.sha256(draw_state.read_bytes()).hexdigest() == '1fb20f50ac075d846fdd0a2963744c9a8e4320f30e1a637b7f2b1a1a59fbdf49'
required.update({va: row for va, row in accepted(draw_state).items()
                 if va in old or '@std@@' not in row['name']})
world_sun = gfx / 'target/work/proof/world_sun_warm_bind.json'
assert hashlib.sha256(world_sun.read_bytes()).hexdigest() == '32d97d8db04eb2a5dfa42267a4873239047592b25810fbe905c95ce1eb480403'
required.update({va: row for va, row in accepted(world_sun).items()
                 if va in old or '@std@@' not in row['name']})
light_history = gfx / 'target/work/proof/light_history_warm_bind.json'
assert hashlib.sha256(light_history.read_bytes()).hexdigest() == '08c9bfa93c8e99a3f3ee3db1e0820953a85b1256c380d00583ef717fe3cdaf42'
required.update({va: row for va, row in accepted(light_history).items()
                 if va in old or '@std@@' not in row['name']})
api_graph = gfx / 'target/work/proof/api_graph_warm_bind.json'
assert hashlib.sha256(api_graph.read_bytes()).hexdigest() == '69a9b7c7171f31d0390ef61b929abe0a7849fbedc4a54bb9a8787d4bb39c0c9d'
required.update({va: row for va, row in accepted(api_graph).items()
                 if va in old or '@std@@' not in row['name']})
cubemap = gfx / 'target/work/proof/cubemap_warm_bind.json'
assert hashlib.sha256(cubemap.read_bytes()).hexdigest() == '7896c2b0d6673e0221d3ceacacc77ed9ca2f467929320b2d9f7fcf2da8a658e1'
required.update({va: row for va, row in accepted(cubemap).items()
                 if va in old or '@std@@' not in row['name']})
late_post = gfx / 'target/work/proof/late_post_warm_bind.json'
assert hashlib.sha256(late_post.read_bytes()).hexdigest() == '22902b3b57dc9c2d9bcf89fd041a9f43c4874016c58e4aa10c59ec1f4aef3d30'
required.update({va: row for va, row in accepted(late_post).items()
                 if va in old or '@std@@' not in row['name']})
scene_dependencies = gfx / 'target/work/proof/scene_dependencies_warm_bind.json'
assert hashlib.sha256(scene_dependencies.read_bytes()).hexdigest() == '1ae246e5a2e30b0f8f89ce6b1adb7d667d558bd14639043f71cab1be4be23185'
required.update({va: row for va, row in accepted(scene_dependencies).items()
                 if va in old or '@std@@' not in row['name']})
scene_modes = gfx / 'target/work/proof/scene_modes_warm_bind.json'
assert hashlib.sha256(scene_modes.read_bytes()).hexdigest() == 'c037a3baa711ea7b2f3402679a4a4f3fe14cfc4e5b759fb14d458cc67a3bdeab'
required.update({va: row for va, row in accepted(scene_modes).items()
                 if va in old or '@std@@' not in row['name']})
normal_pipeline = gfx / 'target/work/proof/normal_pipeline_warm_bind.json'
assert hashlib.sha256(normal_pipeline.read_bytes()).hexdigest() == 'f9119c24b3ab3249dfaf9912c36091c885cb701fbcdb5b100df0ecc214f4dcb6'
required.update({va: row for va, row in accepted(normal_pipeline).items()
                 if va in old or '@std@@' not in row['name']})
api59_graph = gfx / 'target/work/proof/api59_graph_warm_bind.json'
assert hashlib.sha256(api59_graph.read_bytes()).hexdigest() == 'b4230ffb38e0c233d8313bec93987af5d9d83a9fc28fa8512026a0a403c49152'
required.update({va: row for va, row in accepted(api59_graph).items()
                 if va in old or '@std@@' not in row['name']})
callback_match_1 = gfx / 'target/work/proof/callback_match_1_warm_bind.json'
assert hashlib.sha256(callback_match_1.read_bytes()).hexdigest() == 'ead94b4984133ef52ea12f5354e5fcbae6c37a6de63e1de1d9861a9a87bd8b16'
required.update({va: row for va, row in accepted(callback_match_1).items()
                 if va in old or '@std@@' not in row['name']})
clear_log = gfx / 'target/work/proof/clear_log_warm_bind.json'
assert hashlib.sha256(clear_log.read_bytes()).hexdigest() == '7bef6675fc2343bcde64b6a0f6e6975b6d03aef8d35aa7eee9fbf423935e35f8'
required.update({va: row for va, row in accepted(clear_log).items()
                 if va in old or '@std@@' not in row['name']})
api_short_callbacks = gfx / 'target/work/proof/api_short_callbacks_warm_bind.json'
assert hashlib.sha256(api_short_callbacks.read_bytes()).hexdigest() == '4160b4d788f441f843755d5cdc2057a3400ccf80927816d632aa31e770bf8ed5'
required.update({va: row for va, row in accepted(api_short_callbacks).items()
                 if va in old or '@std@@' not in row['name']})
specular_closure = gfx / 'target/work/proof/specular_closure_warm_bind.json'
assert hashlib.sha256(specular_closure.read_bytes()).hexdigest() == '28c9f6f07fc93b4d20a43c24524fb3758270517d8447024a96023d96456a3801'
required.update({va: row for va, row in accepted(specular_closure).items()
                 if va in old or '@std@@' not in row['name']})
jpeg_load = gfx / 'target/work/proof/jpeg_load_20261103_warm_bind.json'
assert hashlib.sha256(jpeg_load.read_bytes()).hexdigest() == '1f42a8cfc114e5b571392f021670f670ca4a3828a64977a3f840e47e3c893ef1'
required.update({va: row for va, row in accepted(jpeg_load).items()
                 if va in old or '@std@@' not in row['name']})
jpeg_compress_abi = gfx / 'target/work/proof/jpeg_compress_abi_warm_bind.json'
assert hashlib.sha256(jpeg_compress_abi.read_bytes()).hexdigest() == 'e6dd295f4445f442f0d498a86c5b6cec8a5bfef6dd9d4e35276bf7e1f46e4c22'
required.update({va: row for va, row in accepted(jpeg_compress_abi).items()
                 if va in old or '@std@@' not in row['name']})
jpeg_save = gfx / 'target/work/proof/jpeg_save_20261103_warm_bind.json'
assert hashlib.sha256(jpeg_save.read_bytes()).hexdigest() == '9fe76c04ed8c732c218e8ce2b4a83a4e29f2fda6d3aa10447faa81f5e941aad1'
required.update({va: row for va, row in accepted(jpeg_save).items()
                 if va in old or '@std@@' not in row['name']})
jpeg_callbacks = gfx / 'target/work/proof/jpeg_callbacks_warm_bind.json'
assert hashlib.sha256(jpeg_callbacks.read_bytes()).hexdigest() == '9115fefabad18e2782de57b8c845c5597fd24eafeb03a9d1e47995005fc05cc6'
required.update({va: row for va, row in accepted(jpeg_callbacks).items()
                 if va in old or '@std@@' not in row['name']})
screenshot_filename = gfx / 'target/work/proof/screenshot_filename_20261103_warm_bind.json'
assert hashlib.sha256(screenshot_filename.read_bytes()).hexdigest() == '16953b3b6b3f7fb81c1ff35d221c672cb13a3461935e1700821c68146ab1e9dc'
required.update({va: row for va, row in accepted(screenshot_filename).items()
                 if va in old or '@std@@' not in row['name']})
api_ambiguous = gfx / 'target/work/proof/api_ambiguous_20261103_warm_bind.json'
assert hashlib.sha256(api_ambiguous.read_bytes()).hexdigest() == '705cb6c46c05ff546c25f6195df82564583d817d584f5c10dffccdee6a129a96'
required.update({va: row for va, row in accepted(api_ambiguous).items()
                 if va in old or '@std@@' not in row['name']})
index_allocator = gfx / 'target/work/proof/index_allocator_20261103_warm_bind.json'
assert hashlib.sha256(index_allocator.read_bytes()).hexdigest() == 'e283343e0249a689c0fead8d60a84440ca14a3c433a247e65b2c69611687e7b2'
required.update({va: row for va, row in accepted(index_allocator).items()
                 if va in old or '@std@@' not in row['name']})
particle_cloud = gfx / 'target/work/proof/particle_cloud_20261103_warm_bind.json'
assert hashlib.sha256(particle_cloud.read_bytes()).hexdigest() == '54b43fd76076e8df08fe4b211dd1233d1756d6c2a2a43d3585f160d37bd1b971'
required.update({va: row for va, row in accepted(particle_cloud).items()
                 if va in old or '@std@@' not in row['name']})
callee_placement = gfx / 'target/work/proof/callee_placement_20261103_warm_bind.json'
assert hashlib.sha256(callee_placement.read_bytes()).hexdigest() == 'e3ca7b5a5ec4e8dda6b4006923ad6860ac6f1cac5dcffe415c01c0399d7daf30'
required.update({va: row for va, row in accepted(callee_placement).items()
                 if va in old or '@std@@' not in row['name']})
neighbor_placement = gfx / 'target/work/proof/neighbor_placement_20261103_warm_bind.json'
assert hashlib.sha256(neighbor_placement.read_bytes()).hexdigest() == 'c26a5050b269fe08be26c04cd7f358a3e775ac12d7b5ad9929fd9d2f11866305'
required.update({va: row for va, row in accepted(neighbor_placement).items()
                 if va in old or '@std@@' not in row['name']})
window_settings = gfx / 'target/work/proof/window_settings_20261103_warm_bind.json'
assert hashlib.sha256(window_settings.read_bytes()).hexdigest() == 'caebf75db26b6154b0e0d247244c0909b585ee1b4b5a685119098916560517f8'
required.update({va: row for va, row in accepted(window_settings).items()
                 if va in old or '@std@@' not in row['name']})
transparency = gfx / 'target/work/proof/transparency_20261103_warm_bind.json'
assert hashlib.sha256(transparency.read_bytes()).hexdigest() == '555aec80731a65fffe52942151077142a680c641bb8f951f8b95f16435e8ec0a'
required.update(accepted(transparency))
short_search = gfx / 'target/work/proof/short_search_20261103_warm_bind.json'
assert hashlib.sha256(short_search.read_bytes()).hexdigest() == 'b7b0895c2c22dd9202c2c02051fcb60fc039671742a1056a83425b8fb3ae3b12'
required.update(accepted(short_search))
lost = [hex(va) for va, row in old.items() if va not in new or new[va]['n'] != row['n']]
checkpoint_lost = [hex(va) for va, row in required.items()
                   if va not in new or new[va]['n'] != row['n']]
gains = [dict(target=hex(va), bytes=row['n'], name=row['name'], object=row['obj'])
         for va, row in sorted(new.items()) if va not in old]
inventory = json.loads((gfx / 'target/work/proof/retail/functions_gfx10.json').read_text())['functions']
total = sum(row['size'] for row in inventory if not row['thunk'] and
            (0x10001000 <= int(row['addr'], 16) < 0x10041db0 or
             0x10057990 <= int(row['addr'], 16) < 0x10062200))
jpeg_objects = {Path(line.split()[0]).stem + '.obj'
                for line in (gfx / 'target/work/src/tus.txt').read_text().splitlines()
                if line.startswith('jpeg-6b/')}
library = {va: row for va, row in new.items()
           if Path(row['obj'].replace('\\', '/')).name in jpeg_objects or
           (va not in old and '@std@@' in row['name'])}
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
    (0x1001a030, 164, 140, 'shader argument dispatch'),
    (0x1001a0e0, 128, 104, 'default shader argument dispatch'),
    (0x1000d940, 1070, 1015, 'image list command'),
    (0x100115f0, 208, 190, 'window aspect settings'),
]:
    if va in scored:
        assert scored[va]['n'] == extent, label + ' extent changed'
        embedded_table_bytes += extent - code
done = sum(row['n'] for row in scored.values()) - embedded_table_bytes
print(json.dumps(dict(functions=len(scored), bytes=done, total=total, percent=100*done/total,
                      baseline_lost=lost, gains=gains,
                      checkpoint_lost=checkpoint_lost,
                      excluded_new_library_functions=len(library),
                      dependency_objects=sorted(jpeg_objects),
                      excluded_new_embedded_table_bytes=embedded_table_bytes,
                      excluded_new_library_bytes=sum(row['n'] for row in library.values())), indent=2))
assert not lost, ('baseline loss', lost)
assert not checkpoint_lost, ('checkpoint loss', checkpoint_lost)
build = candidate.parent
assert (build / 'gfx.dll').stat().st_mtime <= (build / 'cmp.json').stat().st_mtime <= candidate.stat().st_mtime
