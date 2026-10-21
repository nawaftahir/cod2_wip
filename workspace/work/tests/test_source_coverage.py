"""Verify that the C/C++ meter fails closed when assembly attribution changes."""
from contextlib import redirect_stdout
import io
import json
from pathlib import Path
import runpy
import sys
from unittest.mock import patch

work = Path(__file__).resolve().parents[1]
tool = work / 'tools/source_coverage.py'
build = (work / 'build').resolve()


def run():
    output = io.StringIO()
    with patch.object(sys, 'argv', [str(tool), str(build)]), redirect_stdout(output):
        runpy.run_path(str(tool), run_name='__main__')
    return json.loads(output.getvalue())


actual = run()
assert len(actual['excluded_assembly_bodies']) == 31
assert sum(row['bytes'] for row in actual['excluded_assembly_bodies']) == 7787
assert actual['cpp_executable_bytes'] == actual['mixed_executable_bytes'] - 7787
original_bytes = Path.read_bytes
for relative in ('universal/com_math.h', 'universal/com_shared.cpp',
                 'universal/box_on_plane_side_x86.inc', 'gfx_d3d/rb_backend.cpp',
                 'compat/msvc71.h'):
    target = work / 'src' / relative

    def altered_bytes(path):
        value = original_bytes(path)
        return value + b'\n__asm nop\n' if path == target else value

    with patch.object(Path, 'read_bytes', altered_bytes):
        try:
            run()
        except AssertionError as error:
            assert 'assembly source changed' in str(error)
        else:
            raise AssertionError(('accepted changed assembly source', relative))

target = work / 'src/gfx_d3d/r_image.cpp'
original_text = Path.read_text


def altered_text(path, *args, **kwargs):
    value = original_text(path, *args, **kwargs)
    return value + '\n__asm nop\n' if path == target else value


with patch.object(Path, 'read_text', altered_text):
    try:
        run()
    except AssertionError as error:
        assert 'unreviewed assembly source' in str(error)
    else:
        raise AssertionError('accepted assembly outside reviewed sources')
print('PASS: C/C++ source accounting, 31 assembly exclusions and six changed/unreviewed-assembly negatives')
