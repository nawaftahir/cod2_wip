"""Actual DPVS owner offsets agree with original types and PC instructions."""
from pathlib import Path
import hashlib
import json
import re
import subprocess
import tempfile
import capstone
import pefile

work=Path(__file__).resolve().parents[1]
evidence=work/'proof/dpvs_state_type_evidence.json'
assert hashlib.sha256(evidence.read_bytes()).hexdigest()=='68248356c49152c4679a115861cb6c254c7522e736cdd839449271a938ecda40'
records=json.loads(evidence.read_text())
record=next(r['name'] for r in records['mac']['records'] if r['name'].startswith('$_3719:Tt'))
assert '=s108' in record
fields={name:(int(offset)//8,int(size)//8) for name,offset,size in re.findall(r'([A-Za-z]\w*):[^;]*?,(\d+),(\d+);',record.split('=s108',1)[1])}
assert len(fields)==15 and (max(a+b for a,b in fields.values())+3)//4*4==108
anchor=work.parents[2]/'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest()==records['pc']['anchor_sha256']
pe=pefile.PE(str(anchor));cs=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
starts={offset for offset,size in fields.values()}|set(range(100,105))
for row in records['pc']['references']:
    address=int(row['instruction'],16)
    ins=next(cs.disasm(pe.get_data(address-0x10000000,16),address))
    assert (ins.mnemonic,ins.op_str)==(row['mnemonic'],row['operands'])
    assert int(row['referenced_address'],16)-0x101ce588 in starts
source=(work/'src/gfx_d3d/r_dpvs.cpp').read_text()
owners=source[source.index('static DpvsState dpvsGlob;'):source.index('DpvsScene dpvsScene;')]
expressions=[('viewPlane','portalViewPlane'),('fogPlane','portalFogPlane'),
    ('nearPlane','portalNearPlane'),('farPlane','portalFarPlane'),
    ('viewProjMtx','portalViewProjectionMatrix'),('invViewProjMtx','portalInverseViewProjectionMatrix'),
    ('activeOccluderCount','activeOccluders.count'),('activeOccluders','activeOccluders.list'),
    ('occluderPlaneCount','activeOccluderPlanes.count'),('occluderPlanes','activeOccluderPlanes.planes'),
    ('viewOrg','dpvsViewOrg'),('queuedCount','portalQueueCount'),('portalQueue','portalQueue'),
    ('nextFreeHullPoints','nextFreeHullPoints'),('debug','dpvsGlob.debug')]
program=r'''
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <cstdio>
typedef unsigned char byte;typedef byte Bool;typedef float vec4_t[4];
struct DpvsPlane {float coeffs[4];byte side[3];union {byte frontal;}u;};
struct PortalHeapNode;struct GfxOccluder;struct D3DMATRIX;
'''+ '#include '+json.dumps(str(work/'src/gfx_d3d/r_dpvs_state.h'))+'\n'+owners+r'''
int main(){
 static_assert(sizeof(void*)==4&&sizeof(DpvsState)==108,"actual PC record");
 const void *members[]={'''+','.join('&'+value for name,value in expressions)+r'''};
 const unsigned expected[]={'''+','.join(str(fields[name][0]) for name,value in expressions)+r'''};
 for(unsigned i=0;i<15;++i)assert((const byte*)members[i]-(const byte*)&dpvsGlob==expected[i]);
 assert((byte*)&dpvsCullDist==(byte*)&dpvsConfig&&sizeof(dpvsConfig)==4);
 for(unsigned flags=0;flags<32;++flags){
  memset(&dpvsGlob,0xa5,sizeof(dpvsGlob));dpvsCullDist=7.5f;
  dpvsGlob.debug.drawWorld=flags&1;dpvsGlob.debug.drawEntities=(flags>>1)&1;
  dpvsGlob.debug.drawSModels=(flags>>2)&1;dpvsGlob.debug.drawXModels=(flags>>3)&1;
  dpvsGlob.debug.drawBModels=(flags>>4)&1;
  byte oracle[108];memset(oracle,0xa5,sizeof(oracle));
  for(unsigned i=0;i<5;++i)oracle[100+i]=(flags>>i)&1;
  assert(!memcmp(oracle,&dpvsGlob,sizeof(oracle))&&dpvsCullDist==7.5f);
 }
 portalQueueCount=17;portalQueue=(PortalHeapNode*)0x12345678;
 nextFreeHullPoints=(GfxHullPointsPool*)0x23456789;
 assert(dpvsGlob.queue.count==17&&(uintptr_t)dpvsGlob.queue.nodes==0x12345678);
 assert((uintptr_t)dpvsGlob.freeHullPoints==0x23456789&&dpvsCullDist==7.5f);
 puts("PASS: actual 108-byte DPVS owner, 15 original fields, 32 debug states, queue/hull aliases, natural padding and separate cull configuration");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_dpvs_state_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: copied original type evidence and 13 real PC initializer instructions agree')
