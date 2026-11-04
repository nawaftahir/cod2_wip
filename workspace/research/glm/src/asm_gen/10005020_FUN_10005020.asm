; FUN_10005020 @ 0x10005020 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c73 PROTO C
    sub_100f6d2f PROTO C
.CODE
FUN_10005020 PROC
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x10191b04
    push 0x10193358
    push eax
    call sub_100f6d2f
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6c73
    add esp, 0x10
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx + 0x30]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    ret
FUN_10005020 ENDP
END