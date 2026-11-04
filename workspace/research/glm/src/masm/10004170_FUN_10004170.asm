.686
.MODEL FLAT, C
EXTRN sub_10001958:PROC
EXTRN sub_1005A03A:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4C14:DWORD
EXTRN g_101AE384:DWORD
EXTRN g_101AE388:DWORD
EXTRN g_101AE49C:DWORD
.CODE
FUN_10004170 PROC
    sub esp, 8
    push ebx
    push ebp
    push esi
    push edi
    mov ebx, 16
    mov edx, 24
    mov esi, eax
    call sub_10001958
    mov ebx, dword ptr [esi + 4]
    mov edi, eax
    mov eax, dword ptr [esi]
    mov ebp, dword ptr [eax + 0000000CCh]
    mov ecx, edi
    imul ecx, ecx, 68
    push ecx
    add ebp, ebx
    call dword ptr [fp_101D49D4]
    add esp, 4
    test edi, edi
    mov esi, eax
    mov dword ptr [esp + 20], esi
    jle L1
    add ebp, 8
    add esi, 12
    mov dword ptr [esp + 16], edi
    mov edi, edi
L0:
    mov eax, dword ptr [ebp - 8]
    push eax
    call dword ptr [fp_101D4C14]
    mov edi, eax
    mov edx, dword ptr [edi]
    mov dword ptr [esi - 4], edx
    mov eax, dword ptr [edi + 4]
    mov dword ptr [esi], eax
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [esi + 4], ecx
    fld dword ptr [edi + 12]
    add esp, 4
    fchs
    fstp dword ptr [esi + 8]
    mov eax, dword ptr [esi - 4]
    test eax, eax
    mov eax, dword ptr [esi]
    setle dl
    dec dl
    and edx, 12
    test eax, eax
    setle al
    dec al
    and al, 12
    add al, 4
    mov byte ptr [esi + 13], al
    mov eax, dword ptr [esi + 4]
    test eax, eax
    setle cl
    mov byte ptr [esi + 12], dl
    dec cl
    and cl, 12
    add cl, 8
    mov byte ptr [esi + 14], cl
    mov edx, dword ptr [ebp - 4]
    mov ebx, dword ptr [g_101AE388]
    imul edx, edx, 60
    add edx, ebx
    mov dword ptr [esi + 16], edx
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [g_101AE49C]
    lea eax, [eax + eax*2]
    lea edx, [ecx + eax*4]
    mov dword ptr [esi + 20], edx
    mov al, byte ptr [ebp + 4]
    mov byte ptr [esi + 24], al
    lea ebx, [esi + 32]
    mov eax, ebx
    mov ecx, edi
    mov byte ptr [esi + 25], 0
    mov dword ptr [esi + 28], 0
    call sub_1005A03A
    mov eax, dword ptr [esp + 16]
    fld dword ptr [esi + 40]
    add ebp, 16
    fmul dword ptr [edi + 4]
    add esi, 68
    fld dword ptr [edi + 8]
    dec eax
    fmul dword ptr [esi - 32]
    mov dword ptr [esp + 16], eax
    fsubp st(1)
    fstp dword ptr [esi - 24]
    fld dword ptr [ebx]
    fmul dword ptr [edi + 8]
    fld dword ptr [edi]
    fmul dword ptr [esi - 28]
    fsubp st(1)
    fstp dword ptr [esi - 20]
    fld dword ptr [edi]
    fmul dword ptr [esi - 32]
    fld dword ptr [ebx]
    fmul dword ptr [edi + 4]
    fsubp st(1)
    fstp dword ptr [esi - 16]
    jne L0
    mov esi, dword ptr [esp + 20]
L1:
    mov eax, dword ptr [g_101AE384]
    xor ebx, ebx
    test eax, eax
    jle L5
    xor ecx, ecx
    nop
L2:
    mov edi, dword ptr [g_101AE388]
    mov eax, dword ptr [ecx + edi + 32]
    test eax, eax
    je L3
    mov edx, dword ptr [ecx + edi + 36]
    mov eax, 078787879h
    imul edx
    sar edx, 5
    mov eax, edx
    shr eax, 31
    add eax, edx
    imul eax, eax, 68
    add eax, esi
    jmp L4
L3:
    xor eax, eax
L4:
    mov dword ptr [ecx + edi + 36], eax
    mov eax, dword ptr [g_101AE384]
    inc ebx
    add ecx, 60
    cmp ebx, eax
    jl L2
L5:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10004170 ENDP
END
