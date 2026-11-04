; FUN_10033a90 @ 0x10033a90 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d4810:DWORD
    EXTRN g_101d492d:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_10032ceb PROTO C
    sub_10032d30 PROTO C
    sub_10032e8f PROTO C
    sub_100f6ca3 PROTO C
    sub_100f6d5f PROTO C
.CODE
FUN_10033a90 PROC
    mov eax, dword ptr [g_101d4810]
    cmp eax, 3
    jne L0
    call sub_10032e8f
    jmp L1
    cmp eax, 1
    jne L1
    call sub_10032ceb
    call sub_10032d30
    mov byte ptr [g_101d492d], 1
    jmp L2
    lea esp, [esp]
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 0x10197ed8
    push 0x10193358
    push eax
    call sub_100f6d5f
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6ca3
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xa4]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L2
FUN_10033a90 ENDP
END