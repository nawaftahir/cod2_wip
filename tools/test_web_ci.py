"""Small failure-path checks for the hosted gate and isolated draft runner."""
import contextlib
import io
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
import ci_gate
import web_trial


class WebCI(unittest.TestCase):
    def test_requests_stay_in_assignment(self):
        valid = 'addr\tsymbol\n0x004100a0\t?OnSetfocusEditFind@CFindTextureDlg@@IAEXXZ\n'
        self.assertEqual(len(web_trial.requests(valid)), 1)
        for text in (valid + valid.splitlines()[1] + '\n', valid.replace('0x004100a0', '0x00424590'),
                     valid.replace('addr\tsymbol', 'addr\tname'), 'addr\tsymbol\n'):
            with self.assertRaises((AssertionError, KeyError)):
                web_trial.requests(text)

    def test_failure_restores_canonical_source(self):
        original = Path.cwd()
        try:
            with tempfile.TemporaryDirectory(dir='scratch') as name:
                root = Path(name).resolve()
                draft = root / web_trial.DRAFT
                source = root / web_trial.SOURCE
                request = root / web_trial.REQUEST
                draft.parent.mkdir(parents=True)
                source.parent.mkdir(parents=True)
                draft.write_text('a controlled failing draft')
                source.write_text('original source')
                (root / 'data').mkdir()
                (root / 'data/symbols.tsv').write_text('addr\tsymbol\tevidence\n')
                request.write_text('addr\tsymbol\n0x004100a0\tmethod\n')
                with patch.object(web_trial.v, 'BASE', root), patch.object(web_trial, 'requests', return_value=[]), \
                     patch.object(web_trial.v, 'verify_all', return_value=False), contextlib.redirect_stdout(io.StringIO()):
                    with self.assertRaises(AssertionError):
                        web_trial.main()
                self.assertEqual(source.read_text(), 'original source')
                self.assertEqual((root / 'data/symbols.tsv').read_text(), 'addr\tsymbol\tevidence\n')
                self.assertIn('failed', (root / 'build/web-trial.md').read_text())
        finally:
            os.chdir(original)

    def test_gate_stops_and_reports_failure(self):
        original = Path.cwd()
        try:
            with tempfile.TemporaryDirectory(dir='scratch') as name:
                root = Path(name).resolve()
                with patch.object(ci_gate, 'ROOT', root), patch.object(ci_gate, 'anchor'), \
                     patch.object(ci_gate, 'STEPS', [('broken', []), ('never-run', [])]), \
                     patch.object(ci_gate.subprocess, 'run') as run, contextlib.redirect_stdout(io.StringIO()):
                    run.return_value.returncode = 2
                    self.assertEqual(ci_gate.main(), 1)
                    self.assertEqual(run.call_count, 1)
                self.assertIn('FAIL', (root / 'build/ci-summary.md').read_text())
                self.assertEqual(json.loads((root / 'build/ci-results.json').read_text())[0]['exit_code'], 2)
        finally:
            os.chdir(original)

    def test_anchor_rejects_wrong_binary(self):
        with tempfile.TemporaryDirectory(dir='scratch') as name:
            root = Path(name).resolve()
            (root / 'binaries').mkdir()
            (root / 'binaries/CoD2Radiant.exe').write_bytes(b'wrong')
            (root / 'checksums.yml').write_text('target:\n  size: 5\n  sha256: ' + '0'*64 + '\n')
            with patch.object(ci_gate, 'ROOT', root), self.assertRaises(AssertionError):
                ci_gate.anchor()


if __name__ == '__main__':
    Path('scratch').mkdir(exist_ok=True)
    unittest.main()
