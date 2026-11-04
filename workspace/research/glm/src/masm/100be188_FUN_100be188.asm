.686
.MODEL FLAT, C
EXTRN sub_1006C5C1:PROC
EXTRN sub_1006C6BD:PROC
EXTRN sub_1006C6FF:PROC
EXTRN sub_100854E3:PROC
EXTRN sub_10085973:PROC
EXTRN sub_100859F9:PROC
EXTRN sub_1008B38F:PROC
.CODE
FUN_100be188 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 000000100h]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 050000000h
    mov dword ptr [ebp - 16], edi
    je L0
    cmp ecx, 010500000h
    je L0
    cmp ecx, 010600000h
    je L0
    cmp ecx, 010300000h
    je L0
    cmp ecx, 010700000h
    jne L1
L0:
    cmp dword ptr [eax + 12], 1
    jne L1
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 20]
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [eax + 84]
    cmp edx, -1
    jne L2
L1:
    xor eax, eax
    inc eax
    jmp L24
L2:
    and dword ptr [ebp - 8], 0
    push ebx
    push esi
    mov esi, dword ptr [edi + 24]
    mov esi, dword ptr [esi + edx*4]
    mov edx, dword ptr [esi + 12]
    test edx, edx
    mov dword ptr [ebp - 20], esi
    jbe L5
    mov ebx, dword ptr [esi + 16]
    mov dword ptr [ebp - 12], edx
L3:
    mov edx, dword ptr [ebx]
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 76]
    cmp edx, dword ptr [ebp - 8]
    jbe L4
    mov dword ptr [ebp - 8], edx
L4:
    add ebx, 4
    dec dword ptr [ebp - 12]
    jne L3
L5:
    mov edx, dword ptr [esi + 16]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [edx + 4]
    cmp ebx, dword ptr [eax + 4]
    mov dword ptr [ebp - 12], ebx
    jne L6
    mov ebx, dword ptr [edx + 12]
    cmp ebx, dword ptr [eax + 12]
    jne L6
    mov edx, dword ptr [edx + 8]
    cmp edx, dword ptr [eax + 8]
    jne L6
    mov edx, dword ptr [eax + 84]
    cmp edx, dword ptr [eax + 88]
    je L6
    mov dword ptr [ebp - 4], 1
L6:
    mov edx, dword ptr [ebp - 8]
    cmp edx, dword ptr [edi + 0000000FCh]
    ja L11
    xor ebx, ebx
    cmp dword ptr [ebp - 4], ebx
    jne L7
    mov edx, dword ptr [eax + 84]
    cmp edx, dword ptr [eax + 88]
    jne L11
L7:
    test byte ptr [edi + 108], 1
    je L8
    cmp dword ptr [esi + 12], ebx
    je L11
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    cmp eax, dword ptr [edi + 000000084h]
    je L11
L8:
    mov eax, dword ptr [esi]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L11
    mov eax, dword ptr [edi + 16]
    mov edx, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 4], 4
    jne L11
    xor edx, edx
    cmp dword ptr [esi + 4], ebx
    jbe L10
    mov eax, dword ptr [esi + 8]
L9:
    mov ebx, dword ptr [eax]
    cmp ebx, dword ptr [ebp - 24]
    jne L11
    inc edx
    add eax, 4
    cmp edx, dword ptr [esi + 4]
    jb L9
L10:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    xor ebx, ebx
    cmp dword ptr [eax + 60], ebx
    je L12
L11:
    xor eax, eax
    inc eax
    jmp L23
L12:
    push 116
    call sub_10085973
    cmp eax, ebx
    je L13
    mov ecx, eax
    call sub_100854E3
    mov ebx, eax
L13:
    test ebx, ebx
    jne L14
    mov eax, 08007000Eh
    jmp L23
L14:
    mov eax, dword ptr [edi + 000000100h]
    xor ecx, ecx
    cmp dword ptr [ebp - 4], ecx
    push 1
    setne cl
    add ecx, dword ptr [esi + 12]
    push ecx
    push dword ptr [eax + 4]
    mov ecx, ebx
    push dword ptr [eax]
    call sub_100859F9
    mov edi, eax
    test edi, edi
    jge L15
    push 1
    mov ecx, ebx
    call sub_1006C5C1
    mov eax, edi
    jmp L23
L15:
    mov ecx, dword ptr [esi + 12]
    mov esi, dword ptr [esi + 16]
    mov edi, dword ptr [ebx + 16]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 16]
    and ecx, 3
    cmp dword ptr [ebp - 4], 0
    rep movsb byte ptr es:[edi], byte ptr [esi]
    je L16
    mov ecx, dword ptr [eax + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebp - 20]
    mov edx, dword ptr [edx + 12]
    mov esi, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx]
    mov dword ptr [esi + edx*4], ecx
L16:
    mov ecx, dword ptr [ebx + 12]
    and dword ptr [ebp - 4], 0
    test ecx, ecx
    jbe L21
    mov dword ptr [ebp - 12], 1
L17:
    mov edx, dword ptr [ebp - 12]
    cmp edx, ecx
    mov dword ptr [ebp - 8], edx
    jae L20
L18:
    mov ecx, dword ptr [ebx + 16]
    mov esi, dword ptr [ebp - 4]
    mov esi, dword ptr [ecx + esi*4]
    mov edx, dword ptr [eax + 20]
    mov edi, dword ptr [edx + esi*4]
    mov esi, dword ptr [ebp - 8]
    shl esi, 2
    mov ecx, dword ptr [esi + ecx]
    mov edx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [edi + 16]
    cmp ecx, dword ptr [edx + 16]
    mov dword ptr [ebp - 28], edx
    jbe L19
    mov ecx, dword ptr [ebx + 16]
    add esi, ecx
    mov edx, dword ptr [esi]
    mov dword ptr [ebp - 24], edx
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ebp - 24]
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [ebx + 16]
    mov esi, dword ptr [ebp - 4]
    mov dword ptr [ecx + esi*4], edx
    mov edx, dword ptr [ebp - 28]
L19:
    mov ecx, dword ptr [edi + 16]
    cmp ecx, dword ptr [edx + 16]
    je L25
    inc dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebx + 12]
    jb L18
L20:
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [ebx + 12]
    inc dword ptr [ebp - 12]
    cmp dword ptr [ebp - 4], ecx
    jb L17
L21:
    mov edx, dword ptr [eax + 000000100h]
    mov ecx, dword ptr [edx + 4]
    mov esi, dword ptr [edx + 8]
    mov edi, dword ptr [ebx + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [eax + 0000000FCh]
    mov edx, dword ptr [eax + 24]
    mov ecx, dword ptr [edx + ecx*4]
    test ecx, ecx
    je L22
    push 1
    call sub_1006C6BD
    mov eax, dword ptr [ebp - 16]
L22:
    mov ecx, dword ptr [eax + 0000000FCh]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [eax + ecx*4], ebx
    mov eax, dword ptr [ebp - 20]
    and dword ptr [eax], 0
    xor eax, eax
L23:
    pop esi
    pop ebx
L24:
    pop edi
    leave
    ret
L25:
    mov ecx, dword ptr [eax + 000000100h]
    push 010117D6Ch
    push 0000012D6h
    push dword ptr [ecx + 60]
    push eax
    call sub_1008B38F
    mov ecx, dword ptr [ebp - 20]
    add esp, 16
    push 1
    call sub_1006C6FF
    mov eax, 080004005h
    jmp L23
FUN_100be188 ENDP
END
