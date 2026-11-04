; FUN_10024920 @ 0x10024920 — auto-synthesized
    EXTRN g_1019bd54:DWORD
    EXTRN g_101ce798:DWORD
    EXTRN g_101d61b8:DWORD
    EXTRN g_101d61b9:DWORD
    EXTRN g_101d61ba:DWORD
    EXTRN g_101d61c8:DWORD
.CODE
FUN_10024920 PROC
    push ecx
    mov cl, byte ptr [g_101d61c8]
    test cl, cl
    je L0
    movzx ecx, byte ptr [g_101d61ba]
    mov dword ptr [esp], ecx
    fild dword ptr [esp]
    fmul dword ptr [g_1019bd54]
    fstp dword ptr [eax]
    movzx edx, byte ptr [g_101d61b9]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr [g_1019bd54]
    fstp dword ptr [eax + 4]
    movzx ecx, byte ptr [g_101d61b8]
    mov dword ptr [esp], ecx
    mov dword ptr [eax + 0xc], 0x3f800000
    fild dword ptr [esp]
    fmul dword ptr [g_1019bd54]
    fstp dword ptr [eax + 8]
    pop ecx
    ret
    mov ecx, dword ptr [g_101ce798]
    movzx edx, byte ptr [ecx + 8]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr [g_1019bd54]
    fstp dword ptr [eax]
    movzx edx, byte ptr [ecx + 9]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr [g_1019bd54]
    fstp dword ptr [eax + 4]
    movzx ecx, byte ptr [ecx + 0xa]
    mov dword ptr [esp], ecx
    mov dword ptr [eax + 0xc], 0x3f800000
    fild dword ptr [esp]
    fmul dword ptr [g_1019bd54]
    fstp dword ptr [eax + 8]
    pop ecx
    ret
FUN_10024920 ENDP
END