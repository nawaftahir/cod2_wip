.686
.MODEL FLAT, C
EXTRN sub_1006C882:PROC
EXTRN sub_1008553E:PROC
EXTRN sub_100855FD:PROC
EXTRN sub_100859CC:PROC
EXTRN sub_10085A46:PROC
EXTRN sub_10085A8D:PROC
EXTRN sub_10085B15:PROC
EXTRN sub_10085FE2:PROC
EXTRN sub_10086050:PROC
EXTRN sub_1008645D:PROC
EXTRN sub_1008649A:PROC
EXTRN sub_100864EF:PROC
EXTRN sub_1008B557:PROC
EXTRN sub_1008B578:PROC
EXTRN sub_100AE908:PROC
EXTRN sub_100AE926:PROC
EXTRN sub_100AE9CD:PROC
EXTRN sub_100AEA53:PROC
EXTRN sub_100AEA7A:PROC
.CODE
FUN_100aead2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 76
    push ebx
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    push esi
    push edi
    mov esi, ecx
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 12], eax
    jbe L28
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
L0:
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [eax]
    test edi, edi
    je L27
    mov ebx, dword ptr [edi]
    push 1
    push 1
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 36]
    push eax
    lea eax, [ebp - 20]
    push eax
    push edi
    push 4
    push dword ptr [ebp + 16]
    mov dword ptr [ebp - 32], ebx
    and ebx, 0000FFFFFh
    mov ecx, esi
    mov dword ptr [ebp - 24], ebx
    call sub_100AE9CD
    cmp dword ptr [ebp - 16], 0
    jne L1
    cmp ebx, 2
    jne L27
    mov ebx, dword ptr [edi + 8]
    mov eax, dword ptr [esi + 000000220h]
    mov ecx, dword ptr [esi + 00000022Ch]
    push 0
    push 1
    add ebx, 8
    push ebx
    push eax
    push ecx
    mov ecx, esi
    call sub_100AE908
    push 0
    push 1
    add ebx, 4
    push ebx
    push dword ptr [esi + 000000220h]
    mov ecx, esi
    push dword ptr [esi + 00000022Ch]
    mov dword ptr [ebp - 28], eax
    call sub_100AE926
    cmp dword ptr [ebp - 28], 0
    mov dword ptr [ebp - 44], eax
    je L27
    test eax, eax
    je L27
    xor ebx, ebx
    inc ebx
    push ebx
    push ebx
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 36]
    push eax
    lea eax, [ebp - 20]
    push eax
    push dword ptr [ebp - 28]
    mov ecx, esi
    push 4
    push dword ptr [ebp + 16]
    call sub_100AEA53
    cmp dword ptr [ebp - 40], 0
    je L27
    push ebx
    push ebx
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 36]
    push eax
    lea eax, [ebp - 20]
    push eax
    push dword ptr [ebp - 44]
    mov ecx, esi
    push 4
    push dword ptr [ebp + 16]
    call sub_100AEA7A
    mov eax, dword ptr [ebp - 40]
    cmp eax, dword ptr [ebp - 16]
    jne L27
    mov ebx, dword ptr [ebp - 24]
    jmp L2
L1:
    cmp ebx, 2
    je L27
L2:
    cmp dword ptr [ebp - 16], 0
    je L27
    push 3
    xor edx, edx
    pop eax
    cmp ebx, eax
    mov dword ptr [ebp - 4], edx
    jne L9
    mov eax, dword ptr [ebp - 32]
    and eax, 0FFF00000h
    cmp eax, 060F00000h
    je L3
    cmp eax, 060A00000h
    jne L27
L3:
    mov eax, dword ptr [edi + 8]
    mov ebx, dword ptr [esi + 20]
    mov dword ptr [ebp - 36], 1
    add eax, 12
L4:
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [ebx + ecx*4]
    cmp dword ptr [ecx + 16], edx
    je L5
    and dword ptr [ebp - 36], 0
L5:
    mov ecx, dword ptr [ecx + 60]
    test ecx, ecx
    je L6
    cmp ecx, 000060000h
    jne L31
L6:
    inc edx
    add eax, 4
    cmp edx, 3
    jb L4
    cmp dword ptr [ebp - 36], 0
    je L27
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000102h
    jb L32
    push 116
    call sub_100859CC
    xor ebx, ebx
    cmp eax, ebx
    je L7
    mov ecx, eax
    call sub_1008553E
    mov dword ptr [ebp - 4], eax
    jmp L8
L7:
    mov dword ptr [ebp - 4], ebx
L8:
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, ebx
    je L36
    push ebx
    push 4
    push 6
    push 072600003h
    call sub_10085A46
    mov edi, eax
    cmp edi, ebx
    jl L29
    jmp L17
L9:
    push 2
    pop ecx
    cmp ebx, ecx
    jne L27
    mov edx, dword ptr [ebp - 32]
    and edx, 0FFF00000h
    cmp edx, 060500000h
    jne L27
    xor ebx, ebx
    xor edi, edi
    inc edi
    mov dword ptr [ebp - 68], eax
    mov dword ptr [ebp - 64], ebx
    mov dword ptr [ebp - 76], edi
    mov dword ptr [ebp - 72], ecx
    mov dword ptr [ebp - 36], edi
L10:
    test ebx, ebx
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ebp - 28]
    je L11
    mov eax, dword ptr [ebp - 44]
L11:
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 16]
    cmp ecx, dword ptr [ebp + ebx*4 - 68]
    je L12
    and dword ptr [ebp - 36], 0
L12:
    cmp ecx, dword ptr [ebp + ebx*4 - 76]
    je L13
    xor edi, edi
L13:
    cmp dword ptr [eax + 60], 0
    jne L33
    inc ebx
    cmp ebx, 2
    jb L10
    cmp dword ptr [ebp - 36], 0
    jne L14
    test edi, edi
    je L27
L14:
    push 116
    call sub_10085A8D
    test eax, eax
    je L15
    mov ecx, eax
    call sub_100855FD
    mov dword ptr [ebp - 4], eax
    jmp L16
L15:
    and dword ptr [ebp - 4], 0
L16:
    cmp dword ptr [ebp - 4], 0
    je L36
    mov ecx, dword ptr [ebp - 4]
    neg edi
    push 0
    sbb edi, edi
    push 4
    and edi, 000100000h
    push 4
    add edi, 072700002h
    push edi
    call sub_10085B15
    mov edi, eax
    test edi, edi
    jl L29
    xor ebx, ebx
L17:
    xor eax, eax
L18:
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + ecx]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [eax + edx], ecx
    add eax, 4
    cmp eax, 16
    jb L18
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + 8]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edx + 12]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [esi + 16]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 8
    je L20
    mov edi, dword ptr [ecx + 12]
    cmp edi, 3
    mov dword ptr [ebp - 36], edi
    ja L19
    mov eax, dword ptr [ebp + 16]
    cmp dword ptr [eax + edi*4], ebx
    je L24
L19:
    mov edi, 080004005h
    jmp L29
L20:
    mov eax, dword ptr [ebp - 20]
    jmp L22
L21:
    mov edx, dword ptr [ebp + 16]
    cmp dword ptr [edx + eax*4], ebx
    je L23
    inc eax
L22:
    cmp eax, 4
    jb L21
L23:
    cmp eax, 4
    je L19
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ecx + 12], eax
    mov edi, eax
L24:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push edi
    push dword ptr [esi + 000000080h]
    mov ecx, esi
    call sub_1008649A
    cmp eax, -1
    mov dword ptr [ebp - 56], eax
    je L36
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    push dword ptr [ebp - 48]
    mov ecx, ebx
    call sub_10085FE2
    mov eax, edi
    shl eax, 8
    or eax, 3
    mov dword ptr [ebx + 108], eax
    mov eax, dword ptr [ebp - 24]
    mov dword ptr [ebx + 12], edi
    xor ebx, ebx
    test eax, eax
    jbe L26
    shl eax, 2
    mov dword ptr [ebp - 32], eax
L25:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push dword ptr [ebp - 20]
    mov ecx, esi
    push dword ptr [esi + 000000080h]
    call sub_100864EF
    mov ecx, eax
    cmp ecx, -1
    mov dword ptr [ebp - 60], ecx
    je L36
    mov eax, dword ptr [esi + 20]
    mov edi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp - 24]
    push dword ptr [ebp - 48]
    shl ecx, 2
    mov ecx, dword ptr [ecx + edx]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, edi
    mov dword ptr [ebp - 52], eax
    call sub_10086050
    mov eax, dword ptr [ebp - 20]
    mov edx, dword ptr [ebp - 56]
    mov dword ptr [edi + 12], eax
    mov eax, dword ptr [ebp - 52]
    mov dword ptr [edi + 16], ebx
    mov eax, dword ptr [eax + 60]
    mov dword ptr [edi + 60], eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [ecx + ebx*4], edx
    mov edx, dword ptr [ebp - 32]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 60]
    add dword ptr [ebp - 32], 4
    inc ebx
    cmp ebx, dword ptr [ebp - 24]
    mov dword ptr [edx + eax], ecx
    jb L25
    mov edi, dword ptr [ebp - 36]
L26:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ecx + edi*4], eax
    push eax
    mov ecx, esi
    call sub_1008645D
    mov edi, eax
    test edi, edi
    jl L29
    mov eax, dword ptr [ebp - 8]
    and dword ptr [eax], 0
    and dword ptr [ebp - 4], 0
L27:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add dword ptr [ebp - 8], 4
    cmp eax, dword ptr [ebp + 12]
    jb L0
L28:
    xor edi, edi
L29:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L30
    push 1
    call sub_1006C882
L30:
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L31:
    push 010117458h
    jmp L34
L32:
    mov eax, dword ptr [esi + 0000000C8h]
    mov ecx, dword ptr [ebp - 12]
    and eax, 0000000FFh
    push eax
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ecx*4]
    push 010117400h
    push 0000011B8h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B557
    add esp, 20
    jmp L35
L33:
    push 0101173A8h
L34:
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ecx*4]
    push 0000011B7h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B578
    add esp, 16
L35:
    mov edi, 080004005h
    jmp L30
L36:
    mov edi, 08007000Eh
    jmp L29
FUN_100aead2 ENDP
END
