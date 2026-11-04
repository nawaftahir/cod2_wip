; FUN_10038590 @ 0x10038590 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_107667c0:DWORD
    EXTRN g_107667c4:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c84 PROTO C
    sub_100f6d40 PROTO C
.CODE
FUN_10038590 PROC
    mov eax, dword ptr [g_107667c0]
    test eax, eax
    jne L0
    cmp dword ptr [g_107667c4], esi
    je L1
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 0x10198f10
    push 0x10193358
    push eax
    call sub_100f6d40
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6c84
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push esi
    push eax
    call dword ptr [edx + 0x164]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L0
    mov dword ptr [g_107667c4], esi
    mov dword ptr [g_107667c0], 0
    ret
FUN_10038590 ENDP
END