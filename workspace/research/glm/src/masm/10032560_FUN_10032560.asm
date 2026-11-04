.686
.MODEL FLAT, C
EXTRN sub_1000BDAF:PROC
EXTRN sub_1002EA2F:PROC
EXTRN sub_1002EA92:PROC
EXTRN sub_10032447:PROC
EXTRN sub_1003266F:PROC
EXTRN sub_100326DD:PROC
EXTRN fp_101D4AEC:DWORD
EXTRN g_1019BCB0:DWORD
.CODE
FUN_10032560 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 44
    fld dword ptr [ebp + 28]
    mov eax, dword ptr [ebp + 36]
    fmul dword ptr [g_1019BCB0]
    mov edx, dword ptr [ebp + 8]
    push ebx
    push esi
    fsubr dword ptr [ebp + 20]
    mov ebx, eax
    push edi
    mov edi, dword ptr [ebp + 16]
    mov esi, dword ptr [edi + 12]
    fstp dword ptr [ebp + 20]
    fld dword ptr [ebp + 32]
    mov ecx, dword ptr [ebp + 20]
    fmul dword ptr [g_1019BCB0]
    shr ebx, 24
    mov dword ptr [esp + 16], eax
    mov al, byte ptr [edx]
    fsubr dword ptr [ebp + 24]
    shl ebx, 24
    test al, al
    mov dword ptr [esp + 52], ebx
    fstp dword ptr [ebp + 24]
    mov dword ptr [esp + 28], esi
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 24], 0
    mov dword ptr [esp + 20], 0
    je L11
    jmp L0
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L11
    lea eax, [ebp + 8]
    push 0
    push eax
    call dword ptr [fp_101D4AEC]
    add esp, 8
    cmp eax, 94
    jne L4
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L6
    mov dl, byte ptr [ecx]
    cmp dl, al
    je L6
    cmp dl, 48
    jl L6
    cmp dl, 57
    jg L6
    mov al, dl
    sub al, 48
    cmp al, 10
    jae L1
    movzx eax, al
    cmp al, 7
    jne L2
L1:
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [esp + 16], ecx
    jmp L3
L2:
    lea ecx, [esp + 32]
    call sub_10032447
    mov eax, dword ptr [esp + 32]
    mov dl, byte ptr [esp + 34]
    mov byte ptr [esp + 18], al
    mov al, byte ptr [ebp + 39]
    mov byte ptr [esp + 17], ah
    mov byte ptr [esp + 16], dl
    mov byte ptr [esp + 19], al
L3:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [esp + 20]
    inc ecx
    add eax, 2
    mov dword ptr [ebp + 8], ecx
    mov dword ptr [esp + 20], eax
    jmp L10
L4:
    cmp eax, 10
    jne L5
    fild dword ptr [edi + 4]
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [ebp + 20], ecx
    fmul dword ptr [ebp + 32]
    fadd dword ptr [ebp + 24]
    fstp dword ptr [ebp + 24]
    jmp L10
L5:
    cmp eax, 13
    jne L6
    mov edx, dword ptr [esp + 36]
    mov dword ptr [ebp + 20], edx
    jmp L10
L6:
    push edi
    mov edi, eax
    call sub_1000BDAF
    mov edi, eax
    movsx eax, byte ptr [edi + 2]
    movsx ecx, byte ptr [edi + 3]
    mov dword ptr [esp + 44], eax
    mov eax, dword ptr [ebp + 40]
    add esp, 4
    cmp eax, 3
    fild dword ptr [esp + 40]
    mov dword ptr [esp + 40], ecx
    fmul dword ptr [ebp + 28]
    fstp dword ptr [esp + 24]
    fild dword ptr [esp + 40]
    fmul dword ptr [ebp + 32]
    fstp dword ptr [esp + 40]
    je L7
    cmp eax, 6
    jne L8
L7:
    mov ecx, dword ptr [edi + 16]
    xor edx, edx
    cmp eax, 3
    mov eax, dword ptr [edi + 20]
    setne dl
    push eax
    mov eax, dword ptr [edi + 8]
    push ecx
    movzx ecx, byte ptr [edi + 6]
    inc edx
    mov dword ptr [esp + 52], edx
    mov edx, dword ptr [edi + 12]
    push edx
    fild dword ptr [esp + 56]
    movzx edx, byte ptr [edi + 5]
    mov dword ptr [esp + 56], ecx
    push eax
    sub esp, 16
    fild dword ptr [esp + 76]
    mov dword ptr [esp + 76], edx
    mov eax, esi
    fmul dword ptr [ebp + 32]
    fstp dword ptr [esp + 12]
    fild dword ptr [esp + 76]
    fmul dword ptr [ebp + 28]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 72]
    fadd st(1)
    fadd dword ptr [ebp + 24]
    fstp dword ptr [esp + 4]
    fadd dword ptr [esp + 56]
    fadd dword ptr [ebp + 20]
    fstp dword ptr [esp]
    call sub_1002EA2F
    add esp, 32
L8:
    mov eax, dword ptr [edi + 20]
    fld dword ptr [esp + 24]
    fadd dword ptr [ebp + 20]
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [edi + 12]
    push eax
    mov eax, dword ptr [edi + 8]
    fstp dword ptr [esp + 52]
    push ecx
    movzx ecx, byte ptr [edi + 6]
    mov esi, dword ptr [esp + 56]
    mov ebx, dword ptr [esp + 24]
    mov dword ptr [esp + 52], ecx
    push edx
    movzx edx, byte ptr [edi + 5]
    fild dword ptr [esp + 56]
    push eax
    fmul dword ptr [ebp + 32]
    mov eax, dword ptr [esp + 44]
    sub esp, 12
    mov dword ptr [esp + 72], edx
    fstp dword ptr [esp + 8]
    fild dword ptr [esp + 72]
    fmul dword ptr [ebp + 28]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 68]
    fadd dword ptr [ebp + 24]
    fstp dword ptr [esp]
    push esi
    call sub_1002EA92
    mov eax, dword ptr [esp + 52]
    mov ecx, dword ptr [ebp + 44]
    add esp, 32
    cmp eax, ecx
    jne L9
    mov ecx, dword ptr [ebp + 32]
    mov edx, dword ptr [ebp + 28]
    mov eax, dword ptr [ebp + 16]
    push ecx
    mov ecx, dword ptr [ebp + 24]
    push edx
    mov edx, dword ptr [ebp + 48]
    push eax
    mov eax, dword ptr [esp + 40]
    push ecx
    push esi
    push edx
    push eax
    call sub_1003266F
    add esp, 28
L9:
    movzx ecx, byte ptr [edi + 4]
    mov eax, dword ptr [ebp + 12]
    mov edi, dword ptr [ebp + 16]
    mov esi, dword ptr [esp + 28]
    mov ebx, dword ptr [esp + 52]
    mov dword ptr [esp + 48], ecx
    mov ecx, dword ptr [esp + 20]
    inc ecx
    fild dword ptr [esp + 48]
    dec eax
    mov dword ptr [esp + 20], ecx
    mov dword ptr [ebp + 12], eax
    fmul dword ptr [ebp + 28]
    fadd dword ptr [ebp + 20]
    fstp dword ptr [ebp + 20]
L10:
    mov edx, dword ptr [ebp + 8]
    cmp byte ptr [edx], 0
    jne L0
L11:
    mov eax, dword ptr [esp + 20]
    cmp eax, dword ptr [ebp + 44]
    jne L12
    mov ecx, dword ptr [ebp + 32]
    fld dword ptr [esp + 24]
    mov edx, dword ptr [ebp + 28]
    fadd dword ptr [ebp + 20]
    mov eax, dword ptr [ebp + 24]
    mov ebx, dword ptr [esp + 16]
    push ecx
    push edx
    push edi
    push eax
    push ecx
    mov ecx, dword ptr [ebp + 48]
    fstp dword ptr [esp]
    push ecx
    push esi
    call sub_100326DD
    add esp, 28
L12:
    pop edi
    pop esi
    pop ebx
FUN_10032560 ENDP
END
