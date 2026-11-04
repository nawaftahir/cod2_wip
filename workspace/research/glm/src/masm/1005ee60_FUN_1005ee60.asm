.686
.MODEL FLAT, C
.CODE
FUN_1005ee60 PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    mov ecx, edx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, 1
    shl eax, cl
    push esi
    mov ecx, 8
    sub ecx, edx
    mov edx, dword ptr [ebp + 12]
    push edi
    xor edi, edi
    test eax, eax
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 4], ecx
    jle L3
    mov esi, ebx
    jmp L1
L0:
    mov ecx, dword ptr [ebp - 4]
L1:
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + edi*4]
    sar eax, cl
    cmp eax, edi
    jge L2
    mov ecx, dword ptr [esi]
    imul eax, edx
    mov dword ptr [ebp - 32], ecx
    mov ecx, dword ptr [esi + 4]
    lea eax, [ebx + eax*8]
    mov dword ptr [ebp - 28], ecx
    mov ecx, dword ptr [eax]
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [esi + 4], ecx
    mov ecx, dword ptr [ebp - 32]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 28]
    mov dword ptr [eax + 4], ecx
L2:
    lea eax, [edx*8]
    add esi, eax
    mov eax, dword ptr [ebp - 8]
    inc edi
    cmp edi, eax
    jl L0
L3:
    mov eax, dword ptr [ebp + 12]
    mov edi, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 8]
    lea eax, [eax*8]
    shr ecx, 2
    lea esi, [edi + eax]
L4:
    fld dword ptr [edi + 4]
    fld dword ptr [edi + eax*2]
    fld dword ptr [edi + eax*2 + 4]
    fld dword ptr [edi]
    fld dword ptr [edi]
    fld dword ptr [edi + eax*2]
    fxch st(1)
    fadd dword ptr [esi]
    fxch st(1)
    fadd dword ptr [esi + eax*2]
    fld st(1)
    fld st(1)
    faddp st(1)
    fxch st(2)
    fsubrp st(1)
    fxch st(1)
    fstp dword ptr [edi]
    fstp dword ptr [edi + eax*2]
    fld dword ptr [edi + 4]
    fld dword ptr [edi + eax*2 + 4]
    fxch st(1)
    fadd dword ptr [esi + 4]
    fxch st(1)
    fadd dword ptr [esi + eax*2 + 4]
    fld st(1)
    fld st(1)
    faddp st(1)
    fxch st(2)
    fsubrp st(1)
    fxch st(1)
    fstp dword ptr [edi + 4]
    fstp dword ptr [edi + eax*2 + 4]
    fsubr dword ptr [esi]
    fxch st(1)
    fsubr dword ptr [esi + eax*2 + 4]
    fld st(1)
    fld st(1)
    fsubp st(1)
    fxch st(2)
    faddp st(1)
    fxch st(1)
    fstp dword ptr [esi]
    fxch st(1)
    fsubr dword ptr [esi + eax*2]
    fxch st(1)
    fstp dword ptr [esi + eax*2]
    fxch st(1)
    fsubr dword ptr [esi + 4]
    fld st(1)
    fld st(1)
    faddp st(1)
    fxch st(2)
    fsubp st(1)
    fxch st(1)
    fstp dword ptr [esi + 4]
    fstp dword ptr [esi + eax*2 + 4]
    dec ecx
    lea edi, [edi + eax*4]
    lea esi, [esi + eax*4]
    jne L4
    mov eax, dword ptr [ebp - 8]
    mov ecx, 4
    cmp eax, ecx
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 4], 5
    jle L11
    jmp L6
L5:
    mov ecx, dword ptr [ebp - 12]
    nop
L6:
    xor esi, esi
    test ecx, ecx
    lea edi, [ecx + ecx]
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 20], esi
    jle L10
    imul eax, edx
    mov dword ptr [ebp - 16], eax
    xor edi, edi
    jmp L7
    lea ecx, [ecx]
L7:
    mov ecx, dword ptr [ebp - 4]
    mov eax, esi
    shl eax, cl
    mov ecx, dword ptr [ebp + 20]
    mov ecx, dword ptr [ecx + eax*8]
    mov dword ptr [ebp - 32], ecx
    mov ecx, dword ptr [ebp + 20]
    mov eax, dword ptr [ecx + eax*8 + 4]
    cmp edi, dword ptr [ebp - 16]
    mov dword ptr [ebp - 28], eax
    mov eax, edi
    jae L9
    mov ecx, dword ptr [ebp - 12]
    mov esi, dword ptr [ebp - 24]
    imul ecx, edx
    imul esi, edx
    add ecx, edi
    lea edx, [ebx + ecx*8]
L8:
    fld dword ptr [ebp - 32]
    lea ecx, [esi*8]
    fmul dword ptr [edx]
    fld dword ptr [ebp - 28]
    fmul dword ptr [edx + 4]
    fsubp st(1)
    fld dword ptr [ebp - 28]
    fmul dword ptr [edx]
    fld dword ptr [ebp - 32]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fld dword ptr [ebx + eax*8]
    fsub st(2)
    fstp dword ptr [edx]
    fld dword ptr [ebx + eax*8 + 4]
    fsub st(1)
    fstp dword ptr [edx + 4]
    add edx, ecx
    mov ecx, dword ptr [ebp - 16]
    fxch st(1)
    fadd dword ptr [ebx + eax*8]
    fstp dword ptr [ebx + eax*8]
    fadd dword ptr [ebx + eax*8 + 4]
    fstp dword ptr [ebx + eax*8 + 4]
    add eax, esi
    cmp eax, ecx
    jb L8
    mov edx, dword ptr [ebp + 12]
    mov esi, dword ptr [ebp - 20]
L9:
    mov eax, dword ptr [ebp - 12]
    inc esi
    add edi, edx
    cmp esi, eax
    mov dword ptr [ebp - 20], esi
    jl L7
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 24]
L10:
    mov esi, dword ptr [ebp - 4]
    dec esi
    cmp edi, eax
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 4], esi
    jl L5
L11:
    pop edi
    pop esi
    pop ebx
FUN_1005ee60 ENDP
END
