"""Finish the generated-code inventory for EditWnd and RADEditWnd."""
import runpy
m=runpy.run_path('research/gemini_review/test_dialog_batch.py')
r=runpy.run_path('research/gemini_review/test_radeditwnd.py')
v,img,names=m['v'],m['img'],m['names']
for address,symbol in (
 (0x40c6b0,'?CreateObject@CEditWnd@@SGPAVCObject@@XZ'),
 (0x43b500,'??0CRADEditWnd@@QAE@XZ'),
 (0x43b590,'??1CRADEditWnd@@UAE@XZ'),
):
    a,code=img.code(symbol)
    assert v.check(img,hex(address),symbol,names)[0]=='MATCH'
    m['blob'](address,a,len(code))
    assert m['eh'](address,a,len(code)) is True,(hex(address),symbol)
for row in m['manifest']:print('GENERATED:',*row)
# These files now share the same class declaration instead of duplicating it.
from pathlib import Path
for path in ('src/radiant/EditWnd.cpp','src/radiant/RADEditWnd.cpp'):
    text=Path(path).read_text();assert '#include "EditWnd.h"' in text and 'class CEditWnd :' not in text
for cls,source in (('CEditWnd','src/radiant/EditWnd.cpp'),('CRADEditWnd','src/radiant/RADEditWnd.cpp')):
    rows=[x for x in v.read_tsv('ledger/matches.tsv') if x['source']==source]
    allowed={x['symbol'] for x in rows}|{'??_G'+cls+'@@UAEPAXI@Z','??_E'+cls+'@@UAEPAXI@Z'}
    shared={'?Height@CRect@@QBEHXZ','?Width@CRect@@QBEHXZ','?OnSize@CWnd@@IAEXIHH@Z','?OnCreate@CWnd@@IAEHPAUtagCREATESTRUCTA@@@Z'} if cls=='CRADEditWnd' else set()
    assert allowed <= set(img.of_source(source)) <= allowed | shared,(source,set(img.of_source(source))-allowed)
    for symbol in shared:
        a,code=img.code(symbol);candidates=[]
        for row in v.read_tsv('data/tu_map.tsv'):
            if int(row['size'])!=len(code):continue
            if v.check(img,row['addr'],symbol,names)[0]=='MATCH':candidates.append(row['addr'])
        assert candidates,symbol
        print('SDK HEADER:',symbol,len(code),candidates)
print('PASS: EditWnd and RADEditWnd FILE VERIFIED, including factory/member cleanup and the shared class declaration')
