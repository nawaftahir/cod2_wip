.686
.MODEL FLAT, C
EXTRN sub_1004C7E6:PROC
EXTRN sub_1004C7F9:PROC
.CODE
FUN_10050680 PROC
    sub esp, 12
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 28]
    mov eax, dword ptr [esi + 000000174h]
    xor ebp, ebp
    cmp eax, ebp
    sete bl
    push edi
    mov edi, dword ptr [esi + 0000001A0h]
    xor cl, cl
    test bl, bl
    mov dword ptr [esp + 24], edi
    mov byte ptr [esp + 32], bl
    je L0
    cmp dword ptr [esi + 000000178h], ebp
    jmp L3
L0:
    mov edx, dword ptr [esi + 000000178h]
    cmp eax, edx
    jg L1
    cmp edx, 64
    jl L2
L1:
    mov cl, 1
L2:
    cmp dword ptr [esi + 00000012Ch], 1
L3:
    je L4
    mov cl, 1
L4:
    mov eax, dword ptr [esi + 00000017Ch]
    cmp eax, ebp
    je L5
    mov edx, dword ptr [esi + 000000180h]
    dec eax
    cmp edx, eax
    je L5
    mov cl, 1
L5:
    cmp dword ptr [esi + 000000180h], 13
    jg L6
    test cl, cl
    je L7
L6:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 16
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 000000174h]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 000000178h]
    mov dword ptr [eax + 28], ecx
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 00000017Ch]
    mov dword ptr [edx + 32], eax
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 000000180h]
    mov dword ptr [ecx + 36], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L7:
    cmp dword ptr [esi + 00000012Ch], ebp
    mov dword ptr [esp + 16], ebp
    jle L13
    lea ecx, [esi + 000000130h]
    mov dword ptr [esp + 20], ecx
    jmp L8
    lea ecx, [ecx]
L8:
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [edx]
    mov ebx, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 000000094h]
    mov al, byte ptr [esp + 32]
    mov ebp, ebx
    shl ebp, 8
    add ebp, ecx
    test al, al
    jne L9
    cmp dword ptr [ebp], 0
    jge L9
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 115
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], ebx
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 28], 0
    mov ecx, dword ptr [esi]
    push -1
    push esi
    call dword ptr [ecx + 4]
    add esp, 8
L9:
    mov edi, dword ptr [esi + 000000174h]
    cmp edi, dword ptr [esi + 000000178h]
    jg L12
L10:
    mov eax, dword ptr [ebp + edi*4]
    mov ecx, dword ptr [esi + 00000017Ch]
    xor edx, edx
    test eax, eax
    setl dl
    dec edx
    and eax, edx
    cmp ecx, eax
    je L11
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 115
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], ebx
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 28], edi
    mov eax, dword ptr [esi]
    push -1
    push esi
    call dword ptr [eax + 4]
    add esp, 8
L11:
    mov ecx, dword ptr [esi + 000000180h]
    mov dword ptr [ebp + edi*4], ecx
    mov eax, dword ptr [esi + 000000178h]
    inc edi
    cmp edi, eax
    jle L10
L12:
    mov eax, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 20]
    mov ecx, dword ptr [esi + 00000012Ch]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], edx
    jl L8
    mov edi, dword ptr [esp + 24]
    mov bl, byte ptr [esp + 32]
    xor ebp, ebp
L13:
    cmp dword ptr [esi + 00000017Ch], ebp
    jne L15
    test bl, bl
    je L14
    mov dword ptr [edi + 4], 010050980h
    jmp L17
L14:
    mov dword ptr [edi + 4], 010050BD0h
    jmp L17
L15:
    test bl, bl
    je L16
    mov dword ptr [edi + 4], 010050E10h
    jmp L17
L16:
    mov dword ptr [edi + 4], 010050F00h
L17:
    cmp dword ptr [esi + 00000012Ch], ebp
    mov dword ptr [esp + 16], ebp
    jle L22
    lea ebx, [edi + 24]
    lea ebp, [esi + 000000130h]
L18:
    mov cl, byte ptr [esp + 32]
    test cl, cl
    mov eax, dword ptr [ebp]
    je L19
    mov ecx, dword ptr [esi + 00000017Ch]
    test ecx, ecx
    jne L21
    mov ecx, dword ptr [eax + 20]
    push 1
    lea eax, [edi + ecx*4 + 44]
    push esi
    call sub_1004C7E6
    jmp L20
L19:
    mov ecx, dword ptr [eax + 24]
    lea edi, [edi + ecx*4 + 44]
    push 0
    push esi
    mov eax, edi
    call sub_1004C7F9
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esp + 32]
    mov dword ptr [eax + 60], edx
    mov edi, eax
L20:
    add esp, 8
L21:
    mov eax, dword ptr [esp + 16]
    mov dword ptr [ebx], 0
    mov ecx, dword ptr [esi + 00000012Ch]
    inc eax
    add ebp, 4
    add ebx, 4
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jl L18
    xor ebp, ebp
L22:
    mov dword ptr [edi + 16], ebp
    mov dword ptr [edi + 12], ebp
    mov dword ptr [edi + 20], ebp
    mov byte ptr [edi + 8], 0
    mov ecx, dword ptr [esi + 000000104h]
    mov dword ptr [edi + 40], ecx
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10050680 ENDP
END
