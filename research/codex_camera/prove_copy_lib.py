"""Check both complete CRT copy sections, including their internal jump tables."""
import struct
import lib_sweep

def prove(verify, image):
    m=verify.matcher
    targets={'_memmove':0x4d7c40,'_memcpy':0x4de280}
    result={}
    for member,data in lib_sweep.archive_members('/opt/msvc710/Vc7/lib/libcmt.lib'):
        symbol=next((s for s in targets if member.lower().endswith('\\'+s[1:]+'.obj')),None)
        if not symbol:continue
        sections,symbols=m.parse_coff(data)
        entry=next(s for s in symbols if s['name']==symbol)
        section=sections[entry['section']-1]
        code,mask,name=m.object_function(data,symbol)
        assert name==symbol and entry['value']==0 and len(code)==section['raw']==829
        original=targets[symbol]
        target=image.pe.__class__(str(verify.link.RETAIL),fast_load=True).get_data(original-0x400000,829)
        actual=image.pe.get_data(image.syms[symbol]-image.base,829)
        for start,body in ((original,target),(image.syms[symbol],actual)):
            combined=mask|m.absolute_masks(body,m.pe_relocations(start,len(body),body) if start==original else ())
            assert m.normalize(code,combined)==m.normalize(body,combined),(symbol,hex(start))
            byname={s['name']:s for s in symbols}
            for relocation in section['relocations']:
                label=byname[relocation['target']]
                assert relocation['type']==6 and label['section']==entry['section']
                offset=relocation['position']
                expected=(start+label['value']+struct.unpack_from('<I',code,offset)[0])&0xffffffff
                assert struct.unpack_from('<I',body,offset)[0]==expected,(symbol,offset)
        result[original]=symbol
        print('CRT:',hex(original),symbol,'829 B, complete archive section/internal labels and actual linked callee')
    assert result=={0x4d7c40:'_memmove',0x4de280:'_memcpy'}
    return result
