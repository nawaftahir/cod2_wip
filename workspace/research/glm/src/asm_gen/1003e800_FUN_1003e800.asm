; FUN_1003e800 @ 0x1003e800 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_10766740:DWORD
    EXTRN g_10766744:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6cb3 PROTO C
    sub_100f6d70 PROTO C
.CODE
FUN_1003e800 PROC
    fld dword ptr [esp + 4]
    fld dword ptr [g_10766740]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L0
    fld dword ptr [esp + 8]
    fld dword ptr [g_10766744]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L1
    mov eax, dword ptr [esp + 4]
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [g_10766740], eax
    mov dword ptr [g_10766744], ecx
    lea esp, [esp]
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 0x10199178
    push 0x10193358
    push eax
    call sub_100f6d70
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6cb3
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push 0x10766730
    push eax
    call dword ptr [ecx + 0xbc]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L3
    ret
FUN_1003e800 ENDP
END