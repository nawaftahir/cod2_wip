.686
.MODEL FLAT, C
EXTRN sub_10025D5D:PROC
EXTRN sub_10025D68:PROC
EXTRN sub_10025E08:PROC
EXTRN sub_10025ECE:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
.CODE
FUN_10025b10 PROC
    sub sub esp, 48
    imul imul ecx, dword ptr [esp + 56]
    fild fild dword ptr [esp + 52]
    fdivr fdivr dword ptr [g_1019BCB0]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 60]
    push push esi
    mov mov esi, dword ptr [esp + 72]
    push push edi
    mov mov edi, eax
    lea lea eax, [edx - 1]
    imul imul eax, ecx
    fstp fstp dword ptr [esp + 72]
    mov mov bl, byte ptr [eax + esi]
    add add eax, esi
    lea lea esi, [ebp - 1]
    mov mov dword ptr [esp + 20], esi
    imul imul esi, ecx
    mov mov byte ptr [eax + ecx], bl
    mov mov bl, byte ptr [eax + 1]
    mov mov byte ptr [eax + ecx + 1], bl
    mov mov bl, byte ptr [eax + 2]
    add add edi, esi
    mov mov esi, ebp
    mov mov byte ptr [eax + ecx + 2], bl
    mov mov ebx, dword ptr [esp + 20]
    sub sub esi, edx
    add add ebp, edx
    test test ebx, ebx
    jl sub_10025D5D
    add add edx, edx
    inc inc ebx
    mov mov dword ptr [esp + 52], edx
    mov mov dword ptr [esp + 20], ebx
    mov mov ebx, dword ptr [esp + 76]
    fld fld qword ptr [g_1019BD80]
    cmp cmp eax, ebx
    jb L0
    movzx movzx edx, byte ptr [ecx + eax]
    movzx movzx ebx, byte ptr [eax]
    imul imul edx, esi
    imul imul ebx, ebp
    add add edx, ebx
    mov mov dword ptr [esp + 24], edx
    fild fild dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 24]
    fstp fstp qword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 28]
    mov mov dl, byte ptr [esp + 28]
    mov mov byte ptr [edi], dl
    movzx movzx edx, byte ptr [eax + ecx + 1]
    movzx movzx ebx, byte ptr [eax + 1]
    imul imul edx, esi
    imul imul ebx, ebp
    add add edx, ebx
    mov mov dword ptr [esp + 24], edx
    fild fild dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 24]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 32]
    mov mov dl, byte ptr [esp + 32]
    mov mov byte ptr [edi + 1], dl
    movzx movzx edx, byte ptr [eax + ecx + 2]
    movzx movzx ebx, byte ptr [eax + 2]
    imul imul edx, esi
    imul imul ebx, ebp
    add add edx, ebx
    mov mov dword ptr [esp + 24], edx
    fild fild dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 24]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 36]
    mov mov dl, byte ptr [esp + 36]
    jmp sub_10025E08
    movzx movzx ebx, byte ptr [ebx]
    lea lea edx, [esi + ebp]
    imul imul ebx, edx
    mov mov dword ptr [esp + 24], ebx
    fild fild dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 24]
    fstp fstp qword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 40]
    mov mov bl, byte ptr [esp + 40]
    mov mov byte ptr [edi], bl
    mov mov ebx, dword ptr [esp + 76]
    movzx movzx ebx, byte ptr [ebx + 1]
    imul imul ebx, edx
    mov mov dword ptr [esp + 24], ebx
    fild fild dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 24]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 44]
    mov mov bl, byte ptr [esp + 44]
    mov mov byte ptr [edi + 1], bl
    mov mov ebx, dword ptr [esp + 76]
    movzx movzx ebx, byte ptr [ebx + 2]
    imul imul ebx, edx
    mov mov dword ptr [esp + 24], ebx
    fild fild dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 24]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 48]
    mov mov dl, byte ptr [esp + 48]
    mov mov byte ptr [edi + 2], dl
    mov mov edx, dword ptr [esp + 52]
    sub sub edi, ecx
    add add ebp, edx
    sub sub esi, edx
    jns sub_10025ECE
    mov mov edx, dword ptr [esp + 68]
    add add edx, edx
    sub sub ebp, edx
    add add esi, edx
    sub sub eax, ecx
    dec dec dword ptr [esp + 20]
    jne sub_10025D68
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 48
    ret ret
FUN_10025b10 ENDP
END
