; FUN_1000d4b0 @ 0x1000d4b0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c74 PROTO C
    sub_100f6d30 PROTO C
.CODE
FUN_1000d4b0 PROC
    push ecx
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x10193510
    push 0x10193358
    push eax
    call sub_100f6d30
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6c74
    add esp, 0x10
    mov eax, dword ptr [esi + 4]
    mov edx, dword ptr [eax]
    lea ecx, [esp]
    push ecx
    push 0
    push eax
    call dword ptr [edx + 0x48]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    mov eax, dword ptr [esp]
    pop ecx
    ret
FUN_1000d4b0 ENDP
END