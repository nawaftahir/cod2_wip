"""Audit completed small dialogs with their proven C++ exception/RTTI settings."""
import runpy,sys
sys.argv=['test_dialog_completion.py','small']
d=runpy.run_path('workspace/research/gemini_review/test_dialog_completion.py')
v,img,names=d['v'],d['img'],d['names']
d['dialog']('CCapDialog',0x407f80,0x408000,0x53f13c,0x407fa0,0x408020,5)
d['dialog']('CDialogThick',0x4097d0,0x409870,0x53f854,0x409800,0x409880,4)
d['dialog']('CLstToolBar',0x411040,0x411090,0x541134,0x411050,0x4110b0,4,base='CToolBar',slots=92,dispatches=1)
for cls in ('CCapDialog','CDialogThick','CLstToolBar'):
    assert not any('ehhandler$' in s and cls+'@@' in s for s in img.syms)
for a,s in [('0x00407fd0','??1CCapDialog@@UAE@XZ'),('0x00409830','??1CDialogThick@@UAE@XZ')]:
    assert v.check(img,a,s,names)[0]=='MATCH'
assert v.check(img,'0x00408010','?FUN_00408010@@YAHPBD@Z',names)[0]=='MATCH'
print('PASS: CapDialog, DialogThick and LstToolBar FILE VERIFIED; scalar destructors, real destructor callees, full normalized metadata and literal defaults; no emitted EH helpers omitted')
