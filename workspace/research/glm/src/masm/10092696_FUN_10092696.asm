.686
.MODEL FLAT, C
EXTRN sub_1008A38F:PROC
EXTRN sub_1008A3D8:PROC
EXTRN sub_1008B26C:PROC
.CODE
FUN_10092696 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 60
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [ebp + 12]
    mov dword ptr [ebp - 4], ecx
    mov ecx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L1
    mov dword ptr [ebp + 12], ecx
    mov edx, ecx
L1:
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax + edx*4]
    mov eax, dword ptr [ebx]
    cmp eax, dword ptr [esi + 4]
    push edi
    mov dword ptr [ebp - 20], esi
    jne L28
    mov eax, dword ptr [esi + 12]
    mov ecx, dword ptr [ebx + 16]
    shl eax, 2
    cmp dword ptr [eax + ecx], -1
    jne L28
    mov ecx, dword ptr [ebx + 4]
    mov edi, dword ptr [ebx + 8]
    cmp dword ptr [eax + edi], ecx
    jae L2
    mov edi, dword ptr [ebx + 12]
    cmp dword ptr [eax + edi], ecx
    jb L28
L2:
    mov eax, dword ptr [ebp + 24]
    or ecx, 0FFFFFFFFh
    cmp eax, ecx
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 8], ecx
    jne L12
    and dword ptr [ebp + 24], 0
    cmp dword ptr [ebx + 44], 0
    jbe L15
L3:
    mov ecx, dword ptr [ebp + 24]
    mov eax, dword ptr [ebx + 32]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 60]
    mov edx, dword ptr [ebx + 64]
    and dword ptr [ebp + 8], 0
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [esi + 12]
    mov esi, dword ptr [ebx + 68]
    shl eax, 2
    mov edi, dword ptr [ecx + eax]
    test edi, edi
    mov eax, dword ptr [edx + eax]
    lea eax, [esi + eax*4]
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 28], eax
    jbe L6
    mov eax, dword ptr [ebx + 16]
L4:
    mov esi, dword ptr [ebp - 28]
    mov edi, dword ptr [ebp + 8]
    mov edi, dword ptr [esi + edi*4]
    mov esi, dword ptr [ebp - 16]
    cmp esi, dword ptr [eax + edi*4]
    je L5
    inc dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 8]
    cmp esi, dword ptr [ebp - 24]
    jb L4
    mov esi, dword ptr [ebp - 16]
L5:
    mov eax, dword ptr [ebp - 24]
    cmp dword ptr [ebp + 8], eax
    jb L11
    jmp L7
L6:
    mov esi, dword ptr [ebp - 16]
L7:
    mov eax, dword ptr [ebp + 20]
    cmp eax, -1
    je L10
    mov edi, dword ptr [ebp - 4]
    mov edi, dword ptr [edi + 20]
    mov eax, dword ptr [edi + eax*4]
    mov eax, dword ptr [eax + 12]
    and dword ptr [ebp + 8], 0
    shl eax, 2
    mov ecx, dword ptr [eax + ecx]
    test ecx, ecx
    mov edx, dword ptr [eax + edx]
    mov eax, dword ptr [ebx + 68]
    lea eax, [eax + edx*4]
    jbe L10
    mov edx, dword ptr [ebx + 16]
L8:
    mov edi, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + edi*4]
    cmp esi, dword ptr [edx + edi*4]
    je L9
    inc dword ptr [ebp + 8]
    cmp dword ptr [ebp + 8], ecx
    jb L8
L9:
    cmp dword ptr [ebp + 8], ecx
    jb L11
L10:
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 60]
    push eax
    push dword ptr [ebp + 16]
    push esi
    push dword ptr [ebp + 12]
    push ebx
    call sub_1008A38F
    cmp eax, dword ptr [ebp - 8]
    jae L11
    test eax, eax
    mov dword ptr [ebp - 12], esi
    lea esi, [ebp - 60]
    lea edi, [ebp - 44]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [ebp - 8], eax
    movsd dword ptr es:[edi], dword ptr [esi]
    je L13
L11:
    inc dword ptr [ebp + 24]
    mov eax, dword ptr [ebp + 24]
    cmp eax, dword ptr [ebx + 44]
    mov esi, dword ptr [ebp - 20]
    jb L3
    jmp L14
L12:
    mov edi, dword ptr [ebx + 32]
    mov eax, dword ptr [edi + eax*4]
    push ecx
    lea ecx, [ebp - 44]
    push ecx
    push dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    push eax
    push edx
    push ebx
    mov dword ptr [ebp - 12], eax
    call sub_1008A3D8
    mov dword ptr [ebp - 8], eax
    jmp L14
L13:
    mov esi, dword ptr [ebp - 20]
L14:
    cmp dword ptr [ebp - 8], -1
    jne L17
L15:
    test byte ptr [ebx + 96], 2
    je L16
    mov eax, dword ptr [ebx + 92]
    push 0101106A0h
    push 000000FA4h
    push dword ptr [eax + 60]
    push dword ptr [ebp - 4]
    call sub_1008B26C
    add esp, 16
L16:
    mov eax, 080004005h
    jmp L30
L17:
    mov eax, dword ptr [esi + 12]
    mov ecx, dword ptr [ebx + 16]
    mov edx, dword ptr [ebp - 12]
    mov dword ptr [ecx + eax*4], edx
    mov eax, dword ptr [ebp - 4]
    test byte ptr [eax + 0000000CCh], 4
    je L22
    mov edi, dword ptr [ebx + 36]
    cmp edx, edi
    jae L22
    mov ecx, dword ptr [ebx + 32]
    xor eax, eax
    jmp L19
L18:
    add ecx, 4
L19:
    inc eax
    cmp dword ptr [ecx], edx
    jne L18
    cmp eax, edi
    jae L21
L20:
    mov ecx, dword ptr [ebx + 32]
    lea ecx, [ecx + eax*4]
    mov edi, dword ptr [ecx]
    inc eax
    mov dword ptr [ecx - 4], edi
    cmp eax, dword ptr [ebx + 36]
    jb L20
L21:
    mov eax, dword ptr [ebx + 36]
    mov ecx, dword ptr [ebx + 32]
    mov dword ptr [ecx + eax*4 - 4], edx
L22:
    and dword ptr [ebp + 12], 0
L23:
    mov ecx, dword ptr [ebp + 12]
    mov eax, dword ptr [esi + 12]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [ebx + 24]
    shl eax, 2
    mov ecx, dword ptr [eax + ecx]
    cmp ecx, -1
    mov dword ptr [ebp + 16], ecx
    je L27
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + ecx*4 - 44]
    mov edi, dword ptr [ebx + 20]
    mov dword ptr [eax + edi], ecx
    lea eax, [ecx + edx*4]
    mov ecx, dword ptr [ebx + 28]
    lea eax, [ecx + eax*4]
    cmp dword ptr [eax], -1
    je L26
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 20]
    mov edx, dword ptr [ebp + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov edi, dword ptr [ecx + 88]
L24:
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + 20]
    shl ecx, 2
    mov edx, dword ptr [edx + ecx]
    cmp dword ptr [edx + 88], edi
    jbe L25
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [ecx + eax]
    add eax, 48
    cmp dword ptr [eax], -1
    jne L24
L25:
    mov edx, dword ptr [ebp - 12]
L26:
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 20]
    mov edi, dword ptr [ebp + 16]
    mov ecx, dword ptr [ecx + edi*4]
    mov edi, dword ptr [eax]
    mov dword ptr [ecx + 48], edi
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [eax], ecx
L27:
    inc dword ptr [ebp + 12]
    cmp dword ptr [ebp + 12], 4
    jb L23
L28:
    mov esi, dword ptr [esi + 8]
    cmp esi, -1
    je L29
    mov ecx, dword ptr [ebp - 4]
    push -1
    push -1
    push 0
    push esi
    push ebx
    call L0
    test eax, eax
    jl L30
L29:
    xor eax, eax
L30:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_10092696 ENDP
END
