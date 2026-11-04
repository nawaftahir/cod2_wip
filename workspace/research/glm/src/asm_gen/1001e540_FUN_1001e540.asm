; FUN_1001e540 @ 0x1001e540 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d49b0:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c95 PROTO C
    sub_100f6d52 PROTO C
.CODE
FUN_1001e540 PROC
    mov eax, dword ptr [g_101d49b0]
    test eax, eax
    je L0
    mov eax, dword ptr [g_101da9c8]
    mov dword ptr [g_101d49b0], 0
    mov ecx, dword ptr [eax + 0x217c78]
    push esi
    mov esi, dword ptr [ecx + 8]
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 0x10191b04
    push 0x10193358
    push eax
    call sub_100f6d52
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6c95
    add esp, 0x10
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx + 0x30]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L2
    pop esi
    ret
FUN_1001e540 ENDP
END