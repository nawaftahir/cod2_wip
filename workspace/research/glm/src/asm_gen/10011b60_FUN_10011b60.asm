; FUN_10011b60 @ 0x10011b60 — auto-synthesized
    EXTRN fp_101d49e8:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_101d497c:DWORD
    EXTRN g_101d49a4:DWORD
    EXTRN g_101d49c0:DWORD
    sub_10011a65 PROTO C
    sub_10011a96 PROTO C
    sub_10011b40 PROTO C
.CODE
FUN_10011b60 PROC
    mov eax, dword ptr [g_101ce708]
    mov edx, dword ptr [eax + 8]
    xor ecx, ecx
    cmp edx, 2
    setne cl
    push esi
    mov eax, 0x101d4998
    dec ecx
    and ecx, 0xffffffe4
    add ecx, 0x40
    shl ecx, 0xf
    call sub_10011a65
    mov dword ptr [g_101d49a4], 0x101d4998
    mov esi, 0x101d4980
    mov edx, dword ptr [g_101ce708]
    mov eax, dword ptr [edx + 8]
    xor ecx, ecx
    cmp eax, 2
    setne cl
    mov eax, esi
    dec ecx
    and ecx, 0xffffffe4
    add ecx, 0x40
    shl ecx, 0x11
    call sub_10011a96
    add esi, 0xc
    cmp esi, 0x101d4998
    jne L0
    mov ecx, 0x200000
    mov eax, 0x101d4970
    call sub_10011b40
    push 0xa00000
    mov dword ptr [g_101d497c], 0x101d4970
    call dword ptr [fp_101d49e8]
    add esp, 4
    mov dword ptr [g_101d49c0], eax
    pop esi
    ret
FUN_10011b60 ENDP
END