"""Keep the first retail TU ordered without moving later private helpers."""
from pathlib import Path
import tempfile
import types
import sys
sys.path.insert(0,'tools')
import link
scope=dict(link.__dict__)
order=types.FunctionType(link.function_order.__code__,scope)
rows=[dict(addr='0x00402000',symbol='_LaterInFirst',source='first.cpp'),dict(addr='0x00400000',symbol='_OtherFile',source='second.cpp'),dict(addr='0x00401000',symbol='_First',source='first.cpp')]
with tempfile.TemporaryDirectory(dir='build') as directory:
 root=Path(directory);(root/'build').mkdir();scope['BASE']=root;scope['read_tsv']=lambda _:rows;scope['sources']=lambda:['first.cpp','second.cpp']
 assert order()=='/ORDER:@build/function_order.txt'
 assert (root/'build/function_order.txt').read_text()=='_First\n_LaterInFirst\n'
print('PASS: actual linker helper preserves the first TU order and excludes later TU helpers')
