.686
.MODEL FLAT, C
EXTRN sub_1008559E:PROC
EXTRN sub_10086366:PROC
EXTRN sub_10086367:PROC
.CODE
FUN_10089055 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 60
    or dword ptr [ebp - 16], 0FFFFFFFFh
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebp + 12]
    mov edx, dword ptr [eax]
    push esi
    push edi
    mov dword ptr [ebp - 20], ecx
L0:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 16], 0
    mov dword ptr [ebp - 12], eax
    jne L16
    mov ecx, dword ptr [eax + 72]
    cmp ecx, -1
    je L1
    cmp dword ptr [ebp + 8], ecx
    jbe L16
L1:
    mov ecx, dword ptr [ebp - 24]
    cmp ecx, -1
    mov esi, dword ptr [ebp - 20]
    je L3
    mov edi, dword ptr [eax + 20]
L2:
    cmp ecx, edi
    je L3
    mov esi, dword ptr [ebx + 20]
    mov ecx, dword ptr [esi + ecx*4]
    mov esi, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + 20]
    cmp ecx, -1
    jne L2
L3:
    cmp ecx, dword ptr [eax + 20]
    jne L16
    cmp esi, dword ptr [eax + 24]
    jne L16
    xor ecx, ecx
    inc ecx
    cmp dword ptr [ebp + 16], ecx
    mov dword ptr [ebp - 44], edx
    mov dword ptr [ebp - 4], ecx
    jbe L12
    mov edx, dword ptr [ebp + 12]
    lea ecx, [ebp - 44]
    lea esi, [edx + 4]
    sub ecx, edx
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 28], ecx
L4:
    mov edi, dword ptr [esi]
L5:
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [ebp - 4]
    cmp dword ptr [edx + 16], ecx
    jne L10
    mov ecx, dword ptr [edx + 72]
    cmp ecx, -1
    je L6
    cmp dword ptr [ebp + 8], ecx
    jbe L10
L6:
    mov ecx, dword ptr [edx + 4]
    cmp ecx, dword ptr [eax + 4]
    jne L10
    mov ecx, dword ptr [edx + 12]
    cmp ecx, dword ptr [eax + 12]
    jne L10
    mov ecx, dword ptr [edx + 8]
    cmp ecx, dword ptr [eax + 8]
    jne L10
    mov esi, dword ptr [ebp - 24]
    cmp esi, -1
    mov ecx, dword ptr [ebp - 20]
    je L8
    mov eax, dword ptr [edx + 20]
L7:
    cmp esi, eax
    je L8
    mov ecx, dword ptr [ebx + 20]
    mov esi, dword ptr [ecx + esi*4]
    mov ecx, dword ptr [esi + 24]
    mov esi, dword ptr [esi + 20]
    cmp esi, -1
    jne L7
L8:
    cmp esi, dword ptr [edx + 20]
    jne L9
    cmp ecx, dword ptr [edx + 24]
    je L11
L9:
    mov eax, dword ptr [ebp - 12]
    mov esi, dword ptr [ebp - 8]
L10:
    mov edi, dword ptr [edx + 52]
    cmp edi, dword ptr [esi]
    jne L5
    jmp L12
L11:
    mov esi, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 28]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + esi], edi
    mov eax, dword ptr [ebp - 4]
    add esi, 4
    cmp eax, dword ptr [ebp + 16]
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 8], esi
    jb L4
L12:
    mov edx, dword ptr [ebp + 16]
    cmp dword ptr [ebp - 4], edx
    jne L16
    xor edi, edi
    xor ecx, ecx
    test edx, edx
    jbe L15
L13:
    mov edx, dword ptr [ebp + ecx*4 - 44]
    mov esi, dword ptr [ebx + 20]
    shl edx, 2
    mov esi, dword ptr [edx + esi]
    cmp dword ptr [esi + 72], 0
    je L14
    mov esi, dword ptr [ebx + 20]
    mov esi, dword ptr [edx + esi]
    mov edx, dword ptr [ebp + 8]
    sub edx, dword ptr [esi + 72]
    mov esi, edx
    imul esi, edx
    add edi, esi
L14:
    inc ecx
    cmp ecx, dword ptr [ebp + 16]
    jb L13
L15:
    cmp dword ptr [ebp - 16], edi
    jbe L16
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ebp - 16], edi
    lea esi, [ebp - 44]
    lea edi, [ebp - 60]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L16:
    mov edx, dword ptr [eax + 52]
    mov edi, dword ptr [ebp + 12]
    cmp edx, dword ptr [edi]
    jne L0
    cmp dword ptr [ebp - 16], -1
    je L17
    mov ecx, dword ptr [ebp + 16]
    lea esi, [ebp - 60]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp L22
L17:
    mov eax, dword ptr [ebp + 16]
    push -1
    and eax, 0000FFFFFh
    push -1
    or eax, 010000000h
    push eax
    mov ecx, ebx
    call sub_10086366
    mov esi, eax
    cmp esi, -1
    mov dword ptr [ebp - 16], esi
    je L19
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + esi*4]
    push dword ptr [eax + ecx*4]
    mov ecx, edi
    call sub_1008559E
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp + 16], 0
    jbe L21
L18:
    mov ecx, dword ptr [ebp - 4]
    fldz
    mov eax, dword ptr [ebp + 12]
    mov edx, dword ptr [edi + 8]
    mov esi, ecx
    push ecx
    shl esi, 2
    add eax, esi
    push ecx
    mov dword ptr [ebp - 28], eax
    fstp qword ptr [esp]
    mov eax, dword ptr [eax]
    mov dword ptr [esi + edx], eax
    mov eax, dword ptr [ebp + 20]
    push ecx
    push dword ptr [eax]
    mov ecx, ebx
    push dword ptr [ebx + 000000088h]
    call sub_10086367
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [esi + ecx], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [esi + eax], -1
    je L19
    mov eax, dword ptr [esi + eax]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [eax + 24], ecx
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [esi + eax]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 24]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + ecx]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [edi + 16]
    mov edx, dword ptr [esi + edx]
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + ecx]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 16]
    mov edx, dword ptr [esi + edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 52]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + 52], ecx
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + ecx]
    mov eax, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [esi + eax]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ecx + 52], eax
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [esi + eax]
    mov ecx, dword ptr [ebp - 28]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 16]
    jb L18
    mov esi, dword ptr [ebp - 16]
    jmp L21
L19:
    mov eax, 08007000Eh
    jmp L23
L20:
    lea eax, [eax + esi*4]
    mov ecx, dword ptr [eax - 4]
    mov dword ptr [eax], ecx
    dec esi
L21:
    cmp esi, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 24]
    ja L20
    mov dword ptr [eax + esi*4], edi
    mov eax, dword ptr [ebp + 20]
    inc dword ptr [eax]
L22:
    xor eax, eax
L23:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_10089055 ENDP
END
