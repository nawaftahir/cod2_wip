.686
.MODEL FLAT, C
EXTRN sub_10058FC7:PROC
EXTRN sub_1005D8F2:PROC
EXTRN sub_1005D90D:PROC
EXTRN sub_1005D97C:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1005d800 PROC
    sub sub esp, 28
    push push ebx
    mov mov ebx, dword ptr [esp + 36]
    push push ebp
    push push esi
    lea lea edx, [esp + 20]
    lea lea esi, [esp + 12]
    call sub_10058FC7
    xor xor esi, esi
    cmp cmp ebx, esi
    mov mov dword ptr [esp + 16], esi
    jle sub_1005D8F2
    mov mov ecx, dword ptr [esp + 12]
    mov mov edx, dword ptr [esp + 20]
    lea lea eax, [ebx + ebx*2 - 3]
    mov mov dword ptr [esp + 12], esi
    shl shl eax, 2
    lea lea ebx, [edi + ecx*4]
    lea lea esi, [edi + edx*4]
    mov mov edi, edi
    fld fld dword ptr [esi]
    lea lea ebp, [eax + edx*4]
    fsub fsub dword ptr [edi + ebp]
    lea lea ebp, [eax + ecx*4]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [edi + ebp]
    mov mov ebp, dword ptr [esp + 48]
    fsub fsub dword ptr [ebx]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [ebp + ecx*4]
    lea lea ebp, [eax + ecx*4]
    fsub fsub dword ptr [edi + ebp]
    mov mov ebp, dword ptr [esp + 48]
    lea lea eax, [eax + edx*4]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [ebp + edx*4]
    fsub fsub dword ptr [eax + edi]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 36]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 32]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_1005D97C
    mov mov ebp, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 12]
    inc inc ebp
    mov mov dword ptr [esp + 16], ebp
    mov mov ebp, eax
    add add ebp, 12
    mov mov dword ptr [esp + 12], ebp
    mov mov ebp, dword ptr [esp + 44]
    add add esi, 12
    add add ebx, 12
    cmp cmp dword ptr [esp + 16], ebp
    jl sub_1005D90D
    pop pop esi
    pop pop ebp
    mov mov eax, 1
    pop pop ebx
    add add esp, 28
    ret ret
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 28
    ret ret
FUN_1005d800 ENDP
END
