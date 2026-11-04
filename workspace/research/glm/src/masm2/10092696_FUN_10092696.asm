.686
.MODEL FLAT, C
EXTRN sub_1008A38F:PROC
EXTRN sub_1008A3D8:PROC
EXTRN sub_1008B26C:PROC
EXTRN sub_10092971:PROC
EXTRN sub_10092981:PROC
EXTRN sub_10092984:PROC
EXTRN sub_10092998:PROC
EXTRN sub_1009299B:PROC
EXTRN sub_100929B9:PROC
EXTRN sub_100929EF:PROC
EXTRN sub_100929F3:PROC
EXTRN sub_10092A6D:PROC
EXTRN sub_10092A72:PROC
EXTRN sub_10092A83:PROC
EXTRN sub_10092A8A:PROC
EXTRN sub_10092A93:PROC
EXTRN sub_10092B1B:PROC
EXTRN sub_10092B4E:PROC
EXTRN sub_10092B5B:PROC
EXTRN sub_10092B60:PROC
EXTRN sub_10092B6C:PROC
EXTRN sub_10092B7F:PROC
EXTRN sub_10092C00:PROC
EXTRN sub_10092C16:PROC
.CODE
FUN_10092696 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 60
    mov mov eax, dword ptr [ecx + 20]
    mov mov edx, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 4], ecx
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je L0
    mov mov dword ptr [ebp + 12], ecx
    mov mov edx, ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    mov mov esi, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [ebx]
    cmp cmp eax, dword ptr [esi + 4]
    push push edi
    mov mov dword ptr [ebp - 20], esi
    jne sub_10092971
    mov mov eax, dword ptr [esi + 12]
    mov mov ecx, dword ptr [ebx + 16]
    shl shl eax, 2
    cmp cmp dword ptr [eax + ecx], -1
    jne sub_10092984
    mov mov ecx, dword ptr [ebx + 4]
    mov mov edi, dword ptr [ebx + 8]
    cmp cmp dword ptr [eax + edi], ecx
    jae L1
    mov mov edi, dword ptr [ebx + 12]
    cmp cmp dword ptr [eax + edi], ecx
    jb sub_1009299B
    mov mov eax, dword ptr [ebp + 24]
    or or ecx, -1
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 8], ecx
    jne L6
    and and dword ptr [ebp + 24], 0
    cmp cmp dword ptr [ebx + 44], 0
    jbe L9
    mov mov ecx, dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebx + 32]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 60]
    mov mov edx, dword ptr [ebx + 64]
    and and dword ptr [ebp + 8], 0
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [esi + 12]
    mov mov esi, dword ptr [ebx + 68]
    shl shl eax, 2
    mov mov edi, dword ptr [ecx + eax]
    test test edi, edi
    mov mov eax, dword ptr [edx + eax]
    lea lea eax, [esi + eax*4]
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 28], eax
    jbe L3
    mov mov eax, dword ptr [ebx + 16]
    mov mov esi, dword ptr [ebp - 28]
    mov mov edi, dword ptr [ebp + 8]
    mov mov edi, dword ptr [esi + edi*4]
    mov mov esi, dword ptr [ebp - 16]
    cmp cmp esi, dword ptr [eax + edi*4]
    je L4
    inc inc dword ptr [ebp + 8]
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp esi, dword ptr [ebp - 24]
    jb L2
    mov mov esi, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp dword ptr [ebp + 8], eax
    jb L11
    jmp L5
    mov mov esi, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp + 20]
    cmp cmp eax, -1
    je L8
    mov mov edi, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [eax + 12]
    and and dword ptr [ebp + 8], 0
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + ecx]
    test test ecx, ecx
    mov mov edx, dword ptr [eax + edx]
    mov mov eax, dword ptr [ebx + 68]
    lea lea eax, [eax + edx*4]
    jbe L11
    mov mov edx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebp + 8]
    mov mov edi, dword ptr [eax + edi*4]
    cmp cmp esi, dword ptr [edx + edi*4]
    je L12
    inc inc dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp + 8], ecx
    jb L10
    cmp cmp dword ptr [ebp + 8], ecx
    jb L13
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 60]
    push push eax
    push push dword ptr [ebp + 16]
    push push esi
    push push dword ptr [ebp + 12]
    push push ebx
    call sub_1008A38F
    cmp cmp eax, dword ptr [ebp - 8]
    jae L14
    test test eax, eax
    mov mov dword ptr [ebp - 12], esi
    lea lea esi, [ebp - 60]
    lea lea edi, [ebp - 44]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [ebp - 8], eax
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    je sub_10092981
    inc inc dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebp + 24]
    cmp cmp eax, dword ptr [ebx + 44]
    mov mov esi, dword ptr [ebp - 20]
    jb L7
    jmp sub_10092998
    mov mov edi, dword ptr [ebx + 32]
    mov mov eax, dword ptr [edi + eax*4]
    push push ecx
    lea lea ecx, [ebp - 44]
    push push ecx
    push push dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    push push eax
    push push edx
    push push ebx
    mov mov dword ptr [ebp - 12], eax
    call sub_1008A3D8
    mov mov dword ptr [ebp - 8], eax
L2:
    jmp sub_100929B9
    mov mov esi, dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp - 8], -1
    jne sub_100929F3
    test test byte ptr [ebx + 96], 2
    je sub_100929EF
    mov mov eax, dword ptr [ebx + 92]
L4:
    push push 0101106A0h
    push push 0FA4h
    push push dword ptr [eax + 60]
    push push dword ptr [ebp - 4]
    call sub_1008B26C
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_10092B1B
    mov mov eax, dword ptr [esi + 12]
L5:
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + eax*4], edx
    mov mov eax, dword ptr [ebp - 4]
    test test byte ptr [eax + 0CCh], 4
    je sub_10092A83
    mov mov edi, dword ptr [ebx + 36]
    cmp cmp edx, edi
    jae sub_10092A8A
    mov mov ecx, dword ptr [ebx + 32]
    xor xor eax, eax
    jmp sub_10092A6D
    add add ecx, 4
    inc inc eax
    cmp cmp dword ptr [ecx], edx
    jne sub_10092A72
    cmp cmp eax, edi
    jae sub_10092A93
    mov mov ecx, dword ptr [ebx + 32]
    lea lea ecx, [ecx + eax*4]
    mov mov edi, dword ptr [ecx]
    inc inc eax
    mov mov dword ptr [ecx - 4], edi
    cmp cmp eax, dword ptr [ebx + 36]
    jb sub_10092A93
    mov mov eax, dword ptr [ebx + 36]
    mov mov ecx, dword ptr [ebx + 32]
    mov mov dword ptr [ecx + eax*4 - 4], edx
    and and dword ptr [ebp + 12], 0
    mov mov ecx, dword ptr [ebp + 12]
L8:
    mov mov eax, dword ptr [esi + 12]
    lea lea eax, [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 24]
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + ecx]
    cmp cmp ecx, -1
    mov mov dword ptr [ebp + 16], ecx
    je sub_10092B5B
    mov mov ecx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + ecx*4 - 44]
    mov mov edi, dword ptr [ebx + 20]
L10:
    mov mov dword ptr [eax + edi], ecx
    lea lea eax, [ecx + edx*4]
    mov mov ecx, dword ptr [ebx + 28]
    lea lea eax, [ecx + eax*4]
    cmp cmp dword ptr [eax], -1
    je sub_10092B60
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov edx, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edi, dword ptr [ecx + 88]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx + 20]
    shl shl ecx, 2
    mov mov edx, dword ptr [edx + ecx]
    cmp cmp dword ptr [edx + 88], edi
    jbe sub_10092B7F
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [ecx + eax]
    add add eax, 48
    cmp cmp dword ptr [eax], -1
    jne sub_10092B6C
    mov mov edx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + 20]
L13:
    mov mov edi, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov edi, dword ptr [eax]
    mov mov dword ptr [ecx + 48], edi
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [eax], ecx
    inc inc dword ptr [ebp + 12]
    cmp cmp dword ptr [ebp + 12], 4
    jb sub_10092B4E
    mov mov esi, dword ptr [esi + 8]
    cmp cmp esi, -1
    je sub_10092C00
    mov mov ecx, dword ptr [ebp - 4]
    push push -1
    push push -1
    push push 0
    push push esi
    push push ebx
    call L15
L15:
    test test eax, eax
    jl sub_10092C16
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_10092696 ENDP
END
