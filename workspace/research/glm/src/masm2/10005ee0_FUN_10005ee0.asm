.686
.MODEL FLAT, C
EXTRN sub_100061D4:PROC
EXTRN sub_100061ED:PROC
EXTRN sub_100062D6:PROC
EXTRN sub_1000637A:PROC
EXTRN sub_1000637F:PROC
EXTRN sub_100063F2:PROC
EXTRN sub_1000640F:PROC
EXTRN sub_100592BD:PROC
EXTRN sub_10059378:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
.CODE
FUN_10005ee0 PROC
    fld fld dword ptr [g_1019BC84]
    mov mov edx, dword ptr [esp + 4]
    fld fld dword ptr [g_101CE5DC]
    sub sub esp, 0624h
    push push ebx
    fucompp fucompp
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    fnstsw fnstsw ax
    test test ah, 68
    jnp L2
    xor xor esi, esi
    cmp cmp edx, 4
    jl L0
    lea lea ebp, [esp + 52]
    sub sub ebp, edi
    mov mov dword ptr [esp + 36], ebp
    lea lea ebp, [esp + 60]
    sub sub ebp, edi
    mov mov dword ptr [esp + 20], ebp
    lea lea ebp, [esp + 64]
    sub sub ebp, edi
    mov mov dword ptr [esp + 24], ebp
    lea lea ebp, [esp + 44]
    sub sub ebp, edi
    mov mov dword ptr [esp + 16], ebp
    lea lea ecx, [esp + 48]
    add add edx, -4
    lea lea esi, [esp + 40]
    mov mov ebx, ecx
    lea lea ebp, [esp + 56]
    sub sub ebp, edi
    shr shr edx, 2
    sub sub esi, edi
    sub sub ebx, edi
    inc inc edx
    mov mov dword ptr [esp + 28], ebp
    lea lea ebp, [edx*4]
    lea lea eax, [edi + 20]
    mov mov dword ptr [esp + 32], ebp
    lea lea esp, [esp]
    fld fld dword ptr [eax - 20]
    mov mov ebp, dword ptr [esp + 16]
    fsub fsub dword ptr [g_101CE5D0]
    add add ecx, 48
    add add eax, 48
    dec dec edx
    fstp fstp dword ptr [ecx - 56]
    fld fld dword ptr [eax - 64]
    fsub fsub dword ptr [g_101CE5D4]
    fstp fstp dword ptr [ecx - 52]
    fld fld dword ptr [eax - 60]
    fsub fsub dword ptr [g_101CE5D8]
    fstp fstp dword ptr [ecx - 48]
    fld fld dword ptr [eax - 56]
    fsub fsub dword ptr [g_101CE5D0]
    fstp fstp dword ptr [ecx - 44]
    fld fld dword ptr [eax - 52]
    fsub fsub dword ptr [g_101CE5D4]
    fstp fstp dword ptr [ecx - 40]
    fld fld dword ptr [eax - 48]
    fsub fsub dword ptr [g_101CE5D8]
    fstp fstp dword ptr [esi + eax - 48]
    fld fld dword ptr [eax - 44]
    fsub fsub dword ptr [g_101CE5D0]
    fstp fstp dword ptr [eax + ebp - 48]
    mov mov ebp, dword ptr [esp + 36]
    fld fld dword ptr [eax - 40]
    fsub fsub dword ptr [g_101CE5D4]
    fstp fstp dword ptr [ebx + eax - 48]
    fld fld dword ptr [eax - 36]
    fsub fsub dword ptr [g_101CE5D8]
    fstp fstp dword ptr [eax + ebp - 48]
    mov mov ebp, dword ptr [esp + 28]
    fld fld dword ptr [eax - 32]
    fsub fsub dword ptr [g_101CE5D0]
    fstp fstp dword ptr [eax + ebp - 48]
    mov mov ebp, dword ptr [esp + 20]
    fld fld dword ptr [eax - 28]
    fsub fsub dword ptr [g_101CE5D4]
    fstp fstp dword ptr [eax + ebp - 48]
    mov mov ebp, dword ptr [esp + 24]
    fld fld dword ptr [eax - 24]
    fsub fsub dword ptr [g_101CE5D8]
    fstp fstp dword ptr [eax + ebp - 48]
    jne L1
    mov mov esi, dword ptr [esp + 32]
    mov mov edx, dword ptr [esp + 0638h]
    cmp cmp esi, edx
    jge sub_100061D4
    lea lea ecx, [esi + esi*2]
    shl shl ecx, 2
    lea lea eax, [esp + ecx + 48]
    lea lea edi, [ecx + edi + 8]
    mov mov ecx, edx
    sub sub ecx, esi
    lea lea esp, [esp]
    fld fld dword ptr [edi - 8]
    add add eax, 12
    fsub fsub dword ptr [g_101CE5D0]
    add add edi, 12
    dec dec ecx
    fstp fstp dword ptr [eax - 20]
    fld fld dword ptr [edi - 16]
    fsub fsub dword ptr [g_101CE5D4]
    fstp fstp dword ptr [eax - 16]
    fld fld dword ptr [edi - 12]
    fsub fsub dword ptr [g_101CE5D8]
    fstp fstp dword ptr [eax - 12]
    jne sub_100061ED
    test test edx, edx
    mov mov ecx, dword ptr [esp + 40]
    lea lea eax, [edx + edx*2]
    lea lea eax, [esp + eax*4 + 40]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 44]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esp + 48]
    mov mov dword ptr [eax + 8], ecx
    jle sub_1000637F
    mov mov ebp, dword ptr [esp + 063Ch]
    lea lea edi, [esp + 48]
    mov mov eax, edi
    lea lea ebx, [ebp + 8]
    sub sub ebp, eax
    mov mov dword ptr [esp + 16], edx
    fld fld dword ptr [edi]
L1:
    lea lea esi, [edi + ebp]
    fmul fmul dword ptr [edi + 8]
    fld fld dword ptr [edi + 12]
    fmul fmul dword ptr [edi - 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi]
    fld fld dword ptr [edi + 12]
    fmul fmul dword ptr [edi - 8]
    fld fld dword ptr [edi]
    fmul fmul dword ptr [edi + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx - 4]
    fld fld dword ptr [edi - 4]
    fmul fmul dword ptr [edi + 4]
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [edi - 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx]
    call sub_100592BD
    mov mov eax, dword ptr [esp + 16]
    fstp fstp st(0)
    add add edi, 12
    add add ebx, 12
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne sub_100062D6
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0624h
    ret ret
    test test edx, edx
    jle sub_100063F2
    lea lea eax, [edx + edx*2 - 3]
    mov mov ebp, -8
    shl shl eax, 2
    lea lea ebx, [edi + 8]
    sub sub ebp, edi
    mov mov dword ptr [esp + 16], edx
    jmp sub_1000637A
    lea lea ebx, [ebx]
    fld fld dword ptr [ebx - 8]
    mov mov ecx, dword ptr [esp + 063Ch]
    fsub fsub dword ptr [eax + edi]
    lea lea esi, [eax + ecx]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [ebx - 4]
    fsub fsub dword ptr [eax + edi + 4]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [ebx]
    fsub fsub dword ptr [eax + edi + 8]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [g_101CE5D4]
    fmul fmul dword ptr [esp + 48]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [esp + 44]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [esp + 40]
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [esp + 48]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [esp + 44]
    fld fld dword ptr [g_101CE5D4]
    fmul fmul dword ptr [esp + 40]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 8]
    call sub_10059378
    mov mov ecx, dword ptr [esp + 16]
    fstp fstp st(0)
    lea lea eax, [ebx + ebp]
    add add ebx, 12
    dec dec ecx
    mov mov dword ptr [esp + 16], ecx
    jne sub_1000640F
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_10005ee0 ENDP
END
