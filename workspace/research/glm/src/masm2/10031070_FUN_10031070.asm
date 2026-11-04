.686
.MODEL FLAT, C
EXTRN sub_1002E918:PROC
EXTRN sub_1002E944:PROC
EXTRN sub_1002E975:PROC
EXTRN sub_1002E99A:PROC
EXTRN sub_1003141A:PROC
EXTRN sub_10031447:PROC
EXTRN sub_10031449:PROC
EXTRN sub_10031455:PROC
EXTRN sub_100314E7:PROC
EXTRN sub_100314E9:PROC
EXTRN sub_1003A633:PROC
EXTRN sub_1003A7C2:PROC
EXTRN sub_1003A90C:PROC
EXTRN sub_1003AA8A:PROC
EXTRN sub_1003AAC5:PROC
EXTRN sub_1003AC60:PROC
EXTRN sub_1003E012:PROC
EXTRN sub_1003E1A8:PROC
EXTRN sub_1003E69B:PROC
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_101D1B40:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9C4:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
.CODE
FUN_10031070 PROC
    mov mov eax, dword ptr [g_101D1B40]
    mov mov ecx, dword ptr [g_1072D9BC]
    sub sub esp, 120
    cmp cmp ecx, eax
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    mov mov esi, 3
    jne L0
    cmp cmp dword ptr [g_1072D9C0], esi
    je L2
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L3
    call sub_1003A90C
    push push 31
    call sub_1003A633
    add add esp, 4
    mov mov ecx, 16
    mov mov esi, 010191368h
    lea lea edi, [esp + 72]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [g_10730550]
    imul imul edi, edi, 0CD0h
    add add edi, 01072E220h
    mov mov ecx, 16
    lea lea esi, [esp + 72]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L3:
    call sub_1003E1A8
    lea lea eax, [esp + 72]
    push push eax
    call sub_1003E012
    mov mov ecx, dword ptr [esp + 090h]
    movsx movsx edx, word ptr [ecx + 6]
    mov mov dword ptr [esp + 36], edx
    mov mov eax, dword ptr [g_1072DDC8]
    add add eax, 0C8h
    fild fild dword ptr [esp + 36]
    add add esp, 4
    cmp cmp word ptr [ecx + 4], 0
    mov mov dword ptr [esp + 36], eax
    fstp fstp dword ptr [esp + 20]
    lea lea ebp, [ecx + 8]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 20]
    fdiv fdiv dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 40]
    fild fild dword ptr [g_10766720]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 20]
    fdiv fdiv dword ptr [esp + 32]
    mov mov dword ptr [esp + 32], 0
    fstp fstp dword ptr [esp + 44]
    jle sub_100314E7
    jmp L4
    mov mov eax, dword ptr [esp + 36]
    fld fld dword ptr [ebp + 8]
    fmul fmul dword ptr [eax + 32]
    fld fld dword ptr [eax + 16]
    fmul fmul dword ptr [ebp + 4]
    faddp faddp st(1)
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 48]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [ebp + 8]
    fmul fmul dword ptr [eax + 36]
    fld fld dword ptr [ebp + 4]
    fmul fmul dword ptr [eax + 20]
    faddp faddp st(1)
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 52]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [ebp + 8]
    fmul fmul dword ptr [eax + 40]
    fld fld dword ptr [ebp + 4]
    fmul fmul dword ptr [eax + 24]
    faddp faddp st(1)
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 56]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [ebp + 8]
    fmul fmul dword ptr [eax + 44]
    fld fld dword ptr [ebp + 4]
    fmul fmul dword ptr [eax + 28]
    faddp faddp st(1)
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [eax + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 60]
    mov mov eax, dword ptr [g_1072D9D4]
    add add eax, 4
    cmp cmp eax, 0154Ah
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [g_1019BDE4]
    fsubr fsubr dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    jg L5
    mov mov ecx, dword ptr [g_1072D9D0]
    add add ecx, 6
    cmp cmp ecx, 0100000h
    jle sub_1003141A
    mov mov ebx, dword ptr [g_1072D9CC]
    call sub_1003AA8A
    mov mov edx, dword ptr [g_1072D9C4]
    mov mov esi, dword ptr [g_1072D9C0]
    mov mov edi, dword ptr [g_1072D9BC]
    push push edx
    call sub_1003A7C2
    mov mov eax, dword ptr [g_1072D9CC]
    add add esp, 4
    cmp cmp eax, ebx
    je sub_10031449
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne sub_10031447
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je sub_10031455
    call sub_1003AAC5
    mov mov dword ptr [g_1072D9CC], ebx
    mov mov eax, dword ptr [g_1072D9D4]
    fld fld dword ptr [esp + 60]
    mov mov edx, dword ptr [g_1072D9D0]
    fsub fsub dword ptr [esp + 52]
    mov mov ecx, dword ptr [g_1072D9B0]
    add add eax, 3
    mov mov word ptr [ecx + edx*2], ax
    fstp fstp dword ptr [esp + 28]
    mov mov edx, dword ptr [g_1072D9D0]
    fld fld dword ptr [esp + 56]
    mov mov ax, word ptr [g_1072D9D4]
    fsub fsub dword ptr [esp + 48]
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov word ptr [ecx + edx*2 + 2], ax
    mov mov eax, dword ptr [g_1072D9D4]
    fstp fstp dword ptr [esp + 20]
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov edi, dword ptr [esp + 68]
    mov mov ebx, dword ptr [esp + 64]
    add add eax, 2
    mov mov word ptr [ecx + edx*2 + 4], ax
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov ecx, dword ptr [g_1072D9B0]
    add add eax, 2
    mov mov word ptr [ecx + edx*2 + 6], ax
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov ax, word ptr [g_1072D9D4]
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov word ptr [ecx + edx*2 + 8], ax
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    push push 0
    inc inc eax
    mov mov word ptr [edx + ecx*2 + 10], ax
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov eax, dword ptr [esp + 32]
    mov mov ecx, dword ptr [esp + 24]
    push push 0
    push push edi
    add add edx, 6
    push push ebx
    push push eax
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov dword ptr [g_1072D9D0], edx
    lea lea esi, [ebp + 12]
    push push ecx
    mov mov edx, esi
    call sub_1002E918
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [esp + 84]
    mov mov eax, dword ptr [esp + 44]
    push push 03F800000h
    push push 0
    push push edi
    fstp fstp dword ptr [esp + 60]
    mov mov edx, dword ptr [esp + 60]
    push push ebx
    push push edx
    push push eax
    mov mov eax, dword ptr [g_1072D9D4]
    inc inc eax
    mov mov edx, esi
    call sub_1002E944
    fld fld dword ptr [esp + 96]
    fadd fadd dword ptr [esp + 104]
    mov mov ecx, dword ptr [esp + 72]
    mov mov eax, dword ptr [g_1072D9D4]
    push push 03F800000h
    push push 03F800000h
    fstp fstp dword ptr [esp + 76]
    mov mov edx, dword ptr [esp + 76]
    push push edi
    push push ebx
    push push ecx
    push push edx
    add add eax, 2
    mov mov edx, esi
    call sub_1002E975
    mov mov eax, dword ptr [esp + 100]
    mov mov ecx, dword ptr [esp + 92]
    add add esp, 72
    push push 0
    push push 03F800000h
    push push edi
    push push ebx
    push push eax
    mov mov eax, dword ptr [g_1072D9D4]
    push push ecx
    add add eax, 3
    mov mov edx, esi
    call sub_1002E99A
    mov mov ebx, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [esp + 0A4h]
    mov mov eax, dword ptr [esp + 56]
    add add ebx, 4
    mov mov dword ptr [g_1072D9D4], ebx
    movsx movsx ecx, word ptr [edx + 4]
    add add esp, 24
    inc inc eax
    add add ebp, 16
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 32], eax
    jl sub_100314E9
    call sub_1003AC60
    mov mov edi, dword ptr [g_1072DDC8]
    call sub_1003E69B
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 120
    ret ret
FUN_10031070 ENDP
END
