"""Retain every accepted checkpoint address/extent, including library bindings."""
import hashlib
import json
from pathlib import Path
import sys

baseline = Path(__file__).resolve().parents[1] / 'proof/baseline/bind.json'
assert hashlib.sha256(baseline.read_bytes()).hexdigest() == 'fafcdfc2b636dd5c10c20173b62bf928279f21a8675bb0a441a3f8a6dc096891'


def accepted(path):
    rows = {}
    for row in json.loads(path.read_text()).values():
        if row.get('why') == []:
            assert row['t'] not in rows or rows[row['t']] == row['n']
            rows[row['t']] = row['n']
    return rows


required = accepted(baseline)
latest = Path(__file__).resolve().parents[1] / 'proof/material_warm_bind.json'
assert hashlib.sha256(latest.read_bytes()).hexdigest() == '2f36afb33bcc19bb21c2c27997efe8e863b6927278a2e3d66c1e646f4ef984f3'
required.update(accepted(latest))
sampler = Path(__file__).resolve().parents[1] / 'proof/sampler_warm_bind.json'
assert hashlib.sha256(sampler.read_bytes()).hexdigest() == 'a59a739c8ba52db372b55cca9d4c45ff9dd30c314960a3d45d2ff071e20ca243'
required.update(accepted(sampler))
literal = Path(__file__).resolve().parents[1] / 'proof/literal_warm_bind.json'
assert hashlib.sha256(literal.read_bytes()).hexdigest() == 'fdebbd6e2922487666d813420ac2902545f98cad5183203550d81add10691da9'
required.update(accepted(literal))
shader = Path(__file__).resolve().parents[1] / 'proof/shader_warm_bind.json'
assert hashlib.sha256(shader.read_bytes()).hexdigest() == 'cca77137401f8d861f317189b10280d7a1f3627331c14cb1718653776f46df45'
required.update(accepted(shader))
image = Path(__file__).resolve().parents[1] / 'proof/image_warm_bind.json'
assert hashlib.sha256(image.read_bytes()).hexdigest() == '26febf15d31ddd34cee5a34e3be12f103e5c884c756750cdab26dfde28f76f68'
required.update(accepted(image))
imagelist = Path(__file__).resolve().parents[1] / 'proof/imagelist_warm_bind.json'
assert hashlib.sha256(imagelist.read_bytes()).hexdigest() == 'c99202e4f4f996e54b70bc5af1757cd671b1cd7d4073e80496c6ad186a97ac49'
required.update(accepted(imagelist))
image_body = Path(__file__).resolve().parents[1] / 'proof/image_body_warm_bind.json'
assert hashlib.sha256(image_body.read_bytes()).hexdigest() == '720f45d4464a8289eb412b08a2bcbb4914a7c1a7b83dda7f03dd14837633e606'
required.update(accepted(image_body))
state_value = Path(__file__).resolve().parents[1] / 'proof/state_value_warm_bind.json'
assert hashlib.sha256(state_value.read_bytes()).hexdigest() == '053e0c8fc4c8b2f945256308f8aad12bd1ec52ab49e22a8032983de9f8159970'
required.update(accepted(state_value))
texture = Path(__file__).resolve().parents[1] / 'proof/texture_warm_bind.json'
assert hashlib.sha256(texture.read_bytes()).hexdigest() == 'bb80e4efc935ec5bdf1a19c65524d8cdeafc7b8fb45413ccadf92294d0c47e53'
required.update(accepted(texture))
texture_list = Path(__file__).resolve().parents[1] / 'proof/texture_list_warm_bind.json'
assert hashlib.sha256(texture_list.read_bytes()).hexdigest() == '2ab297f85f6f08f9f120f30e18d6acda2762f02eda6536b8ce2953929f7afd6b'
required.update(accepted(texture_list))
texture_function = Path(__file__).resolve().parents[1] / 'proof/texture_function_warm_bind.json'
assert hashlib.sha256(texture_function.read_bytes()).hexdigest() == '22ebf0225339c818199e6f5eb9d94cf0108f33c8a819505d24564bd956a54717'
required.update(accepted(texture_function))
world_sun = Path(__file__).resolve().parents[1] / 'proof/world_sun_warm_bind.json'
assert hashlib.sha256(world_sun.read_bytes()).hexdigest() == '32d97d8db04eb2a5dfa42267a4873239047592b25810fbe905c95ce1eb480403'
required.update(accepted(world_sun))
light_history = Path(__file__).resolve().parents[1] / 'proof/light_history_warm_bind.json'
assert hashlib.sha256(light_history.read_bytes()).hexdigest() == '08c9bfa93c8e99a3f3ee3db1e0820953a85b1256c380d00583ef717fe3cdaf42'
required.update(accepted(light_history))
api_graph = Path(__file__).resolve().parents[1] / 'proof/api_graph_warm_bind.json'
assert hashlib.sha256(api_graph.read_bytes()).hexdigest() == '69a9b7c7171f31d0390ef61b929abe0a7849fbedc4a54bb9a8787d4bb39c0c9d'
required.update(accepted(api_graph))
cubemap = Path(__file__).resolve().parents[1] / 'proof/cubemap_warm_bind.json'
assert hashlib.sha256(cubemap.read_bytes()).hexdigest() == '7896c2b0d6673e0221d3ceacacc77ed9ca2f467929320b2d9f7fcf2da8a658e1'
required.update(accepted(cubemap))
sdk = Path(__file__).resolve().parents[1] / 'proof/sdk_warm_bind.json'
assert hashlib.sha256(sdk.read_bytes()).hexdigest() == 'f0f99f0338cc61595ded8a1141023b5b8fc2731a305235e33d16ae385ae395aa'
required.update(accepted(sdk))
material_pass = Path(__file__).resolve().parents[1] / 'proof/material_pass_warm_bind.json'
assert hashlib.sha256(material_pass.read_bytes()).hexdigest() == '65be844fa18ed5f18e3f3c8b6bf83f375d5bb0ff6595c74db38013f538304a22'
required.update(accepted(material_pass))
procedural = Path(__file__).resolve().parents[1] / 'proof/procedural_warm_bind.json'
assert hashlib.sha256(procedural.read_bytes()).hexdigest() == '3ef41496499a8d60ec600df6e883706a4d9ab2f7588e0d24ef21f7779977e8f8'
required.update(accepted(procedural))
backend_structure = Path(__file__).resolve().parents[1] / 'proof/backend_structure_warm_bind.json'
assert hashlib.sha256(backend_structure.read_bytes()).hexdigest() == '59224cf7f86c0af591615658fb3d4d553504cb081608484cf485e71870b4c2fc'
required.update(accepted(backend_structure))
window_structure = Path(__file__).resolve().parents[1] / 'proof/window_structure_warm_bind.json'
assert hashlib.sha256(window_structure.read_bytes()).hexdigest() == '567583dda0afdfff997c09131246309a2e78a3a9807b936916d439ef0fff0279'
required.update(accepted(window_structure))
device_structure = Path(__file__).resolve().parents[1] / 'proof/device_structure_warm_bind.json'
assert hashlib.sha256(device_structure.read_bytes()).hexdigest() == '0f78e9c63c923907374118d2a524d8b451dc798a913139f6c64024c48074f226'
required.update(accepted(device_structure))
resources_structure = Path(__file__).resolve().parents[1] / 'proof/resources_structure_warm_bind.json'
assert hashlib.sha256(resources_structure.read_bytes()).hexdigest() == '65bb5b965a87fbe45731f053f0372d4e261e263490a1b4241ba7ae722a5fa65a'
required.update(accepted(resources_structure))
video_structure = Path(__file__).resolve().parents[1] / 'proof/video_structure_warm_bind.json'
assert hashlib.sha256(video_structure.read_bytes()).hexdigest() == '86340dc1aef2a86d11a961513ae766bcb7c29412d01f367ac12be711cd93fb85'
required.update(accepted(video_structure))
shader_preload = Path(__file__).resolve().parents[1] / 'proof/shader_preload_warm_bind.json'
assert hashlib.sha256(shader_preload.read_bytes()).hexdigest() == 'b283ac654f0dcc4a0e937bcde19d5fa27134fcf49f4bd8cf188cdbd39ca7173d'
required.update(accepted(shader_preload))
material_commands = Path(__file__).resolve().parents[1] / 'proof/material_commands_warm_bind.json'
assert hashlib.sha256(material_commands.read_bytes()).hexdigest() == 'd6649d7675c16f03ba9327ae676f5adda764e659165dc15b5a033867b6f3ad32'
required.update(accepted(material_commands))
sun_commands = Path(__file__).resolve().parents[1] / 'proof/sun_commands_warm_bind.json'
assert hashlib.sha256(sun_commands.read_bytes()).hexdigest() == '4a66a429acde5d20e1236b9c15b24bc07ff08ef6ac4c8b388dd574ce2470062f'
required.update(accepted(sun_commands))
jpeg_commands = Path(__file__).resolve().parents[1] / 'proof/jpeg_commands_warm_bind.json'
assert hashlib.sha256(jpeg_commands.read_bytes()).hexdigest() == '8ad857edd6e4b2ea8b17572f753266e63e3ef2cfa22ced0f2435d17c80a7640e'
required.update(accepted(jpeg_commands))
surface_begin = Path(__file__).resolve().parents[1] / 'proof/surface_begin_warm_bind.json'
assert hashlib.sha256(surface_begin.read_bytes()).hexdigest() == 'b4b8d1aead89362ced24b41926efe4414bd6cb9ef07a0ef6858155af1ded3053'
required.update(accepted(surface_begin))
buffer_upload = Path(__file__).resolve().parents[1] / 'proof/buffer_upload_warm_bind.json'
assert hashlib.sha256(buffer_upload.read_bytes()).hexdigest() == '070862c695ad35a730931b128c810792db14e0fa4744034f04eded678fefc1da'
required.update(accepted(buffer_upload))
light_grid_helpers = Path(__file__).resolve().parents[1] / 'proof/light_grid_helpers_warm_bind.json'
assert hashlib.sha256(light_grid_helpers.read_bytes()).hexdigest() == '1f5cf92b1838cf658ae2ed915d454fa51afa304b2addae24c1d443903a733853'
required.update(accepted(light_grid_helpers))
renderer_shutdown = Path(__file__).resolve().parents[1] / 'proof/renderer_shutdown_warm_bind.json'
assert hashlib.sha256(renderer_shutdown.read_bytes()).hexdigest() == 'a98a9a13870183c04f15103e091a34f3aaec1821e16b72fcb0a915bfd60558ea'
required.update(accepted(renderer_shutdown))
frame_start = Path(__file__).resolve().parents[1] / 'proof/frame_start_warm_bind.json'
assert hashlib.sha256(frame_start.read_bytes()).hexdigest() == '369e04bcb8252b756b7112c163100a112bd398e21c33ac97ffc00811fa6494d1'
required.update(accepted(frame_start))
image_residency = Path(__file__).resolve().parents[1] / 'proof/image_residency_warm_bind.json'
assert hashlib.sha256(image_residency.read_bytes()).hexdigest() == '3a19cc20bd06656bbc5b30274f423feda712364f22fda7155c8ff58122f67c59'
required.update(accepted(image_residency))
api_raw = Path(__file__).resolve().parents[1] / 'proof/api_raw_warm_bind.json'
assert hashlib.sha256(api_raw.read_bytes()).hexdigest() == 'fa04bc1db1ce12cef75649510023f0c9c9fcbff140b320193a7a55642e3bee78'
required.update(accepted(api_raw))
cache_publication = Path(__file__).resolve().parents[1] / 'proof/cache_publication_warm_bind.json'
assert hashlib.sha256(cache_publication.read_bytes()).hexdigest() == '018de1c200dbf960742a30364570ec17fdac3ee5735720ea8272b956c3bba369'
required.update(accepted(cache_publication))
ref_entity = Path(__file__).resolve().parents[1] / 'proof/ref_entity_warm_bind.json'
assert hashlib.sha256(ref_entity.read_bytes()).hexdigest() == '60cfe44424b63ca3683a2b87ad8195e7c50c2b907398c0fd771c0427279d3fd1'
required.update(accepted(ref_entity))
tess_surfaces = Path(__file__).resolve().parents[1] / 'proof/tess_surfaces_warm_bind.json'
assert hashlib.sha256(tess_surfaces.read_bytes()).hexdigest() == '95130806722f50fdb12abdeba8b8ed1e6151e66e711e56decead6fc590135fcf'
required.update(accepted(tess_surfaces))
late_post = Path(__file__).resolve().parents[1] / 'proof/late_post_warm_bind.json'
assert hashlib.sha256(late_post.read_bytes()).hexdigest() == '22902b3b57dc9c2d9bcf89fd041a9f43c4874016c58e4aa10c59ec1f4aef3d30'
required.update(accepted(late_post))
scene_dependencies = Path(__file__).resolve().parents[1] / 'proof/scene_dependencies_warm_bind.json'
assert hashlib.sha256(scene_dependencies.read_bytes()).hexdigest() == '1ae246e5a2e30b0f8f89ce6b1adb7d667d558bd14639043f71cab1be4be23185'
required.update(accepted(scene_dependencies))
scene_modes = Path(__file__).resolve().parents[1] / 'proof/scene_modes_warm_bind.json'
assert hashlib.sha256(scene_modes.read_bytes()).hexdigest() == 'c037a3baa711ea7b2f3402679a4a4f3fe14cfc4e5b759fb14d458cc67a3bdeab'
required.update(accepted(scene_modes))
normal_pipeline = Path(__file__).resolve().parents[1] / 'proof/normal_pipeline_warm_bind.json'
assert hashlib.sha256(normal_pipeline.read_bytes()).hexdigest() == 'f9119c24b3ab3249dfaf9912c36091c885cb701fbcdb5b100df0ecc214f4dcb6'
required.update(accepted(normal_pipeline))
api59_graph = Path(__file__).resolve().parents[1] / 'proof/api59_graph_warm_bind.json'
assert hashlib.sha256(api59_graph.read_bytes()).hexdigest() == 'b4230ffb38e0c233d8313bec93987af5d9d83a9fc28fa8512026a0a403c49152'
required.update(accepted(api59_graph))
callback_match_1 = Path(__file__).resolve().parents[1] / 'proof/callback_match_1_warm_bind.json'
assert hashlib.sha256(callback_match_1.read_bytes()).hexdigest() == 'ead94b4984133ef52ea12f5354e5fcbae6c37a6de63e1de1d9861a9a87bd8b16'
required.update(accepted(callback_match_1))
current = accepted(Path(sys.argv[1]))
lost = {va: size for va, size in required.items() if current.get(va) != size}
assert not lost, ('checkpoint regression', lost)
print('PASS: all', len(required), 'checkpoint source/library address-extents retained')
