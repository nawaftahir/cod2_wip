.686
.MODEL FLAT, C
EXTRN sub_1005E0E3:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD90:DWORD:DWORD
EXTRN EXTRN g_1019BD98:DWORD:DWORD
.CODE
FUN_1005df90 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 80
    mov mov edx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 8]
    push push esi
    mov mov esi, edx
    mov mov dword ptr [esp + 40], edx
    mov mov edx, 2
    push push edi
    mov mov edi, eax
    mov mov dword ptr [esp + 48], eax
    mov mov eax, 1
    mov mov dword ptr [esp + 68], edx
    mov mov dword ptr [esp + 72], edx
    xor xor edx, edx
    mov mov dword ptr [esp + 40], ecx
    mov mov dword ptr [esp + 52], ecx
    mov mov dword ptr [esp + 56], esi
    mov mov dword ptr [esp + 60], edi
    mov mov dword ptr [esp + 64], eax
    mov mov dword ptr [esp + 76], edx
    mov mov dword ptr [esp + 80], edx
    mov mov dword ptr [esp + 84], eax
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [ebx + edx*4]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1005E0E3
    fld fld dword ptr [ebx + edx*4]
    lea lea eax, [esp + 16]
    fmul fmul dword ptr [g_1019BD98]
    lea lea ecx, [esp + 24]
    mov mov dword ptr [esp + 12], eax
    mov mov dword ptr [esp + 8], ecx
    fdiv fdiv qword ptr [g_1019BD90]
    fstp fstp qword ptr [esp + 32]
    push push eax
    push push ecx
    fld fld qword ptr [esp + 40]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 16]
    fstp fstp qword ptr [ecx]
    fstp fstp qword ptr [eax]
    pop pop ecx
    pop pop eax
    mov mov eax, dword ptr [esp + edx*8 + 64]
    mov mov ecx, dword ptr [esp + edx*8 + 68]
    shl shl eax, 2
    fld fld dword ptr [esp + eax + 40]
    lea lea esi, [esp + eax + 40]
    fmul fmul qword ptr [esp + 16]
    shl shl ecx, 2
    fld fld dword ptr [esp + ecx + 40]
    fmul fmul qword ptr [esp + 24]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + eax + 52]
    fld fld dword ptr [esp + ecx + 40]
    fmul fmul qword ptr [esp + 16]
    fld fld dword ptr [esi]
    fmul fmul qword ptr [esp + 24]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + ecx + 52]
    mov mov esi, dword ptr [esp + 56]
    mov mov ecx, dword ptr [esp + 52]
    mov mov edi, dword ptr [esp + 60]
    inc inc edx
    cmp cmp edx, 3
    mov mov dword ptr [esp + 40], ecx
    mov mov dword ptr [esp + 44], esi
    mov mov dword ptr [esp + 48], edi
    jl sub_1005E0E3
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [eax + 8], edi
    pop pop edi
    mov mov dword ptr [eax + 4], esi
    mov mov dword ptr [eax], ecx
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1005df90 ENDP
END
