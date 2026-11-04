.686
.MODEL FLAT, C
EXTRN sub_10085529:PROC
EXTRN sub_1008A997:PROC
.CODE
FUN_1008d26d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push edi
    mov edi, ecx
    test byte ptr [edi + 108], 1
    jne L22
    and dword ptr [ebp - 40], 0
    call sub_1008A997
    mov eax, dword ptr [edi + 12]
    test eax, eax
    jbe L22
    push ebx
    push esi
L0:
    mov ecx, dword ptr [edi + 24]
    dec eax
    mov esi, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 36], eax
    mov eax, dword ptr [esi]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    je L1
    cmp eax, 020700000h
    jne L21
L1:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [esi + 12], 0
    jbe L3
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [edi + 16]
    mov eax, dword ptr [esi + 16]
L2:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [ecx + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov ebx, dword ptr [edx + ebx*4]
    test byte ptr [ebx + 4], 32
    je L3
    inc dword ptr [ebp - 8]
    mov ebx, dword ptr [ebp - 8]
    add eax, 4
    cmp ebx, dword ptr [esi + 12]
    jb L2
L3:
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 12]
    jb L21
    and dword ptr [ebp - 8], 0
    cmp dword ptr [esi + 4], 0
    jbe L5
    mov ebx, dword ptr [edi + 20]
    mov eax, dword ptr [edi + 16]
    mov edx, dword ptr [esi + 8]
L4:
    mov ecx, dword ptr [edx]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    mov ecx, dword ptr [eax + ecx*4]
    test byte ptr [ecx + 4], 2
    je L5
    inc dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 8]
    add edx, 4
    cmp ecx, dword ptr [esi + 4]
    jb L4
L5:
    mov eax, dword ptr [esi + 4]
    cmp dword ptr [ebp - 8], eax
    jb L21
    mov ecx, dword ptr [esi]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    and dword ptr [ebp - 12], 0
    mov dword ptr [ebp - 16], ecx
    test eax, eax
    mov dword ptr [ebp - 28], eax
    jbe L14
    and dword ptr [ebp - 24], 0
L6:
    and dword ptr [ebp - 8], 0
    test ecx, ecx
    jbe L12
    mov eax, dword ptr [ebp - 24]
    mov dword ptr [ebp - 20], eax
L7:
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [edi + 24]
    mov eax, dword ptr [eax + 72]
    mov ebx, dword ptr [ecx + eax*4]
    mov ecx, ebx
    call sub_10085529
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 44], eax
    mov eax, dword ptr [ebx + 12]
    test eax, eax
    jbe L10
    mov ebx, dword ptr [ebx + 16]
    mov edx, dword ptr [edi + 20]
    mov dword ptr [ebp - 32], ebx
L8:
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [edx + ecx*4]
    cmp dword ptr [ecx + 92], 1
    ja L10
    mov ebx, dword ptr [ebp - 36]
    cmp dword ptr [ecx + 84], ebx
    jne L10
    cmp dword ptr [ebp - 44], 0
    je L9
    mov ebx, dword ptr [ebp - 8]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + ebx*4]
    mov ecx, dword ptr [edx + ecx*4]
    mov ebx, dword ptr [ebp - 4]
    cmp ebx, dword ptr [ecx + 16]
    jne L10
L9:
    mov ebx, dword ptr [ebp - 32]
    inc dword ptr [ebp - 4]
    add ebx, 4
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 32], ebx
    jb L8
L10:
    cmp dword ptr [ebp - 4], eax
    jb L11
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 20], 4
    cmp eax, dword ptr [ebp - 16]
    jb L7
L11:
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 16]
    jb L13
    mov ecx, dword ptr [ebp - 16]
L12:
    inc dword ptr [ebp - 12]
    mov eax, ecx
    shl eax, 2
    add dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 28]
    jb L6
L13:
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 28]
    jb L21
L14:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [esi + 12], 0
    jbe L20
L15:
    mov eax, dword ptr [ebp - 12]
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [edi + 20]
    shl eax, 2
    mov ecx, dword ptr [eax + ecx]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ebp - 28]
    test edx, edx
    jbe L19
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 20], edx
L16:
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [ebp - 24]
    mov eax, dword ptr [edx + eax]
    mov edx, dword ptr [edi + 20]
    mov eax, dword ptr [edx + eax*4]
    mov ebx, dword ptr [eax]
    mov edx, dword ptr [ecx]
    and ebx, 00E000000h
    mov dword ptr [ebp - 32], ebx
    mov ebx, dword ptr [eax]
    and ebx, 0F1FFFFFFh
    and edx, 00E000000h
    cmp edx, dword ptr [ebp - 32]
    mov dword ptr [ebp - 44], ebx
    mov dword ptr [eax], ebx
    ja L17
    mov edx, dword ptr [ebp - 32]
L17:
    mov ebx, dword ptr [ebp - 44]
    or ebx, edx
    cmp dword ptr [eax + 96], 0
    mov dword ptr [eax], ebx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [eax + 16], edx
    jne L18
    mov edx, dword ptr [ecx + 96]
    mov dword ptr [eax + 96], edx
    mov edx, dword ptr [ecx + 100]
    mov dword ptr [eax + 100], edx
L18:
    mov edx, dword ptr [ecx + 104]
    mov dword ptr [eax + 104], edx
    mov edx, dword ptr [ecx + 108]
    mov dword ptr [eax + 108], edx
    mov edx, dword ptr [ecx + 112]
    mov dword ptr [eax + 112], edx
    mov eax, dword ptr [ebp - 16]
    shl eax, 2
    add dword ptr [ebp - 24], eax
    dec dword ptr [ebp - 20]
    jne L16
L19:
    mov eax, dword ptr [edi + 116]
    inc dword ptr [ebp - 12]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 12]
    jb L15
L20:
    xor eax, eax
    mov dword ptr [ebp - 40], 1
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 12], eax
L21:
    mov eax, dword ptr [ebp - 36]
    test eax, eax
    ja L0
    cmp dword ptr [ebp - 40], 0
    pop esi
    pop ebx
    jne L23
L22:
    xor eax, eax
    inc eax
    jmp L24
L23:
    xor eax, eax
L24:
    pop edi
    leave
    ret
FUN_1008d26d ENDP
END
