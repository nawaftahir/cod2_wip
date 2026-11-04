.686
.MODEL FLAT, C
EXTRN sub_1008559E:PROC
EXTRN sub_10086366:PROC
EXTRN sub_10086367:PROC
EXTRN sub_1008936D:PROC
EXTRN sub_100893B0:PROC
EXTRN sub_100894F3:PROC
EXTRN sub_100894FA:PROC
EXTRN sub_10089516:PROC
EXTRN sub_1008952B:PROC
EXTRN sub_10089560:PROC
EXTRN sub_100895F9:PROC
EXTRN sub_10089608:PROC
EXTRN sub_10089612:PROC
.CODE
FUN_10089055 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 60
    or or dword ptr [ebp - 16], -1
    push push ebx
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 24]
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov edx, dword ptr [eax]
    push push esi
    push push edi
    mov mov dword ptr [ebp - 20], ecx
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp dword ptr [eax + 16], 0
    mov mov dword ptr [ebp - 12], eax
    jne L7
    mov mov ecx, dword ptr [eax + 72]
    cmp cmp ecx, -1
    je L0
    cmp cmp dword ptr [ebp + 8], ecx
    jbe L10
    mov mov ecx, dword ptr [ebp - 24]
    cmp cmp ecx, -1
    mov mov esi, dword ptr [ebp - 20]
    je L1
    mov mov edi, dword ptr [eax + 20]
    cmp cmp ecx, edi
    je L3
    mov mov esi, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [esi + ecx*4]
    mov mov esi, dword ptr [ecx + 24]
    mov mov ecx, dword ptr [ecx + 20]
    cmp cmp ecx, -1
    jne L2
    cmp cmp ecx, dword ptr [eax + 20]
    jne L18
    cmp cmp esi, dword ptr [eax + 24]
    jne L19
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp dword ptr [ebp + 16], ecx
    mov mov dword ptr [ebp - 44], edx
    mov mov dword ptr [ebp - 4], ecx
    jbe L8
    mov mov edx, dword ptr [ebp + 12]
    lea lea ecx, [ebp - 44]
    lea lea esi, [edx + 4]
    sub sub ecx, edx
    mov mov dword ptr [ebp - 8], esi
    mov mov dword ptr [ebp - 28], ecx
    mov mov edi, dword ptr [esi]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ecx + edi*4]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp dword ptr [edx + 16], ecx
    jne L7
    mov mov ecx, dword ptr [edx + 72]
    cmp cmp ecx, -1
    je L4
    cmp cmp dword ptr [ebp + 8], ecx
    jbe L9
    mov mov ecx, dword ptr [edx + 4]
    cmp cmp ecx, dword ptr [eax + 4]
    jne L11
    mov mov ecx, dword ptr [edx + 12]
    cmp cmp ecx, dword ptr [eax + 12]
    jne L13
    mov mov ecx, dword ptr [edx + 8]
L1:
    cmp cmp ecx, dword ptr [eax + 8]
L2:
    jne L16
    mov mov esi, dword ptr [ebp - 24]
    cmp cmp esi, -1
    mov mov ecx, dword ptr [ebp - 20]
    je L14
    mov mov eax, dword ptr [edx + 20]
    cmp cmp esi, eax
    je L17
    mov mov ecx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [ecx + esi*4]
    mov mov ecx, dword ptr [esi + 24]
    mov mov esi, dword ptr [esi + 20]
    cmp cmp esi, -1
    jne L15
    cmp cmp esi, dword ptr [edx + 20]
    jne L20
    cmp cmp ecx, dword ptr [edx + 24]
    je L21
    mov mov eax, dword ptr [ebp - 12]
    mov mov esi, dword ptr [ebp - 8]
    mov mov edi, dword ptr [edx + 52]
    cmp cmp edi, dword ptr [esi]
    jne L5
    jmp L22
    mov mov esi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 28]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + esi], edi
    mov mov eax, dword ptr [ebp - 4]
    add add esi, 4
    cmp cmp eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 8], esi
    jb L12
    mov mov edx, dword ptr [ebp + 16]
    cmp cmp dword ptr [ebp - 4], edx
    jne L24
    xor xor edi, edi
    xor xor ecx, ecx
    test test edx, edx
    jbe L23
    mov mov edx, dword ptr [ebp + ecx*4 - 44]
    mov mov esi, dword ptr [ebx + 20]
    shl shl edx, 2
    mov mov esi, dword ptr [edx + esi]
    cmp cmp dword ptr [esi + 72], 0
    je L25
    mov mov esi, dword ptr [ebx + 20]
    mov mov esi, dword ptr [edx + esi]
    mov mov edx, dword ptr [ebp + 8]
    sub sub edx, dword ptr [esi + 72]
    mov mov esi, edx
    imul imul esi, edx
    add add edi, esi
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 16]
    jb L23
    cmp cmp dword ptr [ebp - 16], edi
    jbe sub_1008936D
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 16], edi
    lea lea esi, [ebp - 44]
    lea lea edi, [ebp - 60]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edx, dword ptr [eax + 52]
    mov mov edi, dword ptr [ebp + 12]
L4:
    cmp cmp edx, dword ptr [edi]
    jne L6
    cmp cmp dword ptr [ebp - 16], -1
    je sub_100893B0
    mov mov ecx, dword ptr [ebp + 16]
    lea lea esi, [ebp - 60]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp sub_100894F3
    mov mov eax, dword ptr [ebp + 16]
    push push -1
    and and eax, 0FFFFFh
    push push -1
    or or eax, 010000000h
    push push eax
    mov mov ecx, ebx
    call sub_10086366
    mov mov esi, eax
    cmp cmp esi, -1
    mov mov dword ptr [ebp - 16], esi
L5:
    je sub_100894FA
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [eax + esi*4]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, edi
L9:
    call sub_1008559E
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp + 16], 0
L12:
    jbe sub_1008952B
L14:
    mov mov ecx, dword ptr [ebp - 4]
L15:
    fldz fldz
L16:
    mov mov eax, dword ptr [ebp + 12]
    mov mov edx, dword ptr [edi + 8]
    mov mov esi, ecx
    push push ecx
    shl shl esi, 2
    add add eax, esi
    push push ecx
    mov mov dword ptr [ebp - 28], eax
    fstp fstp qword ptr [esp]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [esi + edx], eax
    mov mov eax, dword ptr [ebp + 20]
    push push ecx
    push push dword ptr [eax]
    mov mov ecx, ebx
L20:
    push push dword ptr [ebx + 088h]
    call sub_10086367
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [esi + ecx], eax
    mov mov eax, dword ptr [edi + 16]
L21:
    cmp cmp dword ptr [esi + eax], -1
    je sub_10089560
    mov mov eax, dword ptr [esi + eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [eax + 24], ecx
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [esi + eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 52]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + 52], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + ecx]
    mov mov eax, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [esi + eax]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [ecx + 52], eax
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [esi + eax]
    mov mov ecx, dword ptr [ebp - 28]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp + 16]
    jb sub_10089516
    mov mov esi, dword ptr [ebp - 16]
    jmp sub_100895F9
    mov mov eax, 08007000Eh
    jmp sub_10089612
    lea lea eax, [eax + esi*4]
L23:
    mov mov ecx, dword ptr [eax - 4]
    mov mov dword ptr [eax], ecx
    dec dec esi
    cmp cmp esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebx + 24]
    ja sub_10089608
    mov mov dword ptr [eax + esi*4], edi
    mov mov eax, dword ptr [ebp + 20]
    inc inc dword ptr [eax]
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_10089055 ENDP
END
