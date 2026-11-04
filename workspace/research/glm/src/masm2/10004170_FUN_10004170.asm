.686
.MODEL FLAT, C
EXTRN sub_10001958:PROC
EXTRN sub_10004428:PROC
EXTRN sub_1000442A:PROC
EXTRN sub_1000442D:PROC
EXTRN sub_10004446:PROC
EXTRN sub_1005A03A:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4C14:DWORD:DWORD
EXTRN EXTRN g_101AE384:DWORD:DWORD
EXTRN EXTRN g_101AE388:DWORD:DWORD
EXTRN EXTRN g_101AE49C:DWORD:DWORD
.CODE
FUN_10004170 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov ebx, 16
    mov mov edx, 24
    mov mov esi, eax
    call sub_10001958
    mov mov ebx, dword ptr [esi + 4]
    mov mov edi, eax
    mov mov eax, dword ptr [esi]
    mov mov ebp, dword ptr [eax + 0CCh]
    mov mov ecx, edi
    imul imul ecx, ecx, 68
    push push ecx
    add add ebp, ebx
    call dword ptr [fp_101D49D4]
    add add esp, 4
    test test edi, edi
    mov mov esi, eax
    mov mov dword ptr [esp + 20], esi
    jle L0
    add add ebp, 8
    add add esi, 12
    mov mov dword ptr [esp + 16], edi
    mov mov edi, edi
    mov mov eax, dword ptr [ebp - 8]
    push push eax
    call dword ptr [fp_101D4C14]
    mov mov edi, eax
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [esi - 4], edx
    mov mov eax, dword ptr [edi + 4]
    mov mov dword ptr [esi], eax
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [esi + 4], ecx
    fld fld dword ptr [edi + 12]
    add add esp, 4
    fchs fchs
    fstp fstp dword ptr [esi + 8]
    mov mov eax, dword ptr [esi - 4]
    test test eax, eax
    mov mov eax, dword ptr [esi]
    setle setle dl
    dec dec dl
    and and edx, 12
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    add add al, 4
    mov mov byte ptr [esi + 13], al
    mov mov eax, dword ptr [esi + 4]
    test test eax, eax
    setle setle cl
    mov mov byte ptr [esi + 12], dl
    dec dec cl
    and and cl, 12
    add add cl, 8
    mov mov byte ptr [esi + 14], cl
    mov mov edx, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [g_101AE388]
    imul imul edx, edx, 60
    add add edx, ebx
    mov mov dword ptr [esi + 16], edx
    mov mov eax, dword ptr [ebp]
    mov mov ecx, dword ptr [g_101AE49C]
    lea lea eax, [eax + eax*2]
    lea lea edx, [ecx + eax*4]
    mov mov dword ptr [esi + 20], edx
    mov mov al, byte ptr [ebp + 4]
    mov mov byte ptr [esi + 24], al
    lea lea ebx, [esi + 32]
    mov mov eax, ebx
    mov mov ecx, edi
    mov mov byte ptr [esi + 25], 0
    mov mov dword ptr [esi + 28], 0
    call sub_1005A03A
    mov mov eax, dword ptr [esp + 16]
    fld fld dword ptr [esi + 40]
    add add ebp, 16
    fmul fmul dword ptr [edi + 4]
    add add esi, 68
    fld fld dword ptr [edi + 8]
    dec dec eax
    fmul fmul dword ptr [esi - 32]
    mov mov dword ptr [esp + 16], eax
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi - 24]
    fld fld dword ptr [ebx]
    fmul fmul dword ptr [edi + 8]
    fld fld dword ptr [edi]
    fmul fmul dword ptr [esi - 28]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi - 20]
    fld fld dword ptr [edi]
    fmul fmul dword ptr [esi - 32]
    fld fld dword ptr [ebx]
    fmul fmul dword ptr [edi + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi - 16]
    jne L1
    mov mov esi, dword ptr [esp + 20]
    mov mov eax, dword ptr [g_101AE384]
    xor xor ebx, ebx
    test test eax, eax
    jle sub_1000442A
    xor xor ecx, ecx
    nop nop
    mov mov edi, dword ptr [g_101AE388]
    mov mov eax, dword ptr [ecx + edi + 32]
    test test eax, eax
    je sub_10004428
    mov mov edx, dword ptr [ecx + edi + 36]
    mov mov eax, 078787879h
    imul imul edx
    sar sar edx, 5
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    imul imul eax, eax, 68
    add add eax, esi
    jmp sub_10004446
    xor xor eax, eax
    mov mov dword ptr [ecx + edi + 36], eax
    mov mov eax, dword ptr [g_101AE384]
    inc inc ebx
L0:
    add add ecx, 60
    cmp cmp ebx, eax
    jl sub_1000442D
    pop pop edi
L1:
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10004170 ENDP
END
