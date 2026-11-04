.686
.MODEL FLAT, C
EXTRN sub_1002E918:PROC
EXTRN sub_1002E944:PROC
EXTRN sub_1002E975:PROC
EXTRN sub_1002E99A:PROC
EXTRN sub_1003A633:PROC
EXTRN sub_1003A7C2:PROC
EXTRN sub_1003A90C:PROC
EXTRN sub_1003AA8A:PROC
EXTRN sub_1003AAC5:PROC
EXTRN sub_1003AC60:PROC
EXTRN sub_1003E012:PROC
EXTRN sub_1003E1A8:PROC
EXTRN sub_1003E69B:PROC
EXTRN g_1019BDE4:DWORD
EXTRN g_101D1B40:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9C4:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_10730550:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
.CODE
FUN_10031070 PROC
    mov eax, dword ptr [g_101D1B40]
    mov ecx, dword ptr [g_1072D9BC]
    sub esp, 120
    cmp ecx, eax
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov esi, 3
    jne L0
    cmp dword ptr [g_1072D9C0], esi
    je L3
L0:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L2
L1:
    call sub_1003A90C
L2:
    push 31
    call sub_1003A633
    add esp, 4
L3:
    mov ecx, 16
    mov esi, 010191368h
    lea edi, [esp + 72]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [g_10730550]
    imul edi, edi, 000000CD0h
    add edi, 01072E220h
    mov ecx, 16
    lea esi, [esp + 72]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003E1A8
    lea eax, [esp + 72]
    push eax
    call sub_1003E012
    mov ecx, dword ptr [esp + 000000090h]
    movsx edx, word ptr [ecx + 6]
    mov dword ptr [esp + 36], edx
    mov eax, dword ptr [g_1072DDC8]
    add eax, 0000000C8h
    fild dword ptr [esp + 36]
    add esp, 4
    cmp word ptr [ecx + 4], 0
    mov dword ptr [esp + 36], eax
    fstp dword ptr [esp + 20]
    lea ebp, [ecx + 8]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 20]
    fdiv dword ptr [esp + 32]
    fstp dword ptr [esp + 40]
    fild dword ptr [g_10766720]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 20]
    fdiv dword ptr [esp + 32]
    mov dword ptr [esp + 32], 0
    fstp dword ptr [esp + 44]
    jle L10
    jmp L5
L4:
    mov eax, dword ptr [esp + 36]
L5:
    fld dword ptr [ebp + 8]
    fmul dword ptr [eax + 32]
    fld dword ptr [eax + 16]
    fmul dword ptr [ebp + 4]
    faddp st(1)
    fld dword ptr [ebp]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fstp dword ptr [esp + 56]
    fld dword ptr [ebp + 8]
    fmul dword ptr [eax + 36]
    fld dword ptr [ebp + 4]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fld dword ptr [ebp]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fstp dword ptr [esp + 60]
    fld dword ptr [ebp + 8]
    fmul dword ptr [eax + 40]
    fld dword ptr [ebp + 4]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fld dword ptr [ebp]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fadd dword ptr [eax + 56]
    fstp dword ptr [esp + 64]
    fld dword ptr [ebp + 8]
    fmul dword ptr [eax + 44]
    fld dword ptr [ebp + 4]
    fmul dword ptr [eax + 28]
    faddp st(1)
    fld dword ptr [ebp]
    fmul dword ptr [eax + 12]
    faddp st(1)
    fadd dword ptr [eax + 60]
    mov eax, dword ptr [g_1072D9D4]
    add eax, 4
    cmp eax, 00000154Ah
    fstp dword ptr [esp + 68]
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 44]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 68]
    fmul dword ptr [g_1019BDE4]
    fsubr dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    jg L6
    mov ecx, dword ptr [g_1072D9D0]
    add ecx, 6
    cmp ecx, 000100000h
    jle L9
L6:
    mov ebx, dword ptr [g_1072D9CC]
    call sub_1003AA8A
    mov edx, dword ptr [g_1072D9C4]
    mov esi, dword ptr [g_1072D9C0]
    mov edi, dword ptr [g_1072D9BC]
    push edx
    call sub_1003A7C2
    mov eax, dword ptr [g_1072D9CC]
    add esp, 4
    cmp eax, ebx
    je L9
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L7
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L8
L7:
    call sub_1003AAC5
L8:
    mov dword ptr [g_1072D9CC], ebx
L9:
    mov eax, dword ptr [g_1072D9D4]
    fld dword ptr [esp + 60]
    mov edx, dword ptr [g_1072D9D0]
    fsub dword ptr [esp + 52]
    mov ecx, dword ptr [g_1072D9B0]
    add eax, 3
    mov word ptr [ecx + edx*2], ax
    fstp dword ptr [esp + 28]
    mov edx, dword ptr [g_1072D9D0]
    fld dword ptr [esp + 56]
    mov ax, word ptr [g_1072D9D4]
    fsub dword ptr [esp + 48]
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + edx*2 + 2], ax
    mov eax, dword ptr [g_1072D9D4]
    fstp dword ptr [esp + 20]
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    mov edi, dword ptr [esp + 68]
    mov ebx, dword ptr [esp + 64]
    add eax, 2
    mov word ptr [ecx + edx*2 + 4], ax
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    add eax, 2
    mov word ptr [ecx + edx*2 + 6], ax
    mov edx, dword ptr [g_1072D9D0]
    mov ax, word ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + edx*2 + 8], ax
    mov eax, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    push 0
    inc eax
    mov word ptr [edx + ecx*2 + 10], ax
    mov edx, dword ptr [g_1072D9D0]
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 24]
    push 0
    push edi
    add edx, 6
    push ebx
    push eax
    mov eax, dword ptr [g_1072D9D4]
    mov dword ptr [g_1072D9D0], edx
    lea esi, [ebp + 12]
    push ecx
    mov edx, esi
    call sub_1002E918
    fld dword ptr [esp + 76]
    fadd dword ptr [esp + 84]
    mov eax, dword ptr [esp + 44]
    push 03F800000h
    push 0
    push edi
    fstp dword ptr [esp + 60]
    mov edx, dword ptr [esp + 60]
    push ebx
    push edx
    push eax
    mov eax, dword ptr [g_1072D9D4]
    inc eax
    mov edx, esi
    call sub_1002E944
    fld dword ptr [esp + 96]
    fadd dword ptr [esp + 104]
    mov ecx, dword ptr [esp + 72]
    mov eax, dword ptr [g_1072D9D4]
    push 03F800000h
    push 03F800000h
    fstp dword ptr [esp + 76]
    mov edx, dword ptr [esp + 76]
    push edi
    push ebx
    push ecx
    push edx
    add eax, 2
    mov edx, esi
    call sub_1002E975
    mov eax, dword ptr [esp + 100]
    mov ecx, dword ptr [esp + 92]
    add esp, 72
    push 0
    push 03F800000h
    push edi
    push ebx
    push eax
    mov eax, dword ptr [g_1072D9D4]
    push ecx
    add eax, 3
    mov edx, esi
    call sub_1002E99A
    mov ebx, dword ptr [g_1072D9D4]
    mov edx, dword ptr [esp + 0000000A4h]
    mov eax, dword ptr [esp + 56]
    add ebx, 4
    mov dword ptr [g_1072D9D4], ebx
    movsx ecx, word ptr [edx + 4]
    add esp, 24
    inc eax
    add ebp, 16
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    jl L4
L10:
    call sub_1003AC60
    mov edi, dword ptr [g_1072DDC8]
    call sub_1003E69B
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 120
    ret
FUN_10031070 ENDP
END
