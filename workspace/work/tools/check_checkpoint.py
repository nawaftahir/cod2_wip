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
current = accepted(Path(sys.argv[1]))
lost = {va: size for va, size in required.items() if current.get(va) != size}
assert not lost, ('checkpoint regression', lost)
print('PASS: all', len(required), 'checkpoint source/library address-extents retained')
