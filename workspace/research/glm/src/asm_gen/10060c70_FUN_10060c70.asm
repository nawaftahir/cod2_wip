; FUN_10060c70 @ 0x10060c70 — auto-synthesized
    EXTRN fp_101d4b84:DWORD
    sub_10061d30 PROTO C
    sub_100f61f8 PROTO C
.CODE
FUN_10060c70 PROC
    push esi
    push 1
    call dword ptr [fp_101d4b84]
    mov ecx, dword ptr [eax + 0x800]
    mov esi, ecx
    shl esi, 0xa
    add esi, eax
    inc ecx
    and ecx, 0x80000001
    jns L0
    dec ecx
    or ecx, 0xfffffffe
    inc ecx
    mov dword ptr [eax + 0x800], ecx
    mov ecx, dword ptr [esp + 0xc]
    lea eax, [esp + 0x10]
    push eax
    push ecx
    push 0x400
    push esi
    call sub_100f61f8
    add esp, 0x14
    test eax, eax
    mov byte ptr [esi + 0x3ff], 0
    jl L1
    cmp eax, 0x400
    jl L2
    push 0x1019bbf8
    push 1
    call sub_10061d30
    add esp, 8
    mov eax, esi
    pop esi
    ret
FUN_10060c70 ENDP
END