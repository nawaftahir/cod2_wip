"""Whole-file coverage excludes BSS/padding and never double-counts overlaps."""
import importlib.util
from pathlib import Path
import sys
from types import SimpleNamespace
from unittest.mock import patch

work = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('retail_coverage', work / 'tools/retail_coverage.py')
tool = importlib.util.module_from_spec(spec)
spec.loader.exec_module(tool)
sys.path.insert(0, str(work.parents[1] / 'tools'))
from string_literal import string_size

pe = SimpleNamespace(OPTIONAL_HEADER=SimpleNamespace(ImageBase=0x10000000), sections=[
    SimpleNamespace(VirtualAddress=0x1000, SizeOfRawData=0x100,
                    Misc_VirtualSize=0x80, PointerToRawData=0x200),
    SimpleNamespace(VirtualAddress=0x2000, SizeOfRawData=0x20,
                    Misc_VirtualSize=0x100, PointerToRawData=0x300)])
assert tool.file_span(pe, 0x10001010, 16) == 0x210
assert tool.file_span(pe, 0x10001010, 0) is None
assert tool.file_span(pe, 0x10001010, -1) is None
assert tool.file_span(pe, 0x10001080, 1) is None
assert tool.file_span(pe, 0x1000201c, 4) == 0x31c
assert tool.file_span(pe, 0x1000201c, 8) is None
assert tool.file_span(pe, 0x10002020, 1) is None
mask = bytearray(32)
assert tool.mark(mask, 10, 5) == 5
assert tool.mark(mask, 12, 5) == 2 and sum(mask) == 7
try:
    tool.mark(mask, 31, 2)
except AssertionError:
    pass
else:
    raise AssertionError('coverage outside retail file')
assert tool.data_size('??_C@_04ODHECPBC@fabs?$AA@', 48, b'fabs\0' + b'\0' * 43, string_size) == 5
assert tool.data_size('__real@00000000', 48, b'\0' * 48, string_size) == 4
assert tool.data_size('__xmm@' + '0' * 32, 48, b'\0' * 48, string_size) == 16
assert tool.data_size('unknown', 48, b'\0' * 48, string_size) is None
assert tool.data_size('table', 48, b'abc\0' + b'\0' * 44, string_size) == 3
assert tool.data_size('unknown', 1048577, b'abc', string_size) is None
assert tool.data_equal(b'abc', b'abc', 0x2000, 0x5000, set(), set())
assert not tool.data_equal(b'abc', b'abd', 0x2000, 0x5000, set(), set())
assert tool.data_equal(b'1234x', b'5678x', 0x2000, 0x5000, {0x2000}, {0x5000})
assert not tool.data_equal(b'1234x', b'1234x', 0x2000, 0x5000, {0x2000}, set())
assert not tool.data_equal(b'12', b'12', 0x2000, 0x5000, {0x2000}, {0x5000})
original_bytes = Path.read_bytes
for relative, message in [('bind.json', 'Run the full build gates first'),
                          ('gfx.dll', 'DLL changed after the build gates')]:
    target = (work / 'build' / relative).resolve()

    def changed(path):
        value = original_bytes(path)
        return value + b'changed input' if path.resolve() == target else value

    with patch.object(Path, 'read_bytes', changed):
        try:
            tool.report((work / 'build').resolve())
        except AssertionError as error:
            assert message in str(error), error
        else:
            raise AssertionError(('accepted stale proof', relative))
print('PASS: raw-file bounds, BSS exclusion, interval union, bounded literals, no zero-padding credit and symmetric relocations')
