.686
.MODEL FLAT, C
EXTRN sub_1004672C:PROC
EXTRN sub_1004675F:PROC
.CODE
FUN_10046000 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 000000A30h
    mov eax, dword ptr [esi + 0000000B0h]
    test eax, eax
    push ebx
    push edi
    jg L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 19
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], 0
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L0:
    mov ebx, dword ptr [esi + 0000000B4h]
    mov eax, dword ptr [ebx + 20]
    test eax, eax
    mov dword ptr [esp + 20], ebx
    jne L1
    cmp dword ptr [ebx + 24], 63
    jne L1
    mov eax, dword ptr [esi + 68]
    test eax, eax
    mov byte ptr [esi + 0000000DCh], 0
    jle L2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    lea edi, [esp + 44]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    jmp L2
L1:
    mov eax, dword ptr [esi + 68]
    test eax, eax
    mov byte ptr [esi + 0000000DCh], 1
    jle L2
    mov ecx, eax
    and ecx, 000FFFFFFh
    shl ecx, 6
    or eax, 0FFFFFFFFh
    lea edi, [esp + 56]
    rep stosd dword ptr es:[edi], eax
L2:
    mov ecx, dword ptr [esi + 0000000B0h]
    mov eax, 1
    cmp ecx, eax
    mov dword ptr [esp + 12], eax
    jl L32
L3:
    mov eax, dword ptr [ebx]
    test eax, eax
    mov dword ptr [esp + 16], eax
    jle L4
    cmp eax, 4
    jle L5
L4:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 26
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 28], 4
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L5:
    mov eax, dword ptr [esp + 16]
    xor edi, edi
    test eax, eax
    jle L10
L6:
    mov ebx, dword ptr [ebx + edi*4 + 4]
    test ebx, ebx
    jl L7
    cmp ebx, dword ptr [esi + 68]
    jl L8
L7:
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [edx + 20], 19
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L8:
    test edi, edi
    jle L9
    mov eax, dword ptr [esp + 20]
    cmp ebx, dword ptr [eax + edi*4]
    jg L9
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esp + 12]
    mov dword ptr [ecx + 20], 19
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L9:
    mov eax, dword ptr [esp + 16]
    mov ebx, dword ptr [esp + 20]
    inc edi
    cmp edi, eax
    jl L6
L10:
    cmp byte ptr [esi + 0000000DCh], 0
    mov edi, dword ptr [ebx + 20]
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebx + 28]
    mov edx, dword ptr [ebx + 32]
    mov dword ptr [esp + 32], edi
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 40], edx
    je L25
    test edi, edi
    jl L11
    cmp edi, 64
    jge L11
    cmp eax, edi
    jl L11
    cmp eax, 64
    jge L11
    test ecx, ecx
    jl L11
    cmp ecx, 10
    jg L11
    test edx, edx
    jl L11
    cmp edx, 10
    jle L12
L11:
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [edx + 20], 17
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    mov eax, dword ptr [esp + 32]
    add esp, 4
L12:
    test edi, edi
    jne L13
    test eax, eax
    je L15
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esp + 12]
    mov dword ptr [eax + 20], 17
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    jmp L14
L13:
    cmp dword ptr [esp + 16], 1
    je L15
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esp + 12]
    mov dword ptr [ecx + 20], 17
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
L14:
    add esp, 4
L15:
    mov eax, dword ptr [esp + 16]
    test eax, eax
    jle L31
    add ebx, 4
    mov dword ptr [esp + 16], ebx
    mov dword ptr [esp + 24], eax
    jmp L17
L16:
    mov edi, dword ptr [esp + 32]
L17:
    mov ebx, dword ptr [ebx]
    shl ebx, 8
    test edi, edi
    lea ebx, [esp + ebx + 56]
    je L18
    cmp dword ptr [ebx], 0
    jge L18
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [edx + 20], 17
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L18:
    mov eax, dword ptr [esp + 32]
    cmp eax, dword ptr [esp + 28]
    jg L24
    jmp L19
    lea ecx, [ecx]
L19:
    mov eax, dword ptr [ebx + edi*4]
    test eax, eax
    jge L20
    mov eax, dword ptr [esp + 36]
    test eax, eax
    je L23
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esp + 12]
    mov dword ptr [ecx + 20], 17
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    jmp L22
L20:
    mov ecx, dword ptr [esp + 36]
    cmp ecx, eax
    jne L21
    mov eax, dword ptr [esp + 40]
    dec ecx
    cmp eax, ecx
    je L23
L21:
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [edx + 20], 17
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
L22:
    add esp, 4
L23:
    mov eax, dword ptr [esp + 40]
    mov dword ptr [ebx + edi*4], eax
    mov eax, dword ptr [esp + 28]
    inc edi
    cmp edi, eax
    jle L19
L24:
    mov ebx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 24]
    add ebx, 4
    dec eax
    mov dword ptr [esp + 16], ebx
    mov dword ptr [esp + 24], eax
    jne L16
    jmp L30
L25:
    test edi, edi
    jne L26
    cmp eax, 63
    jne L26
    test ecx, ecx
    jne L26
    test edx, edx
    je L27
L26:
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esp + 12]
    mov dword ptr [ecx + 20], 17
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L27:
    mov eax, dword ptr [esp + 16]
    test eax, eax
    jle L31
    mov edx, eax
    add ebx, 4
    mov dword ptr [esp + 24], edx
    jmp L28
    lea ecx, [ecx]
L28:
    mov eax, dword ptr [ebx]
    lea edi, [esp + eax + 44]
    cmp byte ptr [edi], 0
    je L29
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esp + 12]
    mov dword ptr [eax + 20], 19
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L29:
    mov eax, dword ptr [esp + 24]
    add ebx, 4
    dec eax
    mov byte ptr [edi], 1
    mov dword ptr [esp + 24], eax
    jne L28
L30:
    mov ebx, dword ptr [esp + 20]
L31:
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [esi + 0000000B0h]
    add ebx, 36
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 20], ebx
    mov dword ptr [esp + 12], eax
    jle L3
L32:
    mov al, byte ptr [esi + 0000000DCh]
    xor edi, edi
    test al, al
    mov eax, dword ptr [esi + 68]
    je L35
    test eax, eax
    jle sub_1004672C
    lea ebx, [esp + 56]
    nop
L33:
    cmp dword ptr [ebx], 0
    jge L34
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 45
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L34:
    mov eax, dword ptr [esi + 68]
    inc edi
    add ebx, 000000100h
    cmp edi, eax
    jl L33
    pop edi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L35:
    test eax, eax
    jle sub_1004675F
    mov edi, edi
L36:
    mov al, byte ptr [esp + edi + 44]
    test al, al
    jne L37
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 45
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L37:
    mov eax, dword ptr [esi + 68]
    inc edi
    cmp edi, eax
    jl L36
FUN_10046000 ENDP
END
