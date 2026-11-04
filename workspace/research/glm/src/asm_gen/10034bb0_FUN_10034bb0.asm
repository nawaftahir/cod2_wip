; FUN_10034bb0 @ 0x10034bb0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d620c:DWORD
    EXTRN g_1072dec8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_10766680:DWORD
    EXTRN g_107667d8:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6cb5 PROTO C
    sub_100f6d72 PROTO C
.CODE
FUN_10034bb0 PROC
    push ecx
    mov ecx, dword ptr [g_101d620c]
    test ecx, ecx
    je L0
    test eax, eax
    jne L1
    mov eax, dword ptr [g_10766680]
    and al, 0xf0
    cmp al, 0x20
    je L2
    mov ecx, dword ptr [g_1072dec8]
    mov dword ptr [esp], ecx
    mov eax, dword ptr [g_107667d8]
    mov byte ptr [esp + 3], 0xff
    push esi
    mov esi, dword ptr [esp + 4]
    cmp eax, esi
    je L3
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L4
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L4
    push 0x101981e0
    push 0x10193358
    push eax
    call sub_100f6d72
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6cb5
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push esi
    push 0x22
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L5
    mov dword ptr [g_107667d8], esi
    pop esi
    pop ecx
    ret
    cmp eax, 2
    jne L6
    mov dword ptr [esp], 0
    jmp L7
FUN_10034bb0 ENDP
END