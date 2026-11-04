; FUN_1002eaa0 @ 0x1002eaa0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_10766728:DWORD
    EXTRN g_1076a830:DWORD
    sub_1000d4b8 PROTO C
    sub_100f6c83 PROTO C
    sub_100f6ce3 PROTO C
    sub_100f6d3f PROTO C
    sub_100f6da0 PROTO C
.CODE
FUN_1002eaa0 PROC
    push esi
    mov esi, eax
    call sub_1000d4b8
    mov esi, eax
    lea ebx, [ebx]
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x101980c8
    push 0x10193358
    push eax
    call sub_100f6d3f
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6c83
    add esp, 0x10
    mov ecx, dword ptr [g_10766728]
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push 2
    push 0
    push esi
    push 0
    push ecx
    push eax
    call dword ptr [edx + 0x88]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    mov edi, edi
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 0x101980ac
    push 0x10193358
    push eax
    call sub_100f6da0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6ce3
    add esp, 0x10
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx + 8]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L3
    pop esi
    ret
FUN_1002eaa0 ENDP
END