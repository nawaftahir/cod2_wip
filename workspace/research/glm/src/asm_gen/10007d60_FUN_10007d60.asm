; FUN_10007d60 @ 0x10007d60 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101d1b9c:DWORD
    sub_100138d5 PROTO C
.CODE
FUN_10007d60 PROC
    mov eax, dword ptr [g_101d1b9c]
    test eax, eax
    jne L0
    push 0x101925cc
    push 1
    call sub_100138d5
    add esp, 8
    mov eax, dword ptr [g_101d1b9c]
    mov ecx, dword ptr [eax + 0xc]
    cmp dword ptr [ecx], -1
    jne L1
    mov eax, dword ptr [ecx + 0xc]
    fld dword ptr [eax + 8]
    fmul dword ptr [esi + 8]
    fld dword ptr [eax + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [eax]
    fmul dword ptr [esi]
    faddp st(1)
    fsub dword ptr [eax + 0xc]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jne L2
    mov ecx, dword ptr [ecx + 0x10]
    jmp L3
    mov ecx, dword ptr [ecx + 0x14]
    cmp dword ptr [ecx], -1
    je L4
    mov eax, dword ptr [ecx + 8]
    ret
FUN_10007d60 ENDP
END