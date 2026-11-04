"""Complete single-driver proof, reusing pinned transform gates."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_transform_order/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ff719ff9b5047ec1b272ed317ab1236b146e0387542ee7016e8d96e4ef71363'
source = prior.read_text()
source = source.replace('codex35_transform_order', 'codex35_predicate_order')
source = source.replace('codex_shader_transform_order', 'codex_shader_predicate_order')
source = source.replace('transform.obj', 'predicate.obj')
source = source.replace("prefix = 'transform'", "prefix = 'predicate'")
source = source.replace('(9 if CLEAN else 10)', '1')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
