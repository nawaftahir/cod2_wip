"""Check small-dialog metadata and generated code outside their main TU ranges."""
import runpy, struct, sys
m = runpy.run_path('research/codex_order/test_model.py')
v, img, t, o, sym = (m[k] for k in ('verify', 'image', 'retail', 'ours', 'data_symbol'))
names = v.known_names()
def u(pe, a, n=1):
    return struct.unpack('<%dI' % n, pe.get_data(a-pe.OPTIONAL_HEADER.ImageBase, 4*n))
def z(pe, a):
    return pe.get_data(a-pe.OPTIONAL_HEADER.ImageBase, 128).split(b'\0', 1)[0]
def td(pe, a):
    return u(pe, a, 2)[1], z(pe, a+8)
def blob(ta, oa, size):
    left, right = t.get_data(ta-t.OPTIONAL_HEADER.ImageBase, size), o.get_data(oa-o.OPTIONAL_HEADER.ImageBase, size)
    lm, lc = v.masks(left, ta); rm, rc = v.masks(right, oa)
    assert v.matcher.normalize(left, lm | rm) == v.matcher.normalize(right, lm | rm), hex(ta)
    # Decode helper branches: an E8 byte inside a relocated MOV immediate is not a call.
    def branches(code,start):
        return {ins.address-start:ins.operands[0].imm for ins in m['md'].disasm(code,start)
                if ins.mnemonic in ('call','jmp') and ins.operands[0].type == m['X86_OP_IMM']
                and not start <= ins.operands[0].imm < start+len(code)}
    lc,rc=branches(left,ta),branches(right,oa)
    assert lc.keys() == rc.keys(), hex(ta)
    for field, target in lc.items():
        if target in names:
            assert names[target] in img.labels[rc[field]], (hex(ta), names[target])
        else:
            candidate = img.at[rc[field]]
            assert v.check(img, hex(target), candidate, names)[0] == 'MATCH', (hex(target), candidate)
    return left, right

def dialog(cls, ctor, getter, tv, helper, end, expected_count=None, expected_shared=(), base='CDialog', slots=86, dispatches=0, pending_callbacks=()):
    rows = [r for r in v.read_tsv('ledger/matches.tsv') if r['source'] == 'src/radiant/'+cls[1:]+'.cpp']
    assert len(rows) == (expected_count if expected_count is not None else (3 if cls == 'CScaleDialog' else 5))
    owned = img.of_source('src/radiant/'+cls[1:]+'.cpp')
    expected = {r['symbol'] for r in rows} | {'??_G'+cls+'@@UAEPAXI@Z', '??_E'+cls+'@@UAEPAXI@Z', '??1'+cls+'@@UAE@XZ'}
    if cls == 'CNameDlg': expected.add('??B?$CSimpleStringT@D$0A@@ATL@@QBEPBDXZ')
    assert expected <= set(owned) <= expected | set(expected_shared), (cls, set(owned)-expected)
    for r in rows:
        assert v.check(img, r['addr'], r['symbol'], names)[0] == 'MATCH', r
        a,code=img.code(r['symbol']);blob(int(r['addr'],16),a,len(code))
    deleting = '??_G'+cls+'@@UAEPAXI@Z'
    assert v.check(img, hex(helper), deleting, names)[0] == 'MATCH'
    vt = sym('??_7'+cls+'@@6B@')
    cols = [u(pe, u(pe, a-4)[0], 5) for pe, a in ((t, tv), (o, vt))]
    assert cols[0][:3] == cols[1][:3]
    assert u(o,cols[1][3])[0] == sym('??_7type_info@@6B@')
    assert td(t, cols[0][3]) == td(o, cols[1][3]) == (0, ('.?AV'+cls+'@@').encode())
    h = [u(pe, c[4], 4) for pe, c in zip((t,o), cols)]
    assert h[0][:3] == h[1][:3]
    for a, b in zip(u(t, h[0][3], h[0][2]), u(o, h[1][3], h[1][2])):
        x, y = u(t, a, 6), u(o, b, 6)
        assert x[1:] == y[1:] and td(t, x[0]) == td(o, y[0])
    base_td = u(t, u(t, h[0][3], h[0][2])[1], 6)[0]
    assert td(t, base_td) == (0, ('.?AV'+base+'@@').encode())
    section = next(s for s in t.sections if s.Name.rstrip(b'\0') == b'.rdata')
    data = section.get_data(); rb = t.OPTIONAL_HEADER.ImageBase + section.VirtualAddress
    base_col = rb + data.index(struct.pack('<4I', 0, 0, 0, base_td))
    base_vt = rb + data.index(struct.pack('<I', base_col)) + 4
    for i, (a,b,pa,pb) in enumerate(zip(u(t,tv,slots), u(o,vt,slots), u(t,base_vt,slots), u(o,sym('??_7'+base+'@@6B@'),slots))):
        if a == pa: assert b == pb, (cls, i)
        elif a == helper: assert b == img.syms[deleting]
        elif a in pending_callbacks: assert b == o.OPTIONAL_HEADER.ImageBase, (cls, i, hex(a), hex(b))
        else: assert names[a] in img.labels[b], (cls, i, hex(a))
    tm = struct.unpack_from('<I', v.matcher.carve(hex(getter))[0], 1)[0]
    am = sym('?messageMap@'+cls+'@@')
    getter=t.get_data(u(t,base_vt,11)[10]-t.OPTIONAL_HEADER.ImageBase,6)
    assert len(getter)==6 and getter[0]==0xb8 and getter[-1]==0xc3
    assert u(t,tm)[0] == int.from_bytes(getter[1:5],'little')
    assert u(o,am)[0] == sym('?messageMap@'+base+'@@')
    for j in range(dispatches+1):
        x,y=u(t,u(t,tm,2)[1]+24*j,6),u(o,u(o,am,2)[1]+24*j,6)
        assert x[:5]==y[:5]
        if j==dispatches: assert x==y==(0,)*6
        else: assert names[x[5]] in img.labels[y[5]]
    target, _ = v.matcher.carve(hex(ctor)); start, code = img.code(names[ctor])
    stores = []
    for a,b in zip(m['md'].disasm(target,ctor),m['md'].disasm(code,start)):
        for x,y in zip(a.operands,b.operands):
            if x.type == m['X86_OP_IMM'] and x.imm == tv:
                assert y.imm == vt; stores.append(a.address)
            if x.type == m['X86_OP_MEM'] and x.mem.disp == 0x53d753:
                assert z(t,x.mem.disp) == z(o,y.mem.disp) == b''
            if x.type == m['X86_OP_IMM'] and x.imm == 0x53d753:
                assert z(t,x.imm) == z(o,y.imm) == b''
            if x.type == m['X86_OP_MEM'] and x.mem.disp not in m['retail_imports'] and 0x52720e < x.mem.disp < 0x58f800:
                assert u(t,x.mem.disp) == u(o,y.mem.disp)
    assert len(stores) == 1
    rs = [r for r in v.read_tsv('data/tu_map.tsv') if r['tu'] == 'radiant/'+cls[1:]+'.cpp']
    for i,r in enumerate(rs):
        stop = int(r['addr'],16)+int(r['size']); nxt = int(rs[i+1]['addr'],16) if i+1<len(rs) else end
        assert set(t.get_data(stop-t.OPTIONAL_HEADER.ImageBase,nxt-stop)) <= {0xcc,0x90}
    print('PARTIAL:' if pending_callbacks else 'PASS:',cls,len(rows),'game routines;',len(v.matcher.carve(hex(helper))[0]),'byte deleting helper;',slots,'virtual slots, full RTTI, inherited runtime class, message map, constructor bindings and padding; pending callbacks',list(map(hex,pending_callbacks)))
    return not pending_callbacks

mode = sys.argv[1] if len(sys.argv)>1 else 'all'
if mode in ('scale','all'):
    dialog('CScaleDialog',0x43c710,0x43c7b0,0x5482ec,0x43c740,0x43c7c0)
    a,code=img.code('??1CScaleDialog@@UAE@XZ')
    assert len(code)==5 and code[0]==0xe9
    dest=v.masks(code,a)[1][1]
    assert '??1CDialog@@UAE@XZ' in img.labels[dest]
    assert not any('ehhandler$' in name and 'CScaleDialog@@' in name for name in img.syms)
    print('PASS: implicit ScaleDialog destructor folds to the real CDialog destructor; no EH contributor emitted')
if mode in ('name','all'):
    dialog('CNameDlg',0x424090,0x4241a0,0x54595c,0x424150,0x4241e0)
    assert v.check(img,'0x00402740','??B?$CSimpleStringT@D$0A@@ATL@@QBEPBDXZ',names)[0]=='MATCH'
    assert v.check(img,'0x0040a890','??1CNameDlg@@UAE@XZ',names)[0]=='MATCH'
    a=img.syms['__ehhandler$??0CNameDlg@@QAE@PBDPAVCWnd@@@Z']
    left,right=blob(0x52546e,a,10)
    assert u(t,0x42409c)[0]==0x52546e
    ctor_start,ctor_code=img.code(names[0x424090]); assert struct.unpack_from('<I',ctor_code,12)[0]==a
    infos=[u(pe,struct.unpack_from('<I',code,1)[0],7) for pe,code in ((t,left),(o,right))]
    assert infos[0][:2]==infos[1][:2]==(0x19930520,3) and infos[0][3:]==infos[1][3:]==(0,0,0,0)
    for i,(target,size,state) in enumerate(((0x525450,8,0xffffffff),(0x525458,11,0),(0x525463,11,1))):
        x,y=u(t,infos[0][2]+i*8,2),u(o,infos[1][2]+i*8,2)
        assert x[0]==y[0]==state and x[1]==target
        blob(target,y[1],size)
    print('PASS: shared 3-byte CString conversion and out-of-range 65-byte Name destructor; EH handler 10 bytes, three unwind helpers 30 bytes and complete 28-byte FuncInfo/24-byte unwind table')
