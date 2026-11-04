.686
.MODEL FLAT, C
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
.CODE
FUN_10025b10 PROC
    sub esp, 48
    imul ecx, dword ptr [esp + 56]
    fild dword ptr [esp + 52]
    fdivr dword ptr [g_1019BCB0]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 60]
    push esi
    mov esi, dword ptr [esp + 72]
    push edi
    mov edi, eax
    lea eax, [edx - 1]
    imul eax, ecx
    fstp dword ptr [esp + 72]
    mov bl, byte ptr [eax + esi]
    add eax, esi
    lea esi, [ebp - 1]
    mov dword ptr [esp + 20], esi
    imul esi, ecx
    mov byte ptr [eax + ecx], bl
    mov bl, byte ptr [eax + 1]
    mov byte ptr [eax + ecx + 1], bl
    mov bl, byte ptr [eax + 2]
    add edi, esi
    mov esi, ebp
    mov byte ptr [eax + ecx + 2], bl
    mov ebx, dword ptr [esp + 20]
    sub esi, edx
    add ebp, edx
    test ebx, ebx
    jl L4
    add edx, edx
    inc ebx
    mov dword ptr [esp + 52], edx
    mov dword ptr [esp + 20], ebx
L0:
    mov ebx, dword ptr [esp + 76]
    fld qword ptr [g_1019BD80]
    cmp eax, ebx
    jb L1
    movzx edx, byte ptr [ecx + eax]
    movzx ebx, byte ptr [eax]
    imul edx, esi
    imul ebx, ebp
    add edx, ebx
    mov dword ptr [esp + 24], edx
    fild dword ptr [esp + 24]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 24]
    fstp qword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 28]
    mov dl, byte ptr [esp + 28]
    mov byte ptr [edi], dl
    movzx edx, byte ptr [eax + ecx + 1]
    movzx ebx, byte ptr [eax + 1]
    imul edx, esi
    imul ebx, ebp
    add edx, ebx
    mov dword ptr [esp + 24], edx
    fild dword ptr [esp + 24]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 24]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 32]
    mov dl, byte ptr [esp + 32]
    mov byte ptr [edi + 1], dl
    movzx edx, byte ptr [eax + ecx + 2]
    movzx ebx, byte ptr [eax + 2]
    imul edx, esi
    imul ebx, ebp
    add edx, ebx
    mov dword ptr [esp + 24], edx
    fild dword ptr [esp + 24]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 24]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 36]
    mov dl, byte ptr [esp + 36]
    jmp L2
L1:
    movzx ebx, byte ptr [ebx]
    lea edx, [esi + ebp]
    imul ebx, edx
    mov dword ptr [esp + 24], ebx
    fild dword ptr [esp + 24]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 24]
    fstp qword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 40]
    mov bl, byte ptr [esp + 40]
    mov byte ptr [edi], bl
    mov ebx, dword ptr [esp + 76]
    movzx ebx, byte ptr [ebx + 1]
    imul ebx, edx
    mov dword ptr [esp + 24], ebx
    fild dword ptr [esp + 24]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 24]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 44]
    mov bl, byte ptr [esp + 44]
    mov byte ptr [edi + 1], bl
    mov ebx, dword ptr [esp + 76]
    movzx ebx, byte ptr [ebx + 2]
    imul ebx, edx
    mov dword ptr [esp + 24], ebx
    fild dword ptr [esp + 24]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 24]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 48]
    mov dl, byte ptr [esp + 48]
L2:
    mov byte ptr [edi + 2], dl
    mov edx, dword ptr [esp + 52]
    sub edi, ecx
    add ebp, edx
    sub esi, edx
    jns L3
    mov edx, dword ptr [esp + 68]
    add edx, edx
    sub ebp, edx
    add esi, edx
    sub eax, ecx
L3:
    dec dword ptr [esp + 20]
    jne L0
L4:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 48
    ret
FUN_10025b10 ENDP
END
