; __setmode_lk @ 0x10109e79 — auto-synthesized
    sub_100fc277 PROTO C
.CODE
__setmode_lk PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, eax
    sar ecx, 5
    and eax, 0x1f
    lea edx, [ecx*4 + 0x1076aca0]
    lea ecx, [eax + eax*8]
    mov eax, dword ptr [edx]
    shl ecx, 2
    movzx eax, byte ptr [eax + ecx + 4]
    push esi
    mov esi, 0x8000
    and eax, 0x80
    cmp dword ptr [esp + 0xc], esi
    jne L0
    mov edx, dword ptr [edx]
    lea ecx, [edx + ecx + 4]
    and byte ptr [ecx], 0x7f
    jmp L1
    cmp dword ptr [esp + 0xc], 0x4000
    jne L2
    mov edx, dword ptr [edx]
    lea ecx, [edx + ecx + 4]
    or byte ptr [ecx], 0x80
    neg eax
    sbb eax, eax
    and eax, 0xffffc000
    add eax, esi
    pop esi
    ret
    call sub_100fc277
    mov dword ptr [eax], 0x16
    or eax, 0xffffffff
    pop esi
    ret
__setmode_lk ENDP
END