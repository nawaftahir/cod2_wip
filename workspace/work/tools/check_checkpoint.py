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
clear_log = Path(__file__).resolve().parents[1] / 'proof/clear_log_warm_bind.json'
assert hashlib.sha256(clear_log.read_bytes()).hexdigest() == '7bef6675fc2343bcde64b6a0f6e6975b6d03aef8d35aa7eee9fbf423935e35f8'
required.update(accepted(clear_log))
api_short_callbacks = Path(__file__).resolve().parents[1] / 'proof/api_short_callbacks_warm_bind.json'
assert hashlib.sha256(api_short_callbacks.read_bytes()).hexdigest() == '4160b4d788f441f843755d5cdc2057a3400ccf80927816d632aa31e770bf8ed5'
required.update(accepted(api_short_callbacks))
specular_closure = Path(__file__).resolve().parents[1] / 'proof/specular_closure_warm_bind.json'
assert hashlib.sha256(specular_closure.read_bytes()).hexdigest() == '28c9f6f07fc93b4d20a43c24524fb3758270517d8447024a96023d96456a3801'
required.update(accepted(specular_closure))
jpeg_load = Path(__file__).resolve().parents[1] / 'proof/jpeg_load_20261103_warm_bind.json'
assert hashlib.sha256(jpeg_load.read_bytes()).hexdigest() == '1f42a8cfc114e5b571392f021670f670ca4a3828a64977a3f840e47e3c893ef1'
required.update(accepted(jpeg_load))
jpeg_compress_abi = Path(__file__).resolve().parents[1] / 'proof/jpeg_compress_abi_warm_bind.json'
assert hashlib.sha256(jpeg_compress_abi.read_bytes()).hexdigest() == 'e6dd295f4445f442f0d498a86c5b6cec8a5bfef6dd9d4e35276bf7e1f46e4c22'
required.update(accepted(jpeg_compress_abi))
jpeg_save = Path(__file__).resolve().parents[1] / 'proof/jpeg_save_20261103_warm_bind.json'
assert hashlib.sha256(jpeg_save.read_bytes()).hexdigest() == '9fe76c04ed8c732c218e8ce2b4a83a4e29f2fda6d3aa10447faa81f5e941aad1'
required.update(accepted(jpeg_save))
jpeg_callbacks = Path(__file__).resolve().parents[1] / 'proof/jpeg_callbacks_warm_bind.json'
assert hashlib.sha256(jpeg_callbacks.read_bytes()).hexdigest() == '9115fefabad18e2782de57b8c845c5597fd24eafeb03a9d1e47995005fc05cc6'
required.update(accepted(jpeg_callbacks))
screenshot_filename = Path(__file__).resolve().parents[1] / 'proof/screenshot_filename_20261103_warm_bind.json'
assert hashlib.sha256(screenshot_filename.read_bytes()).hexdigest() == '16953b3b6b3f7fb81c1ff35d221c672cb13a3461935e1700821c68146ab1e9dc'
required.update(accepted(screenshot_filename))
api_ambiguous = Path(__file__).resolve().parents[1] / 'proof/api_ambiguous_20261103_warm_bind.json'
assert hashlib.sha256(api_ambiguous.read_bytes()).hexdigest() == '705cb6c46c05ff546c25f6195df82564583d817d584f5c10dffccdee6a129a96'
required.update(accepted(api_ambiguous))
index_allocator = Path(__file__).resolve().parents[1] / 'proof/index_allocator_20261103_warm_bind.json'
assert hashlib.sha256(index_allocator.read_bytes()).hexdigest() == 'e283343e0249a689c0fead8d60a84440ca14a3c433a247e65b2c69611687e7b2'
required.update(accepted(index_allocator))
particle_cloud = Path(__file__).resolve().parents[1] / 'proof/particle_cloud_20261103_warm_bind.json'
assert hashlib.sha256(particle_cloud.read_bytes()).hexdigest() == '54b43fd76076e8df08fe4b211dd1233d1756d6c2a2a43d3585f160d37bd1b971'
required.update(accepted(particle_cloud))
callee_placement = Path(__file__).resolve().parents[1] / 'proof/callee_placement_20261103_warm_bind.json'
assert hashlib.sha256(callee_placement.read_bytes()).hexdigest() == 'e3ca7b5a5ec4e8dda6b4006923ad6860ac6f1cac5dcffe415c01c0399d7daf30'
required.update(accepted(callee_placement))
neighbor_placement = Path(__file__).resolve().parents[1] / 'proof/neighbor_placement_20261103_warm_bind.json'
assert hashlib.sha256(neighbor_placement.read_bytes()).hexdigest() == 'c26a5050b269fe08be26c04cd7f358a3e775ac12d7b5ad9929fd9d2f11866305'
required.update(accepted(neighbor_placement))
window_settings = Path(__file__).resolve().parents[1] / 'proof/window_settings_20261103_warm_bind.json'
assert hashlib.sha256(window_settings.read_bytes()).hexdigest() == 'caebf75db26b6154b0e0d247244c0909b585ee1b4b5a685119098916560517f8'
required.update(accepted(window_settings))
transparency = Path(__file__).resolve().parents[1] / 'proof/transparency_20261103_warm_bind.json'
assert hashlib.sha256(transparency.read_bytes()).hexdigest() == '555aec80731a65fffe52942151077142a680c641bb8f951f8b95f16435e8ec0a'
required.update(accepted(transparency))
short_search = Path(__file__).resolve().parents[1] / 'proof/short_search_20261103_warm_bind.json'
assert hashlib.sha256(short_search.read_bytes()).hexdigest() == 'b7b0895c2c22dd9202c2c02051fcb60fc039671742a1056a83425b8fb3ae3b12'
required.update(accepted(short_search))
vertex_decl = Path(__file__).resolve().parents[1] / 'proof/vertex_decl_20261104_warm_bind.json'
assert hashlib.sha256(vertex_decl.read_bytes()).hexdigest() == 'a3d92804c7d9039f6f2e51e49790a4c724006cfedfa8eedbd5eaccc1ed0bb023'
required.update(accepted(vertex_decl))
upsample = Path(__file__).resolve().parents[1] / 'proof/upsample_20261104_warm_bind.json'
assert hashlib.sha256(upsample.read_bytes()).hexdigest() == 'f784f76cff831bd1485691f85326d0239cfdfdbd2ee66a9230a90938b377b253'
required.update(accepted(upsample))
grid_history = Path(__file__).resolve().parents[1] / 'proof/grid_history_20261104_warm_bind.json'
assert hashlib.sha256(grid_history.read_bytes()).hexdigest() == '45768b370899fa0d846812c284228aaa5bd2f4b99df028eb07bf6fd08db7180f'
required.update(accepted(grid_history))
static_lighting = Path(__file__).resolve().parents[1] / 'proof/static_model_lighting_20261104_warm_bind.json'
assert hashlib.sha256(static_lighting.read_bytes()).hexdigest() == '5f7991cad87a91874587c0ef64189a8ae17203af0d7f1192a93cdf2d9e8c8527'
required.update(accepted(static_lighting))
gamma_capture = Path(__file__).resolve().parents[1] / 'proof/gamma_capture_20261104_warm_bind.json'
assert hashlib.sha256(gamma_capture.read_bytes()).hexdigest() == 'f06ddf988ea07cb30fd2e6ccc11592e7b722ba32b7ba36fcfde6abb5df408d1a'
required.update(accepted(gamma_capture))
lightmap_weights = Path(__file__).resolve().parents[1] / 'proof/lightmap_weights_20261104_warm_bind.json'
assert hashlib.sha256(lightmap_weights.read_bytes()).hexdigest() == 'd589ce146edca75b1c1ad5b25410c8bb4982a1ca620347d93404bc4182090ba6'
required.update(accepted(lightmap_weights))
sun_blind_glare = Path(__file__).resolve().parents[1] / 'proof/sun_blind_glare_20261104_warm_bind.json'
assert hashlib.sha256(sun_blind_glare.read_bytes()).hexdigest() == 'bbeaf51a9ad5d35ebbcc1ab87f8755d25ccebf313b06d33766a0258460220481'
required.update(accepted(sun_blind_glare))
cache_indices = Path(__file__).resolve().parents[1] / 'proof/cache_indices_20261105_warm_bind.json'
assert hashlib.sha256(cache_indices.read_bytes()).hexdigest() == 'feed9bb7eaa7fc77d4e79a072600f9f9e978ccb092f706ce9bbb46ab6a6aeaca'
required.update(accepted(cache_indices))
current = accepted(Path(sys.argv[1]))
lost = {va: size for va, size in required.items() if current.get(va) != size}
assert not lost, ('checkpoint regression', lost)
print('PASS: all', len(required), 'checkpoint source/library address-extents retained')
