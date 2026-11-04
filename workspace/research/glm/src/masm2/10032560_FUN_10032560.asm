.686
.MODEL FLAT, C
EXTRN sub_1000BDAF:PROC
EXTRN sub_1002EA2F:PROC
EXTRN sub_1002EA92:PROC
EXTRN sub_10032447:PROC
EXTRN sub_10032849:PROC
EXTRN sub_10032879:PROC
EXTRN sub_1003287E:PROC
EXTRN sub_10032889:PROC
EXTRN sub_100328B9:PROC
EXTRN sub_1003290B:PROC
EXTRN sub_10032928:PROC
EXTRN sub_10032939:PROC
EXTRN sub_10032A22:PROC
EXTRN sub_10032AF7:PROC
EXTRN EXTRN fp_101D4AEC:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
.CODE
FUN_10032560 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 44
    fld fld dword ptr [ebp + 28]
    mov mov eax, dword ptr [ebp + 36]
    fmul fmul dword ptr [g_1019BCB0]
    mov mov edx, dword ptr [ebp + 8]
    push push ebx
    push push esi
    fsubr fsubr dword ptr [ebp + 20]
    mov mov ebx, eax
    push push edi
    mov mov edi, dword ptr [ebp + 16]
    mov mov esi, dword ptr [edi + 12]
    fstp fstp dword ptr [ebp + 20]
    fld fld dword ptr [ebp + 32]
    mov mov ecx, dword ptr [ebp + 20]
    fmul fmul dword ptr [g_1019BCB0]
    shr shr ebx, 24
    mov mov dword ptr [esp + 16], eax
    mov mov al, byte ptr [edx]
    fsubr fsubr dword ptr [ebp + 24]
    shl shl ebx, 24
    test test al, al
    mov mov dword ptr [esp + 52], ebx
    fstp fstp dword ptr [ebp + 24]
    mov mov dword ptr [esp + 28], esi
    mov mov dword ptr [esp + 36], ecx
    mov mov dword ptr [esp + 24], 0
    mov mov dword ptr [esp + 20], 0
    je sub_10032879
    jmp L0
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_10032889
    lea lea eax, [ebp + 8]
    push push 0
    push push eax
    call dword ptr [fp_101D4AEC]
    add add esp, 8
    cmp cmp eax, 94
    jne L5
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    je L7
    mov mov dl, byte ptr [ecx]
    cmp cmp dl, al
    je L8
    cmp cmp dl, 48
    jl L9
    cmp cmp dl, 57
    jg L10
    mov mov al, dl
    sub sub al, 48
    cmp cmp al, 10
    jae L3
    movzx movzx eax, al
    cmp cmp al, 7
    jne L4
    mov mov ecx, dword ptr [ebp + 36]
    mov mov dword ptr [esp + 16], ecx
    jmp L6
    lea lea ecx, [esp + 32]
    call sub_10032447
    mov mov eax, dword ptr [esp + 32]
    mov mov dl, byte ptr [esp + 34]
    mov mov byte ptr [esp + 18], al
    mov mov al, byte ptr [ebp + 39]
    mov mov byte ptr [esp + 17], ah
    mov mov byte ptr [esp + 16], dl
    mov mov byte ptr [esp + 19], al
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esp + 20]
    inc inc ecx
    add add eax, 2
    mov mov dword ptr [ebp + 8], ecx
    mov mov dword ptr [esp + 20], eax
    jmp sub_1003290B
    cmp cmp eax, 10
    jne L11
    fild fild dword ptr [edi + 4]
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [ebp + 20], ecx
    fmul fmul dword ptr [ebp + 32]
    fadd fadd dword ptr [ebp + 24]
    fstp fstp dword ptr [ebp + 24]
    jmp sub_10032928
    cmp cmp eax, 13
    jne L12
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [ebp + 20], edx
    jmp sub_10032939
    push push edi
    mov mov edi, eax
    call sub_1000BDAF
    mov mov edi, eax
    movsx movsx eax, byte ptr [edi + 2]
    movsx movsx ecx, byte ptr [edi + 3]
    mov mov dword ptr [esp + 44], eax
    mov mov eax, dword ptr [ebp + 40]
    add add esp, 4
    cmp cmp eax, 3
    fild fild dword ptr [esp + 40]
    mov mov dword ptr [esp + 40], ecx
    fmul fmul dword ptr [ebp + 28]
    fstp fstp dword ptr [esp + 24]
    fild fild dword ptr [esp + 40]
    fmul fmul dword ptr [ebp + 32]
    fstp fstp dword ptr [esp + 40]
    je sub_10032849
    cmp cmp eax, 6
    jne sub_100328B9
    mov mov ecx, dword ptr [edi + 16]
    xor xor edx, edx
    cmp cmp eax, 3
    mov mov eax, dword ptr [edi + 20]
    setne setne dl
    push push eax
    mov mov eax, dword ptr [edi + 8]
    push push ecx
    movzx movzx ecx, byte ptr [edi + 6]
    inc inc edx
    mov mov dword ptr [esp + 52], edx
L4:
    mov mov edx, dword ptr [edi + 12]
    push push edx
    fild fild dword ptr [esp + 56]
    movzx movzx edx, byte ptr [edi + 5]
    mov mov dword ptr [esp + 56], ecx
    push push eax
    sub sub esp, 16
    fild fild dword ptr [esp + 76]
    mov mov dword ptr [esp + 76], edx
    mov mov eax, esi
    fmul fmul dword ptr [ebp + 32]
    fstp fstp dword ptr [esp + 12]
    fild fild dword ptr [esp + 76]
    fmul fmul dword ptr [ebp + 28]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 72]
    fadd fadd st(1)
    fadd fadd dword ptr [ebp + 24]
    fstp fstp dword ptr [esp + 4]
    fadd fadd dword ptr [esp + 56]
    fadd fadd dword ptr [ebp + 20]
    fstp fstp dword ptr [esp]
    call sub_1002EA2F
    add add esp, 32
    mov mov eax, dword ptr [edi + 20]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [ebp + 20]
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [edi + 12]
    push push eax
    mov mov eax, dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 52]
    push push ecx
    movzx movzx ecx, byte ptr [edi + 6]
    mov mov esi, dword ptr [esp + 56]
    mov mov ebx, dword ptr [esp + 24]
    mov mov dword ptr [esp + 52], ecx
    push push edx
    movzx movzx edx, byte ptr [edi + 5]
    fild fild dword ptr [esp + 56]
    push push eax
    fmul fmul dword ptr [ebp + 32]
    mov mov eax, dword ptr [esp + 44]
    sub sub esp, 12
    mov mov dword ptr [esp + 72], edx
    fstp fstp dword ptr [esp + 8]
    fild fild dword ptr [esp + 72]
    fmul fmul dword ptr [ebp + 28]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 68]
    fadd fadd dword ptr [ebp + 24]
    fstp fstp dword ptr [esp]
    push push esi
    call sub_1002EA92
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, dword ptr [ebp + 44]
    add add esp, 32
    cmp cmp eax, ecx
    jne sub_10032A22
    mov mov ecx, dword ptr [ebp + 32]
    mov mov edx, dword ptr [ebp + 28]
    mov mov eax, dword ptr [ebp + 16]
    push push ecx
    mov mov ecx, dword ptr [ebp + 24]
    push push edx
    mov mov edx, dword ptr [ebp + 48]
    push push eax
L12:
    mov mov eax, dword ptr [esp + 40]
    push push ecx
    push push esi
    push push edx
    push push eax
    call L1
    add add esp, 28
    movzx movzx ecx, byte ptr [edi + 4]
    mov mov eax, dword ptr [ebp + 12]
    mov mov edi, dword ptr [ebp + 16]
    mov mov esi, dword ptr [esp + 28]
    mov mov ebx, dword ptr [esp + 52]
    mov mov dword ptr [esp + 48], ecx
    mov mov ecx, dword ptr [esp + 20]
    inc inc ecx
    fild fild dword ptr [esp + 48]
    dec dec eax
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [ebp + 12], eax
    fmul fmul dword ptr [ebp + 28]
    fadd fadd dword ptr [ebp + 20]
    fstp fstp dword ptr [ebp + 20]
    mov mov edx, dword ptr [ebp + 8]
    cmp cmp byte ptr [edx], 0
    jne sub_1003287E
    mov mov eax, dword ptr [esp + 20]
    cmp cmp eax, dword ptr [ebp + 44]
    jne sub_10032AF7
    mov mov ecx, dword ptr [ebp + 32]
    fld fld dword ptr [esp + 24]
    mov mov edx, dword ptr [ebp + 28]
    fadd fadd dword ptr [ebp + 20]
    mov mov eax, dword ptr [ebp + 24]
    mov mov ebx, dword ptr [esp + 16]
    push push ecx
    push push edx
    push push edi
    push push eax
    push push ecx
    mov mov ecx, dword ptr [ebp + 48]
    fstp fstp dword ptr [esp]
    push push ecx
    push push esi
    call L2
    add add esp, 28
    pop pop edi
    pop pop esi
    pop pop ebx
FUN_10032560 ENDP
END
