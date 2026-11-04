.686
.MODEL FLAT, C
EXTRN sub_1008556F:PROC
EXTRN sub_10085780:PROC
EXTRN sub_10086341:PROC
EXTRN sub_10086408:PROC
EXTRN sub_10086489:PROC
EXTRN sub_10086552:PROC
EXTRN sub_1008657C:PROC
.CODE
FUN_10088905 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 76
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    and eax, 0000FFFFFh
    push edi
    mov edi, ecx
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp + 8], 0
    ja L3
L0:
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
L2:
    mov eax, dword ptr [ebp - 8]
L3:
    mov ecx, dword ptr [ebp - 16]
    and dword ptr [ebp - 4], 0
    cmp ecx, 4
    jbe L10
    test eax, eax
    jbe L11
    and dword ptr [ebp - 28], 0
    mov ecx, eax
    shl ecx, 2
    mov dword ptr [ebp - 36], 1
    mov dword ptr [ebp - 32], ecx
L4:
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [ebp - 28]
    cmp dword ptr [ecx + edx], -1
    je L9
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [ecx + eax]
    mov edx, dword ptr [edi + 20]
    mov ebx, dword ptr [ebp - 32]
    mov ecx, dword ptr [ecx + ebx]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ebp - 36]
    cmp edx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 24], 1
    mov dword ptr [ebp - 20], edx
    jae L7
    mov edx, ebx
    add edx, 4
    mov dword ptr [ebp - 12], edx
L5:
    mov edx, dword ptr [esi + 8]
    mov ebx, dword ptr [ebp - 12]
    cmp dword ptr [edx + ebx], -1
    je L6
    mov ebx, dword ptr [ebp - 20]
    mov ebx, dword ptr [edx + ebx*4]
    mov edx, dword ptr [edi + 20]
    mov edx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [ebp - 12]
    mov dword ptr [ebp - 40], edx
    mov edx, dword ptr [esi + 8]
    mov ebx, dword ptr [edx + ebx]
    mov edx, dword ptr [edi + 20]
    mov edx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [eax + 4]
    mov dword ptr [ebp - 44], edx
    mov edx, dword ptr [ebp - 40]
    cmp ebx, dword ptr [edx + 4]
    jne L6
    mov ebx, dword ptr [eax + 8]
    cmp ebx, dword ptr [edx + 8]
    jne L6
    mov ebx, dword ptr [eax + 12]
    cmp ebx, dword ptr [edx + 12]
    jne L6
    mov ebx, dword ptr [eax + 72]
    cmp ebx, dword ptr [edx + 72]
    jne L6
    mov ebx, dword ptr [ecx + 4]
    mov edx, dword ptr [ebp - 44]
    cmp ebx, dword ptr [edx + 4]
    jne L6
    mov ebx, dword ptr [ecx + 8]
    cmp ebx, dword ptr [edx + 8]
    jne L6
    mov ebx, dword ptr [ecx + 12]
    cmp ebx, dword ptr [edx + 12]
    jne L6
    mov ebx, dword ptr [ecx + 72]
    cmp ebx, dword ptr [edx + 72]
    jne L6
    inc dword ptr [ebp - 24]
    cmp dword ptr [ebp - 24], 4
    je L7
L6:
    inc dword ptr [ebp - 20]
    mov edx, dword ptr [ebp - 20]
    add dword ptr [ebp - 12], 4
    cmp edx, dword ptr [ebp - 8]
    jb L5
L7:
    mov edx, dword ptr [ebp - 24]
    cmp edx, dword ptr [ebp - 4]
    jbe L8
    mov dword ptr [ebp - 4], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ebp - 48], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [ebp - 64], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ebp - 52], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [ebp - 68], edx
    mov edx, dword ptr [eax + 12]
    mov eax, dword ptr [eax + 72]
    mov dword ptr [ebp - 56], edx
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [ebp - 60], eax
    mov eax, dword ptr [ecx + 72]
    mov dword ptr [ebp - 72], edx
    mov dword ptr [ebp - 76], eax
L8:
    cmp dword ptr [ebp - 4], 4
    je L11
    mov eax, dword ptr [ebp - 8]
L9:
    add dword ptr [ebp - 28], 4
    add dword ptr [ebp - 32], 4
    inc dword ptr [ebp - 36]
    mov ecx, dword ptr [ebp - 36]
    dec ecx
    cmp ecx, eax
    jb L4
    jmp L11
L10:
    mov dword ptr [ebp - 4], ecx
L11:
    mov eax, dword ptr [ebp - 4]
    push -1
    and eax, 0000FFFFFh
    push -1
    or eax, 050000000h
    push eax
    mov ecx, edi
    call sub_10086341
    cmp eax, -1
    je L30
    mov ecx, dword ptr [edi + 24]
    mov ebx, dword ptr [ecx + eax*4]
    push esi
    mov ecx, ebx
    call sub_1008556F
    mov ecx, dword ptr [ebp - 8]
    xor eax, eax
    cmp ecx, eax
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ebp - 28], eax
    jbe L15
    shl ecx, 2
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [ebp - 4]
    shl ecx, 2
    mov dword ptr [ebp - 32], ecx
L12:
    mov ecx, dword ptr [ebp - 4]
    cmp dword ptr [ebp - 36], ecx
    jae L15
    mov ecx, dword ptr [esi + 8]
    cmp dword ptr [ecx + eax*4], -1
    je L14
    cmp dword ptr [ebp - 16], 4
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ebp - 12]
    mov dword ptr [ebp - 44], ecx
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [ecx + edx]
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + edx*4]
    mov dword ptr [ebp - 40], ecx
    jbe L13
    mov edx, dword ptr [ebp - 48]
    mov ecx, dword ptr [ebp - 44]
    cmp edx, dword ptr [ecx + 4]
    jne L14
    mov edx, dword ptr [ebp - 52]
    cmp edx, dword ptr [ecx + 8]
    jne L14
    mov edx, dword ptr [ebp - 56]
    cmp edx, dword ptr [ecx + 12]
    jne L14
    mov edx, dword ptr [ebp - 60]
    cmp edx, dword ptr [ecx + 72]
    jne L14
    mov edx, dword ptr [ebp - 64]
    mov ecx, dword ptr [ebp - 40]
    cmp edx, dword ptr [ecx + 4]
    jne L14
    mov edx, dword ptr [ebp - 68]
    cmp edx, dword ptr [ecx + 8]
    jne L14
    mov edx, dword ptr [ebp - 72]
    cmp edx, dword ptr [ecx + 12]
    jne L14
    mov edx, dword ptr [ebp - 76]
    cmp edx, dword ptr [ecx + 72]
    jne L14
L13:
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 36]
    mov dword ptr [edx + ecx*4], eax
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [ebp - 12]
    mov eax, dword ptr [edx + eax]
    mov ecx, dword ptr [ebx + 8]
    mov edx, dword ptr [ebp - 32]
    mov dword ptr [edx + ecx], eax
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ebp - 28]
    or dword ptr [ecx + eax*4], 0FFFFFFFFh
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [ebp - 12]
    or dword ptr [edx + ecx], 0FFFFFFFFh
    inc dword ptr [ebp - 36]
    add dword ptr [ebp - 32], 4
L14:
    add dword ptr [ebp - 12], 4
    inc eax
    cmp eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 28], eax
    jb L12
L15:
    cmp dword ptr [ebp - 8], 4
    jbe L16
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push -1
    push -1
    push dword ptr [edi + 000000088h]
    mov ecx, edi
    call sub_10086408
    mov ecx, dword ptr [ebx + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 16]
    cmp dword ptr [eax], -1
    je L30
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebx + 16]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 16]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [eax + 24], ecx
    jmp L17
L16:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
L17:
    mov eax, dword ptr [ebp - 4]
    sub dword ptr [ebp - 16], eax
    inc dword ptr [ebp + 8]
    cmp dword ptr [ebp - 16], 0
    ja L2
    cmp dword ptr [ebp + 8], 1
    jbe L0
    push ecx
    fld1
    push ecx
    fstp qword ptr [esp]
    push 0
    push -1
    push dword ptr [edi + 120]
    mov ecx, edi
    call sub_10086489
    cmp eax, -1
    mov dword ptr [ebp - 76], eax
    je L30
L18:
    mov eax, dword ptr [edi + 12]
    sub eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 24], eax
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    mov dword ptr [ebp - 20], eax
    jbe L29
    mov dword ptr [ebp - 36], eax
L19:
    mov eax, dword ptr [ebp + 8]
    sub eax, dword ptr [ebp - 36]
    push 4
    pop ecx
    cmp eax, ecx
    mov dword ptr [ebp - 8], eax
    jbe L20
    mov dword ptr [ebp - 8], ecx
    mov eax, ecx
L20:
    cmp eax, 1
    push -1
    push -1
    jne L21
    push 010000001h
    jmp L23
L21:
    cmp eax, 2
    jne L22
    push 020400001h
    jmp L23
L22:
    and eax, 0000FFFFFh
    or eax, 050000000h
    push eax
L23:
    mov ecx, edi
    call sub_10086552
    cmp eax, -1
    je L30
    mov ecx, dword ptr [edi + 24]
    mov ebx, dword ptr [ecx + eax*4]
    push esi
    mov ecx, ebx
    call sub_10085780
    mov ecx, dword ptr [ebp - 8]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [ebp - 16], eax
    jbe L26
    shl ecx, 2
    mov dword ptr [ebp - 28], ecx
    mov ecx, dword ptr [ebp - 24]
    shl ecx, 2
    mov dword ptr [ebp - 32], ecx
L24:
    cmp dword ptr [ebp - 8], 2
    mov ecx, dword ptr [edi + 24]
    mov edx, dword ptr [ebp - 32]
    mov ecx, dword ptr [edx + ecx]
    mov ecx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebx + 8]
    mov ecx, dword ptr [ecx]
    mov dword ptr [edx + eax*4], ecx
    jbe L25
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 76]
    mov edx, dword ptr [ebp - 28]
    mov dword ptr [edx + eax], ecx
L25:
    mov eax, dword ptr [ebp - 16]
    add dword ptr [ebp - 32], 4
    add dword ptr [ebp - 28], 4
    inc eax
    cmp eax, dword ptr [ebp - 8]
    mov dword ptr [ebp - 16], eax
    jb L24
L26:
    cmp dword ptr [ebp + 8], 4
    jbe L27
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push -1
    push -1
    push dword ptr [edi + 000000088h]
    mov ecx, edi
    call sub_1008657C
    mov ecx, dword ptr [ebx + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 16]
    cmp dword ptr [eax], -1
    je L30
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebx + 16]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 16]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [eax + 24], ecx
    jmp L28
L27:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
L28:
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 24], eax
    add dword ptr [ebp - 36], 4
    mov eax, dword ptr [ebp - 36]
    inc dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp + 8]
    jb L19
L29:
    mov eax, dword ptr [ebp - 20]
    cmp eax, 1
    mov dword ptr [ebp + 8], eax
    ja L18
    jmp L0
L30:
    mov eax, 08007000Eh
    jmp L1
FUN_10088905 ENDP
END
