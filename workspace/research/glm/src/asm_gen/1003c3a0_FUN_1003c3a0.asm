; FUN_1003c3a0 @ 0x1003c3a0 — auto-synthesized
    EXTRN g_101ce67c:DWORD
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6ca3 PROTO C
    sub_100f6d60 PROTO C
.CODE
FUN_1003c3a0 PROC
    test ah, 0xf
    push esi
    je L0
    xor esi, esi
    jmp L1
    mov ecx, dword ptr [g_101ce67c]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    cmp edx, 2
    setne al
    dec eax
    and eax, 0xfdf1ff12
    add eax, 0x434f5441
    mov esi, eax
    jmp L1
    lea ebx, [ebx]
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 0x1019a370
    push 0x10193358
    push eax
    call sub_100f6d60
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6ca3
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push esi
    push 0xb5
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076a830]
FUN_1003c3a0 ENDP
END