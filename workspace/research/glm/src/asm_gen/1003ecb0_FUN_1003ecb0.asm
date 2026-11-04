; FUN_1003ecb0 @ 0x1003ecb0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076674c:DWORD
    EXTRN g_1076675c:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c84 PROTO C
    sub_100f6d40 PROTO C
.CODE
FUN_1003ecb0 PROC
    mov eax, dword ptr [g_1076674c]
    mov dword ptr [g_1076675c], eax
    mov dword ptr [g_1076674c], esi
    mov ecx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x1019903c
    push 0x10193358
    push eax
    call sub_100f6d40
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100f6c84
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push esi
    push eax
    call dword ptr [ecx + 0x1a0]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    mov dword ptr [g_1076675c], 0
    ret
FUN_1003ecb0 ENDP
END