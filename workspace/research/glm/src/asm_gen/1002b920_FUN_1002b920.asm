; FUN_1002b920 @ 0x1002b920 — auto-synthesized
    EXTRN g_101ce708:DWORD
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c93 PROTO C
    sub_100f6d50 PROTO C
.CODE
FUN_1002b920 PROC
    mov ecx, dword ptr [g_101ce708]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    cmp edx, 2
    setne al
    push esi
    dec eax
    and eax, 0xffffffe4
    add eax, 0x40
    shl eax, 0x10
    mov esi, eax
    mov edi, edi
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x10197480
    push 0x10193358
    push eax
    call sub_100f6d50
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6c93
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push 0
    push 0x101d49b4
    push 0
    push 0
    push 0x208
    push esi
    push eax
    call dword ptr [ecx + 0x68]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    pop esi
    ret
FUN_1002b920 ENDP
END