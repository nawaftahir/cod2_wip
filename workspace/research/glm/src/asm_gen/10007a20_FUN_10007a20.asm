; FUN_10007a20 @ 0x10007a20 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce5b0:DWORD
    sub_100079ed PROTO C
.CODE
FUN_10007a20 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edi, dword ptr [g_101ce5b0]
    test edi, edi
    mov ebx, eax
    mov esi, ecx
    je L0
    mov eax, ebp
    call sub_100079ed
    test al, al
    jne L1
    test ebx, ebx
    je L2
    mov edi, dword ptr [ebp + 0x10]
    xor edx, edx
    test edi, edi
    jle L1
    mov ecx, dword ptr [ebp + 0x14]
    fld dword ptr [ecx + 8]
    fmul dword ptr [esi + 8]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [esi]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [esi + 0xc]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    je L3
    inc edx
    add ecx, 0xc
    cmp edx, edi
    jl L4
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
    add esi, 0x14
    dec ebx
    jne L5
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
FUN_10007a20 ENDP
END