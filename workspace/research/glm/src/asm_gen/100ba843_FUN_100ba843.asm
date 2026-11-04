; FUN_100ba843 @ 0x100ba843 — auto-synthesized
    sub_1008a9a2 PROTO C
.CODE
FUN_100ba843 PROC
    mov edi, edi
    push edi
    or eax, 0xffffffff
    mov dword ptr [ecx + 0x138], eax
    lea edi, [ecx + 0x13c]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    and dword ptr [ecx + 0x14c], 0
    and dword ptr [ecx + 0x150], 0
    call sub_1008a9a2
    test eax, eax
    pop edi
    jl L0
    xor eax, eax
    ret
FUN_100ba843 ENDP
END