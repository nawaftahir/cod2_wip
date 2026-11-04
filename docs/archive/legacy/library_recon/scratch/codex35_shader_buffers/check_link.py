"""Retain all662 previous matches and prove all four new buffer callbacks."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_conversions/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '92246c1d1cf4e8bad728686a9b71b41ee383148d40875508583fcdbb39ee1b80'
source = prior.read_text()
marker = 'source = source.replace(marker, addition + marker)'
assert source.count(marker) == 1
source = source.replace(marker, 'addition += ' + "\"assert \\\"build/codex35_shader_conversions\\\" in source\\nsource = source.replace(\\\"build/codex35_shader_conversions\\\", \\\"build/codex35_shader_buffers\\\")\\nassert \\\"build/codex35_shader_comment\\\" in source\\nsource = source.replace(\\\"build/codex35_shader_comment\\\", \\\"build/codex35_shader_conversions\\\")\\nassert \\\"== 652\\\" in source\\nsource = source.replace(\\\"== 652\\\", \\\"== 662\\\")\\nassert \\\"'baseline_source_matches': 652\\\" in source\\nsource = source.replace(\\\"'baseline_source_matches': 652\\\", \\\"'baseline_source_matches': 662\\\")\\nassert \\\"all 652 previous\\\" in source\\nsource = source.replace(\\\"all 652 previous\\\", \\\"all 662 previous\\\")\\nassert \\\"== 42125\\\" in source\\nsource = source.replace(\\\"== 42125\\\", \\\"== 42433\\\")\\nassert \\\"'codex35_shader_comment'):\\\" in source\\nsource = source.replace(\\\"'codex35_shader_comment'):\\\", \\\"'codex35_shader_comment', 'codex35_shader_conversions'):\\\")\\n\"" + '\n' + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
