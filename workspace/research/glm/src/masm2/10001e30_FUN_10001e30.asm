.686
.MODEL FLAT, C
EXTRN sub_10001FA5:PROC
EXTRN sub_10001FB1:PROC
EXTRN sub_10001FC9:PROC
EXTRN sub_10002027:PROC
EXTRN sub_10002059:PROC
EXTRN sub_1000208B:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
.CODE
FUN_10001e30 PROC
    sub sub esp, 52
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 64]
    xor xor eax, eax
    test test edx, edx
    push push esi
    jle sub_10001FB1
    xor xor esi, esi
    mov mov dword ptr [esp + 16], esi
    mov mov dword ptr [esp + 20], edx
    mov mov edi, edi
    test test ebp, ebp
    jle sub_10001FA5
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 40]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 48]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 56]
    jmp L0
    lea lea esp, [esp]
    nop nop
    mov mov edx, dword ptr [ecx + 12]
    movzx movzx edx, byte ptr [edx + esi]
    mov mov dword ptr [esp + 12], edx
    mov mov edx, dword ptr [ecx]
    movzx movzx edx, byte ptr [edx + eax]
    fild fild dword ptr [esp + 12]
    mov mov dword ptr [esp + 24], edx
    fstp fstp dword ptr [esp + 12]
    fild fild dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [edi]
    faddp faddp st(1)
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 40]
    fistp fistp dword ptr [esp + 28]
    mov mov edx, dword ptr [ecx + 4]
    movzx movzx edx, byte ptr [edx + eax]
    mov mov dword ptr [esp + 24], edx
    fild fild dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [edi + 4]
    faddp faddp st(1)
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 48]
    fistp fistp dword ptr [esp + 32]
    mov mov edx, dword ptr [ecx + 8]
    movzx movzx edx, byte ptr [edx + eax]
    mov mov dword ptr [esp + 24], edx
    fild fild dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [edi + 8]
    faddp faddp st(1)
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 28]
    lea lea ebx, [edx - 0FFh]
    test test ebx, ebx
    jl sub_10002027
    mov mov edx, 0FFh
    mov mov ebx, dword ptr [ecx]
    mov mov byte ptr [ebx + eax + 2], dl
    mov mov edx, dword ptr [esp + 32]
    lea lea ebx, [edx - 0FFh]
    test test ebx, ebx
    jl sub_10002059
    mov mov edx, 0FFh
    mov mov ebx, dword ptr [ecx]
    mov mov byte ptr [ebx + eax + 1], dl
    mov mov edx, dword ptr [esp + 36]
    lea lea ebx, [edx - 0FFh]
    test test ebx, ebx
    jl sub_1000208B
    mov mov edx, 0FFh
    mov mov ebx, dword ptr [ecx]
    mov mov byte ptr [eax + ebx], dl
    mov mov edx, dword ptr [ecx]
    mov mov byte ptr [edx + eax + 3], 0FFh
    add add eax, 4
    add add esi, 2
    dec dec ebp
    jne sub_10001FC9
    mov mov ebp, dword ptr [esp + 68]
    mov mov esi, dword ptr [esp + 16]
    lea lea edx, [ebp*4]
    add add esi, edx
    mov mov edx, dword ptr [esp + 20]
    dec dec edx
    mov mov dword ptr [esp + 16], esi
    mov mov dword ptr [esp + 20], edx
FUN_10001e30 ENDP
END
