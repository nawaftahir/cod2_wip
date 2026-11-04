.686
.MODEL FLAT, C
EXTRN sub_1006C5C1:PROC
EXTRN sub_1006C6BD:PROC
EXTRN sub_1006C6FF:PROC
EXTRN sub_100854E3:PROC
EXTRN sub_10085973:PROC
EXTRN sub_100859F9:PROC
EXTRN sub_1008B38F:PROC
EXTRN sub_100BE4B2:PROC
EXTRN sub_100BE4D8:PROC
EXTRN sub_100BE545:PROC
EXTRN sub_100BE59C:PROC
EXTRN sub_100BE5BE:PROC
EXTRN sub_100BE5EB:PROC
EXTRN sub_100BE5EE:PROC
EXTRN sub_100BE5F2:PROC
EXTRN sub_100BE5F4:PROC
EXTRN sub_100BE601:PROC
EXTRN sub_100BE69E:PROC
EXTRN sub_100BE6CE:PROC
EXTRN sub_100BE732:PROC
.CODE
FUN_100be188 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    push push edi
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 0100h]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 050000000h
    mov mov dword ptr [ebp - 16], edi
    je L0
    cmp cmp ecx, 010500000h
    je L1
    cmp cmp ecx, 010600000h
    je L2
    cmp cmp ecx, 010300000h
    je L3
    cmp cmp ecx, 010700000h
    jne L4
    cmp cmp dword ptr [eax + 12], 1
    jne L5
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 20]
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [eax + 84]
    cmp cmp edx, -1
    jne L6
    xor xor eax, eax
    inc inc eax
    jmp sub_100BE4B2
    and and dword ptr [ebp - 8], 0
L1:
    push push ebx
    push push esi
    mov mov esi, dword ptr [edi + 24]
    mov mov esi, dword ptr [esi + edx*4]
L2:
    mov mov edx, dword ptr [esi + 12]
    test test edx, edx
    mov mov dword ptr [ebp - 20], esi
L3:
    jbe L7
    mov mov ebx, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [ebx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 76]
    cmp cmp edx, dword ptr [ebp - 8]
    jbe L9
    mov mov dword ptr [ebp - 8], edx
    add add ebx, 4
    dec dec dword ptr [ebp - 12]
    jne L8
    mov mov edx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [ecx + edx*4]
L4:
    mov mov ebx, dword ptr [edx + 4]
    cmp cmp ebx, dword ptr [eax + 4]
L5:
    mov mov dword ptr [ebp - 12], ebx
    jne L10
    mov mov ebx, dword ptr [edx + 12]
    cmp cmp ebx, dword ptr [eax + 12]
    jne L11
    mov mov edx, dword ptr [edx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne L12
    mov mov edx, dword ptr [eax + 84]
    cmp cmp edx, dword ptr [eax + 88]
    je L13
    mov mov dword ptr [ebp - 4], 1
    mov mov edx, dword ptr [ebp - 8]
    cmp cmp edx, dword ptr [edi + 0FCh]
    ja L16
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp - 4], ebx
    jne L14
    mov mov edx, dword ptr [eax + 84]
    cmp cmp edx, dword ptr [eax + 88]
    jne L17
    test test byte ptr [edi + 108], 1
    je L15
    cmp cmp dword ptr [esi + 12], ebx
    je L18
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    cmp cmp eax, dword ptr [edi + 084h]
    je L19
    mov mov eax, dword ptr [esi]
    and and eax, 0FFF00000h
    cmp cmp eax, 010000000h
    jne L20
    mov mov eax, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + edx*4]
    test test byte ptr [eax + 4], 4
    jne L23
    xor xor edx, edx
    cmp cmp dword ptr [esi + 4], ebx
    jbe L21
    mov mov eax, dword ptr [esi + 8]
    mov mov ebx, dword ptr [eax]
    cmp cmp ebx, dword ptr [ebp - 24]
    jne L24
    inc inc edx
    add add eax, 4
    cmp cmp edx, dword ptr [esi + 4]
    jb L22
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    xor xor ebx, ebx
    cmp cmp dword ptr [eax + 60], ebx
    je L25
    xor xor eax, eax
    inc inc eax
    jmp sub_100BE59C
    push push 116
    call sub_10085973
    cmp cmp eax, ebx
    je L26
    mov mov ecx, eax
    call sub_100854E3
    mov mov ebx, eax
    test test ebx, ebx
    jne L27
    mov mov eax, 08007000Eh
    jmp sub_100BE5BE
    mov mov eax, dword ptr [edi + 0100h]
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 4], ecx
L10:
    push push 1
    setne setne cl
    add add ecx, dword ptr [esi + 12]
L11:
    push push ecx
    push push dword ptr [eax + 4]
    mov mov ecx, ebx
    push push dword ptr [eax]
L12:
    call sub_100859F9
    mov mov edi, eax
    test test edi, edi
    jge sub_100BE4D8
    push push 1
    mov mov ecx, ebx
    call sub_1006C5C1
    mov mov eax, edi
    jmp sub_100BE5F4
    mov mov ecx, dword ptr [esi + 12]
    mov mov esi, dword ptr [esi + 16]
    mov mov edi, dword ptr [ebx + 16]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 16]
    and and ecx, 3
    cmp cmp dword ptr [ebp - 4], 0
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    je sub_100BE545
    mov mov ecx, dword ptr [eax + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [edx + 12]
    mov mov esi, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [esi + edx*4], ecx
    mov mov ecx, dword ptr [ebx + 12]
    and and dword ptr [ebp - 4], 0
    test test ecx, ecx
    jbe sub_100BE5EB
    mov mov dword ptr [ebp - 12], 1
L15:
    mov mov edx, dword ptr [ebp - 12]
    cmp cmp edx, ecx
    mov mov dword ptr [ebp - 8], edx
    jae sub_100BE5EE
    mov mov ecx, dword ptr [ebx + 16]
    mov mov esi, dword ptr [ebp - 4]
    mov mov esi, dword ptr [ecx + esi*4]
    mov mov edx, dword ptr [eax + 20]
    mov mov edi, dword ptr [edx + esi*4]
    mov mov esi, dword ptr [ebp - 8]
    shl shl esi, 2
    mov mov ecx, dword ptr [esi + ecx]
    mov mov edx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [edi + 16]
    cmp cmp ecx, dword ptr [edx + 16]
    mov mov dword ptr [ebp - 28], edx
    jbe sub_100BE601
    mov mov ecx, dword ptr [ebx + 16]
    add add esi, ecx
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [ebp - 24], edx
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + edx*4]
L17:
    mov mov edx, dword ptr [ebp - 24]
    mov mov dword ptr [esi], ecx
    mov mov ecx, dword ptr [ebx + 16]
    mov mov esi, dword ptr [ebp - 4]
L18:
    mov mov dword ptr [ecx + esi*4], edx
    mov mov edx, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [edi + 16]
    cmp cmp ecx, dword ptr [edx + 16]
    je sub_100BE69E
    inc inc dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [ebx + 12]
    jb sub_100BE5EE
    inc inc dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebx + 12]
    inc inc dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 4], ecx
    jb sub_100BE5F2
    mov mov edx, dword ptr [eax + 0100h]
    mov mov ecx, dword ptr [edx + 4]
L23:
    mov mov esi, dword ptr [edx + 8]
    mov mov edi, dword ptr [ebx + 8]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [eax + 0FCh]
    mov mov edx, dword ptr [eax + 24]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test ecx, ecx
    je sub_100BE6CE
    push push 1
    call sub_1006C6BD
    mov mov eax, dword ptr [ebp - 16]
L25:
    mov mov ecx, dword ptr [eax + 0FCh]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [eax + ecx*4], ebx
    mov mov eax, dword ptr [ebp - 20]
    and and dword ptr [eax], 0
    xor xor eax, eax
    pop pop esi
    pop pop ebx
    pop pop edi
    leave leave
    ret ret
    mov mov ecx, dword ptr [eax + 0100h]
    push push 010117D6Ch
    push push 012D6h
    push push dword ptr [ecx + 60]
    push push eax
    call sub_1008B38F
    mov mov ecx, dword ptr [ebp - 20]
    add add esp, 16
    push push 1
    call sub_1006C6FF
    mov mov eax, 080004005h
    jmp sub_100BE732
FUN_100be188 ENDP
END
