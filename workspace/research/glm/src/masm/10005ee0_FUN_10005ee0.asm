.686
.MODEL FLAT, C
EXTRN sub_100592BD:PROC
EXTRN sub_10059378:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
.CODE
FUN_10005ee0 PROC
    fld dword ptr [g_1019BC84]
    mov edx, dword ptr [esp + 4]
    fld dword ptr [g_101CE5DC]
    sub esp, 000000624h
    push ebx
    fucompp
    push ebp
    push esi
    push edi
    mov edi, eax
    fnstsw ax
    test ah, 68
    jnp L5
    xor esi, esi
    cmp edx, 4
    jl L1
    lea ebp, [esp + 52]
    sub ebp, edi
    mov dword ptr [esp + 36], ebp
    lea ebp, [esp + 60]
    sub ebp, edi
    mov dword ptr [esp + 20], ebp
    lea ebp, [esp + 64]
    sub ebp, edi
    mov dword ptr [esp + 24], ebp
    lea ebp, [esp + 44]
    sub ebp, edi
    mov dword ptr [esp + 16], ebp
    lea ecx, [esp + 48]
    add edx, -4
    lea esi, [esp + 40]
    mov ebx, ecx
    lea ebp, [esp + 56]
    sub ebp, edi
    shr edx, 2
    sub esi, edi
    sub ebx, edi
    inc edx
    mov dword ptr [esp + 28], ebp
    lea ebp, [edx*4]
    lea eax, [edi + 20]
    mov dword ptr [esp + 32], ebp
    lea esp, [esp]
L0:
    fld dword ptr [eax - 20]
    mov ebp, dword ptr [esp + 16]
    fsub dword ptr [g_101CE5D0]
    add ecx, 48
    add eax, 48
    dec edx
    fstp dword ptr [ecx - 56]
    fld dword ptr [eax - 64]
    fsub dword ptr [g_101CE5D4]
    fstp dword ptr [ecx - 52]
    fld dword ptr [eax - 60]
    fsub dword ptr [g_101CE5D8]
    fstp dword ptr [ecx - 48]
    fld dword ptr [eax - 56]
    fsub dword ptr [g_101CE5D0]
    fstp dword ptr [ecx - 44]
    fld dword ptr [eax - 52]
    fsub dword ptr [g_101CE5D4]
    fstp dword ptr [ecx - 40]
    fld dword ptr [eax - 48]
    fsub dword ptr [g_101CE5D8]
    fstp dword ptr [esi + eax - 48]
    fld dword ptr [eax - 44]
    fsub dword ptr [g_101CE5D0]
    fstp dword ptr [eax + ebp - 48]
    mov ebp, dword ptr [esp + 36]
    fld dword ptr [eax - 40]
    fsub dword ptr [g_101CE5D4]
    fstp dword ptr [ebx + eax - 48]
    fld dword ptr [eax - 36]
    fsub dword ptr [g_101CE5D8]
    fstp dword ptr [eax + ebp - 48]
    mov ebp, dword ptr [esp + 28]
    fld dword ptr [eax - 32]
    fsub dword ptr [g_101CE5D0]
    fstp dword ptr [eax + ebp - 48]
    mov ebp, dword ptr [esp + 20]
    fld dword ptr [eax - 28]
    fsub dword ptr [g_101CE5D4]
    fstp dword ptr [eax + ebp - 48]
    mov ebp, dword ptr [esp + 24]
    fld dword ptr [eax - 24]
    fsub dword ptr [g_101CE5D8]
    fstp dword ptr [eax + ebp - 48]
    jne L0
    mov esi, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 000000638h]
L1:
    cmp esi, edx
    jge L3
    lea ecx, [esi + esi*2]
    shl ecx, 2
    lea eax, [esp + ecx + 48]
    lea edi, [ecx + edi + 8]
    mov ecx, edx
    sub ecx, esi
    lea esp, [esp]
L2:
    fld dword ptr [edi - 8]
    add eax, 12
    fsub dword ptr [g_101CE5D0]
    add edi, 12
    dec ecx
    fstp dword ptr [eax - 20]
    fld dword ptr [edi - 16]
    fsub dword ptr [g_101CE5D4]
    fstp dword ptr [eax - 16]
    fld dword ptr [edi - 12]
    fsub dword ptr [g_101CE5D8]
    fstp dword ptr [eax - 12]
    jne L2
L3:
    test edx, edx
    mov ecx, dword ptr [esp + 40]
    lea eax, [edx + edx*2]
    lea eax, [esp + eax*4 + 40]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 44]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [eax + 8], ecx
    jle L7
    mov ebp, dword ptr [esp + 00000063Ch]
    lea edi, [esp + 48]
    mov eax, edi
    lea ebx, [ebp + 8]
    sub ebp, eax
    mov dword ptr [esp + 16], edx
L4:
    fld dword ptr [edi]
    lea esi, [edi + ebp]
    fmul dword ptr [edi + 8]
    fld dword ptr [edi + 12]
    fmul dword ptr [edi - 4]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [edi + 12]
    fmul dword ptr [edi - 8]
    fld dword ptr [edi]
    fmul dword ptr [edi + 4]
    fsubp st(1)
    fstp dword ptr [ebx - 4]
    fld dword ptr [edi - 4]
    fmul dword ptr [edi + 4]
    fld dword ptr [edi + 8]
    fmul dword ptr [edi - 8]
    fsubp st(1)
    fstp dword ptr [ebx]
    call sub_100592BD
    mov eax, dword ptr [esp + 16]
    fstp st(0)
    add edi, 12
    add ebx, 12
    dec eax
    mov dword ptr [esp + 16], eax
    jne L4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000624h
    ret
L5:
    test edx, edx
    jle L7
    lea eax, [edx + edx*2 - 3]
    mov ebp, 0FFFFFFF8h
    shl eax, 2
    lea ebx, [edi + 8]
    sub ebp, edi
    mov dword ptr [esp + 16], edx
    jmp L6
    lea ebx, [ebx]
L6:
    fld dword ptr [ebx - 8]
    mov ecx, dword ptr [esp + 00000063Ch]
    fsub dword ptr [eax + edi]
    lea esi, [eax + ecx]
    fstp dword ptr [esp + 40]
    fld dword ptr [ebx - 4]
    fsub dword ptr [eax + edi + 4]
    fstp dword ptr [esp + 44]
    fld dword ptr [ebx]
    fsub dword ptr [eax + edi + 8]
    fstp dword ptr [esp + 48]
    fld dword ptr [g_101CE5D4]
    fmul dword ptr [esp + 48]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [esp + 44]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [esp + 40]
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [esp + 48]
    fsubp st(1)
    fstp dword ptr [esi + 4]
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [esp + 44]
    fld dword ptr [g_101CE5D4]
    fmul dword ptr [esp + 40]
    fsubp st(1)
    fstp dword ptr [esi + 8]
    call sub_10059378
    mov ecx, dword ptr [esp + 16]
    fstp st(0)
    lea eax, [ebx + ebp]
    add ebx, 12
    dec ecx
    mov dword ptr [esp + 16], ecx
    jne L6
L7:
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10005ee0 ENDP
END
