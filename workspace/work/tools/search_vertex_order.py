"""Try the remaining four-vector argument orders; keep only a full-gate candidate."""
import difflib
import itertools
import json
import os
from pathlib import Path
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[3]
REL = 'workspace/work/src/gfx_d3d/r_model.cpp'
SIG = ('static void R_TransformRigidVertex(const DObjSkelMat *bone, const float *normal,\n'
       '    const float *binormal, const float *position, const float *tangent, GfxVertex *out)')
CALL = 'R_TransformRigidVertex(bone, in->normal, in->binormal, in->offset, in->tangent, &vertex)'
FIELDS = dict(position='in->offset', tangent='in->tangent', normal='in->normal', binormal='in->binormal')
TRIED = {('position', 'tangent', 'normal', 'binormal'), ('position', 'tangent', 'binormal', 'normal')}


def variant(base, order):
    assert set(order) == set(FIELDS) and len(order) == 4
    assert base.count(SIG) == 1 and base.count(CALL) == 2
    signature = (f'static void R_TransformRigidVertex(const float *{order[0]}, const float *{order[1]},\n'
                 f'    const float *{order[2]}, const float *{order[3]}, const DObjSkelMat *bone, GfxVertex *out)')
    call = 'R_TransformRigidVertex(' + ', '.join(FIELDS[n] for n in order) + ', bone, &vertex)'
    return base.replace(SIG, signature).replace(CALL, call)


def selftest():
    base = 'BEFORE\n' + SIG + '\n{ BODY_UNCHANGED; }\n' + CALL + ';\n' + CALL + ';\nAFTER\n'
    outputs = {variant(base, order) for order in itertools.permutations(FIELDS)}
    assert len(outputs) == 24
    assert all(text.startswith('BEFORE\n') and text.endswith('AFTER\n')
               and '{ BODY_UNCHANGED; }' in text for text in outputs)
    try:
        variant(base.replace(CALL, 'other', 1), tuple(FIELDS))
    except AssertionError:
        pass
    else:
        raise AssertionError('Must reject unexpected callsites before writing source')


def run():
    import fcntl
    out = ROOT / 'build/vertex-order'
    out.mkdir(parents=True, exist_ok=True)
    lock = (out / 'run.lock').open('w')
    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
    base = subprocess.check_output(['git', 'show', 'HEAD:' + REL], cwd=ROOT, text=True)
    source = ROOT / REL
    current = source.read_text()
    assert current == base or any(current == variant(base, order) for order in TRIED), 'Unrecognized source edits; preserve and review them'
    (out / 'base.cpp').write_text(base)
    source.write_text(base)
    current = base
    retained = False
    build = ROOT / 'workspace/build/codex_boundsoutside_1016_02'
    baseline = json.loads((ROOT / 'ledger/bind.json').read_text())
    required = {(r['t'], r['n']) for r in baseline.values() if not r['why']}
    minimum = json.loads((ROOT / 'ledger/meter.json').read_text())['game_cpp_bytes']
    env = dict(os.environ, GFX_PROBE_SYMBOL='R_TransformRigidVertex')
    try:
        for index, order in enumerate(itertools.permutations(FIELDS)):
            if order in TRIED:
                continue
            if (out / 'STOP').exists():
                print('Stop requested; restoring confirmed source.', flush=True)
                break
            assert source.read_text() == current, 'Source changed externally; preserve it'
            current = variant(base, order)
            (out / 'active.json').write_text(json.dumps(dict(order=order, source=REL, status='unverified trial')) + '\n')
            source.write_text(current)
            before = (build / 'obj/gfx_d3d/r_model.obj').stat().st_mtime_ns
            started = time.monotonic()
            with (out / f'{index:02d}.log').open('w') as log:
                result = subprocess.run(['sh', 'workspace/work/tools/build.sh'], cwd=ROOT, env=env,
                                        stdout=log, stderr=subprocess.STDOUT)
            assert source.read_text() == current, 'Source changed externally; preserve it'
            record = dict(order=order, returncode=result.returncode, seconds=round(time.monotonic() - started, 2), kept=False)
            if result.returncode == 0:
                assert (build / 'obj/gfx_d3d/r_model.obj').stat().st_mtime_ns > before, 'Object was not rebuilt'
                bindings = json.loads((build / 'bind.json').read_text())
                found = [(name, row) for name, row in bindings.items() if name.startswith('?R_TransformRigidVertex@@')]
                actual = {(r['t'], r['n']) for r in bindings.values() if not r['why']}
                coverage = json.loads((ROOT / 'workspace/work/proof/source_coverage_current.json').read_text())
                if (len(found) == 1 and found[0][1]['why'] == []
                        and found[0][1]['t'] == '0x1001e260' and found[0][1]['n'] == 310
                        and required <= actual and coverage['cpp_executable_bytes'] > minimum):
                    retained = record['kept'] = True
                    (out / 'candidate.patch').write_text(''.join(difflib.unified_diff(base.splitlines(True), current.splitlines(True), fromfile=REL, tofile=REL)))
                    for name in ('bind.json', 'cmp.json'):
                        (out / name).write_bytes((build / name).read_bytes())
                    (out / 'coverage.json').write_text(json.dumps(coverage, indent=2) + '\n')
            with (out / 'results.jsonl').open('a') as log:
                log.write(json.dumps(record) + '\n')
            print(' '.join(order) + (': full local gates passed; CI required' if retained else ': rejected, no credit'), flush=True)
            if retained:
                break
    finally:
        if not retained and source.read_text() == current:
            source.write_text(base)
        status = ('candidate needs clean CI' if retained else
                  'finished; source restored; local build is diagnostic' if source.read_text() == base else
                  'external edit preserved; review source; local build is diagnostic')
        (out / 'active.json').write_text(json.dumps(dict(status=status)) + '\n')


if __name__ == '__main__':
    if sys.argv[1:] not in ([], ['--test']):
        raise SystemExit('Usage: search_vertex_order.py [--test]')
    selftest()
    if sys.argv[1:] == ['--test']:
        print('PASS bounded source-rewrite and rejection checks')
    else:
        run()
