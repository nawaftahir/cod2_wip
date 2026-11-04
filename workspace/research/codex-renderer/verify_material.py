#!/usr/bin/env python3
"""Fresh MSVC rebuild and exact candidate checks; does not promote or certify V4."""
from pathlib import Path
from contextlib import redirect_stdout
import hashlib
import io
import json
import shlex
import subprocess
import tempfile

from batch_existing import IMAGE, HERE
from check_shape import check, self_check
from audit_legacy import load_matcher


def main():
    self_check()
    run = Path(tempfile.mkdtemp(prefix='material_verify_', dir=HERE))
    command = ['cl', '/nologo', '/W3', '/O2', '/Gy', '/c',
               'Z:\\inputs\\src\\material_queries.c', 'Z:\\inputs\\src\\renderer_state.c',
               'Z:\\inputs\\src\\sun_override.c',
               'Z:\\inputs\\src\\font_metrics.c', 'Z:\\inputs\\src\\visibility_config.c',
               'Z:\\inputs\\src\\model_bounds.c', 'Z:\\inputs\\src\\fog_state.c',
               'Z:\\inputs\\src\\world_bounds.c',
               '/FoZ:\\out\\']
    sources = {name: hashlib.sha256((HERE / 'src' / name).read_bytes()).hexdigest()
               for name in ('material_queries.c', 'renderer_state.c', 'sun_override.c',
                            'font_metrics.c', 'visibility_config.c', 'model_bounds.c', 'fog_state.c', 'world_bounds.c')}
    subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', f'{HERE}:/inputs:ro',
                    '-v', f'{run}:/out', '-w', '/out', '--entrypoint', '/bin/sh', IMAGE,
                    '-c', shlex.join(command)], check=True)
    obj = run / 'material_queries.obj'
    checks = io.StringIO()
    with redirect_stdout(checks):
        check(0x10017300, obj, '_R_GetMaterialName')
        check(0x10017310, obj, '_R_GetMaterialSubimageCount')
        check(0x10017320, obj, '_R_IsMaterialRefractive',
              bindings={'_renderer_in_use_dvar': 0x101ce708})
        state = run / 'renderer_state.obj'
        bindings = {'_renderer_min_spec_image_memory': 0x101d0a78,
                    '_renderer_ignore_precache_errors': 0x101d4d02}
        for address, symbol in ((0x1000c8d0, '_R_GetMinSpecImageMemory'),
                                (0x1001d8f0, '_R_SetIgnorePrecacheErrors'),
                                (0x1001d900, '_R_GetIgnorePrecacheErrors')):
            check(address, state, symbol, bindings=bindings)
        sun = run / 'sun_override.obj'
        bindings = {'_renderer_in_use_dvar': 0x101ce708, '_renderer_world': 0x101d1b9c}
        check(0x10001430, sun, '_R_SetSunLightOverride', bindings=bindings)
        check(0x10001460, sun, '_R_ResetSunLightOverride', bindings=bindings)
        font = run / 'font_metrics.obj'
        visibility = run / 'visibility_config.obj'
        check(0x1000c000, font, '_R_TextHeight')
        check(0x1000aac0, visibility, '_R_SetCullDist', bindings={
            '_renderer_cull_distance': 0x101ce5f4, '__real@00000000': 0x1019bc84})
        bounds = run / 'model_bounds.obj'
        fog = run / 'fog_state.obj'
        check(0x1001d910, bounds, '_R_ModelBounds')
        bindings = {'_renderer_fog_settings': 0x101d616c, '_renderer_fog_index': 0x101d620c}
        check(0x1000bb10, fog, '_R_ClearFogs', bindings=bindings)
        check(0x1000bc40, fog, '_R_ArchiveFogState', bindings=bindings)
        world_bounds = run / 'world_bounds.obj'
        check(0x10001230, world_bounds, '_R_GetWorldBounds', bindings={'_renderer_world': 0x101d1b9c})
        referee = load_matcher()
        zero_offset = referee['rva2off'](0x1019bc84 - 0x10000000)
        if referee['_d'][zero_offset:zero_offset + 4] != b'\0' * 4:
            raise AssertionError('bound float-zero constant differs')
        for address, object_path, symbol in (
            (0x10017300, obj, '_R_GetMaterialName'),
            (0x10017310, obj, '_R_GetMaterialSubimageCount'),
            (0x10017320, obj, '_R_IsMaterialRefractive'),
            (0x1000c8d0, state, '_R_GetMinSpecImageMemory'),
            (0x1001d8f0, state, '_R_SetIgnorePrecacheErrors'),
            (0x1001d900, state, '_R_GetIgnorePrecacheErrors'),
            (0x10001430, sun, '_R_SetSunLightOverride'),
            (0x10001460, sun, '_R_ResetSunLightOverride'),
            (0x1000c000, font, '_R_TextHeight'),
            (0x1000aac0, visibility, '_R_SetCullDist'),
            (0x1001d910, bounds, '_R_ModelBounds'),
            (0x1000bb10, fog, '_R_ClearFogs'),
            (0x1000bc40, fog, '_R_ArchiveFogState'),
            (0x10001230, world_bounds, '_R_GetWorldBounds')):
            if referee['cmd_diff'](hex(address), str(object_path), symbol) != 100:
                raise AssertionError('legacy referee mismatch')
    print(checks.getvalue(), end='')
    (run / 'checks.log').write_text(checks.getvalue())
    try:
        check(0x10017320, obj, '_R_IsMaterialRefractive',
              bindings={'_renderer_in_use_dvar': 0x101ce70c})
    except ValueError as error:
        if 'wrong binding' not in str(error):
            raise
        print('PASS: wrong symbol destination is rejected')
    else:
        raise AssertionError('wrong symbol destination accepted')
    executable = run / 'host_test'
    subprocess.run(['cc', '-std=c99', '-Wall', '-Wextra', '-Werror', '-fno-strict-aliasing',
                    str(HERE / 'test_material_queries.c'), '-o', str(executable)], check=True)
    subprocess.run([str(executable)], check=True)
    state_test = run / 'state_test'
    subprocess.run(['cc', '-std=c99', '-Wall', '-Wextra', '-Werror',
                    str(HERE / 'test_renderer_state.c'), '-o', str(state_test)], check=True)
    subprocess.run([str(state_test)], check=True)
    sun_test = run / 'sun_test'
    subprocess.run(['cc', '-std=c99', '-Wall', '-Wextra', '-Werror', '-fno-strict-aliasing',
                    str(HERE / 'test_sun_override.c'), '-o', str(sun_test)], check=True)
    subprocess.run([str(sun_test)], check=True)
    queries_test = run / 'queries_test'
    subprocess.run(['cc', '-std=c99', '-Wall', '-Wextra', '-Werror',
                    str(HERE / 'test_renderer_queries.c'), '-o', str(queries_test)], check=True)
    subprocess.run([str(queries_test)], check=True)
    fog_test = run / 'fog_bounds_test'
    subprocess.run(['cc', '-std=c99', '-Wall', '-Wextra', '-Werror', '-fno-strict-aliasing',
                    str(HERE / 'test_fog_bounds.c'), '-o', str(fog_test)], check=True)
    subprocess.run([str(fog_test)], check=True)
    for name, digest in sources.items():
        if hashlib.sha256((HERE / 'src' / name).read_bytes()).hexdigest() != digest:
            raise RuntimeError('source changed during verification: ' + name)
    (run / 'packet.json').write_text(json.dumps(dict(image=IMAGE, command=command,
        sources=sources, objects={p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                                for p in (obj, state, sun, font, visibility, bounds, fog, world_bounds)},
        status='REVIEWABLE', functions=14, bytes=425, wrong_binding_rejected=True,
        host_fixtures_passed=True, independent_review=False), indent=2) + '\n')
    print('PASS: host behavioral fixtures (not a Windows game smoke test)')
    print('REVIEWABLE: 14 source candidates / 425 bytes; evidence outputs:', run)


if __name__ == '__main__':
    main()
