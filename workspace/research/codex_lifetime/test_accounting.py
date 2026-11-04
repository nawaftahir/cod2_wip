"""A wrong compiler helper must fail without increasing game coverage."""
import contextlib
import io
import json
from pathlib import Path
import sys
from unittest.mock import patch

sys.path.insert(0, 'tools')
import verify

report = Path('build/verify.json')
original = report.read_bytes()
baseline = json.loads(original)
assert baseline['failed'] == 0 and baseline['compiler_matched'] == 2
read = verify.read_tsv
compiler = [dict(row) for row in read('ledger/compiler.tsv')]
compiler[0]['symbol'] = compiler[1]['symbol']
try:
    # Only the lookup metadata changes; use the already-linked image.
    with patch.object(verify.link, 'build', return_value=True), patch.object(
        verify, 'read_tsv', side_effect=lambda path: compiler if path == 'ledger/compiler.tsv' else read(path)
    ), contextlib.redirect_stdout(io.StringIO()):
        assert not verify.verify_all()
    negative = json.loads(report.read_text())
    assert negative['failed'] == 1 and negative['compiler_matched'] == 1
    assert negative['matched'] == baseline['matched']
    assert negative['matched_bytes'] == baseline['matched_bytes']
    compiler[0]['addr'] = hex(int(read('ledger/matches.tsv')[0]['addr'], 16)).upper()
    with patch.object(verify.link, 'build', return_value=True), patch.object(
        verify, 'read_tsv', side_effect=lambda path: compiler if path == 'ledger/compiler.tsv' else read(path)
    ):
        try:
            verify.verify_all()
        except ValueError as error:
            assert str(error) == 'compiler rows must not duplicate game rows'
        else:
            raise AssertionError('duplicate game/compiler address accepted')
finally:
    report.write_bytes(original)
print('PASS: wrong compiler helper fails; game coverage and accepted report preserved')
