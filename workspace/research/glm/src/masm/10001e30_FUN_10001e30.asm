.686
.MODEL FLAT, C
EXTRN sub_10001FB1:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
.CODE
FUN_10001e30 PROC
    sub esp, 52
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 64]
    xor eax, eax
    test edx, edx
    push esi
    jle sub_10001FB1
    xor esi, esi
    mov dword ptr [esp + 16], esi
    mov dword ptr [esp + 20], edx
    mov edi, edi
    test ebp, ebp
    jle L4
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 40]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 48]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 56]
    jmp L0
    lea esp, [esp]
    nop
L0:
    mov edx, dword ptr [ecx + 12]
    movzx edx, byte ptr [edx + esi]
    mov dword ptr [esp + 12], edx
    mov edx, dword ptr [ecx]
    movzx edx, byte ptr [edx + eax]
    fild dword ptr [esp + 12]
    mov dword ptr [esp + 24], edx
    fstp dword ptr [esp + 12]
    fild dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fmul dword ptr [edi]
    faddp st(1)
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 40]
    fistp dword ptr [esp + 28]
    mov edx, dword ptr [ecx + 4]
    movzx edx, byte ptr [edx + eax]
    mov dword ptr [esp + 24], edx
    fild dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fmul dword ptr [edi + 4]
    faddp st(1)
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 48]
    fistp dword ptr [esp + 32]
    mov edx, dword ptr [ecx + 8]
    movzx edx, byte ptr [edx + eax]
    mov dword ptr [esp + 24], edx
    fild dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 36]
    mov edx, dword ptr [esp + 28]
    lea ebx, [edx - 0000000FFh]
    test ebx, ebx
    jl L1
    mov edx, 0000000FFh
L1:
    mov ebx, dword ptr [ecx]
    mov byte ptr [ebx + eax + 2], dl
    mov edx, dword ptr [esp + 32]
    lea ebx, [edx - 0000000FFh]
    test ebx, ebx
    jl L2
    mov edx, 0000000FFh
L2:
    mov ebx, dword ptr [ecx]
    mov byte ptr [ebx + eax + 1], dl
    mov edx, dword ptr [esp + 36]
    lea ebx, [edx - 0000000FFh]
    test ebx, ebx
    jl L3
    mov edx, 0000000FFh
L3:
    mov ebx, dword ptr [ecx]
    mov byte ptr [eax + ebx], dl
    mov edx, dword ptr [ecx]
    mov byte ptr [edx + eax + 3], 0000000FFh
    add eax, 4
    add esi, 2
    dec ebp
    jne L0
    mov ebp, dword ptr [esp + 68]
L4:
    mov esi, dword ptr [esp + 16]
    lea edx, [ebp*4]
    add esi, edx
    mov edx, dword ptr [esp + 20]
    dec edx
    mov dword ptr [esp + 16], esi
    mov dword ptr [esp + 20], edx
FUN_10001e30 ENDP
END
