.686
.MODEL FLAT, C
EXTRN sub_1006C7D8:PROC
EXTRN sub_1006C7EC:PROC
EXTRN sub_10085468:PROC
EXTRN sub_100854E5:PROC
EXTRN sub_10085540:PROC
EXTRN sub_100855D8:PROC
EXTRN sub_100858F8:PROC
EXTRN sub_10085975:PROC
EXTRN sub_100859D0:PROC
EXTRN sub_10085A67:PROC
EXTRN sub_10085E74:PROC
EXTRN sub_10086292:PROC
EXTRN sub_10086436:PROC
EXTRN sub_1008648C:PROC
EXTRN sub_1008B160:PROC
.CODE
FUN_100ad49d PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    push ebx
    xor eax, eax
    push esi
    xor ebx, ebx
    cmp dword ptr [ebp + 12], eax
    push edi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 16], eax
    jbe L4
L1:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    test eax, eax
    je L3
    mov ecx, dword ptr [eax]
    test ecx, 0FFF00000h
    je L3
    test ecx, 0000FFFFFh
    je L3
    mov ecx, dword ptr [eax + 12]
    test ecx, ecx
    mov dword ptr [ebp - 28], ecx
    je L3
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 16]
    mov esi, dword ptr [edx + 20]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [esi + edx*4]
    mov edi, dword ptr [ebp + 16]
    cmp dword ptr [edx + 12], edi
    jne L3
    mov edx, dword ptr [edx + 4]
    mov edi, dword ptr [ebp - 4]
    cmp edx, dword ptr [edi + 000000088h]
    jne L3
    mov ebx, eax
    mov eax, dword ptr [ebp - 16]
    mov dword ptr [ebp - 20], eax
    xor eax, eax
    cmp dword ptr [ebp - 28], eax
    jbe L3
L2:
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [esi + edx*4]
    cmp dword ptr [edx + 16], 2
    je L5
    inc eax
    add ecx, 4
    cmp eax, dword ptr [ebp - 28]
    jb L2
L3:
    mov eax, dword ptr [ebp - 16]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp - 16], eax
    jb L1
    test ebx, ebx
    jne L6
L4:
    push 010117350h
    push 0000012D7h
    push 0
    push dword ptr [ebp - 4]
    call sub_1008B160
    add esp, 16
    mov eax, 080004005h
    jmp L27
L5:
    xor eax, eax
    jmp L27
L6:
    mov eax, dword ptr [ebx]
    mov esi, eax
    mov edi, 0000FFFFFh
    and esi, edi
    and eax, 0FFF00000h
    cmp eax, 050000000h
    mov dword ptr [ebp - 40], esi
    push 116
    jne L11
    call sub_100858F8
    test eax, eax
    je L7
    mov ecx, eax
    call sub_10085468
    mov dword ptr [ebp + 12], eax
    jmp L8
L7:
    and dword ptr [ebp + 12], 0
L8:
    mov esi, dword ptr [ebp + 12]
    test esi, esi
    je L14
    mov eax, dword ptr [ebx + 12]
    push 0
    inc eax
    push eax
    push dword ptr [ebx + 4]
    mov ecx, esi
    push dword ptr [ebx]
    call sub_10085975
    mov edi, eax
    test edi, edi
    jl L25
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp - 20]
    lea eax, [ecx + eax*4]
    push dword ptr [eax]
    mov ecx, esi
    mov dword ptr [ebp - 28], eax
    call sub_100854E5
    mov edi, eax
    test edi, edi
    jl L25
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    mov ecx, dword ptr [ebp - 4]
    push 2
    push dword ptr [ebp + 16]
    push dword ptr [ecx + 000000088h]
    call sub_10086292
    cmp eax, -1
    mov dword ptr [ebp + 8], eax
    jne L10
L9:
    mov edi, 08007000Eh
    jmp L25
L10:
    mov ecx, dword ptr [esi + 4]
    mov eax, dword ptr [ebp + 12]
    mov edi, dword ptr [eax + 8]
    mov esi, dword ptr [ebx + 8]
    shl ecx, 2
    mov eax, ecx
    mov edx, dword ptr [ebp + 12]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebx + 12]
    mov esi, dword ptr [ebx + 16]
    mov edi, dword ptr [edx + 16]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebx + 12]
    mov ecx, dword ptr [edx + 16]
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], esi
    push edx
    jmp L24
L11:
    call sub_100859D0
    test eax, eax
    je L12
    mov ecx, eax
    call sub_10085540
    mov dword ptr [ebp + 12], eax
    jmp L13
L12:
    and dword ptr [ebp + 12], 0
L13:
    cmp dword ptr [ebp + 12], 0
    jne L15
L14:
    mov edi, 08007000Eh
    jmp L26
L15:
    mov ecx, dword ptr [ebx + 4]
    mov eax, ecx
    xor edx, edx
    div esi
    mov edx, dword ptr [ebx + 12]
    push 0
    inc edx
    push edx
    add ecx, eax
    mov dword ptr [ebp - 44], eax
    lea eax, [esi + 1]
    xor eax, dword ptr [ebx]
    push ecx
    mov ecx, dword ptr [ebp + 12]
    and eax, edi
    xor eax, dword ptr [ebx]
    push eax
    call sub_10085A67
    mov edi, eax
    test edi, edi
    jl L25
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp - 20]
    lea eax, [ecx + eax*4]
    push dword ptr [eax]
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ebp - 28], eax
    call sub_100855D8
    mov edi, eax
    test edi, edi
    jl L25
    xor ecx, ecx
    cmp dword ptr [ebp - 44], ecx
    mov dword ptr [ebp - 24], ecx
    jbe L23
    mov eax, esi
    shl eax, 2
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 8], ecx
    lea ecx, [eax + 4]
    mov dword ptr [ebp - 48], ecx
    mov dword ptr [ebp - 16], eax
    jmp L17
L16:
    mov esi, dword ptr [ebp - 40]
L17:
    xor eax, eax
    inc eax
    cmp esi, eax
    mov dword ptr [ebp - 36], eax
    jbe L20
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 8]
    add eax, ecx
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [ecx + 20]
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 16]
    lea edi, [esi - 1]
    add eax, 4
    mov dword ptr [ebp - 32], edi
L18:
    mov edi, dword ptr [eax]
    mov edi, dword ptr [ecx + edi*4]
    cmp dword ptr [edi + 16], edx
    je L19
    and dword ptr [ebp - 36], 0
L19:
    add eax, 4
    dec dword ptr [ebp - 32]
    jne L18
L20:
    mov eax, dword ptr [ebp + 12]
    mov edi, dword ptr [eax + 8]
    add edi, dword ptr [ebp - 12]
    shl esi, 2
    mov ecx, esi
    mov esi, dword ptr [ebx + 8]
    add esi, dword ptr [ebp - 8]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    cmp dword ptr [ebp - 36], 0
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 8]
    je L21
    mov ecx, dword ptr [ebx + 8]
    mov edx, dword ptr [ebp - 8]
    mov ecx, dword ptr [edx + ecx]
    mov edx, dword ptr [ebp - 16]
    mov dword ptr [edx + eax], ecx
    jmp L22
L21:
    mov ecx, dword ptr [ebp - 12]
    fldz
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [edi + 20]
    mov esi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [esi + 12]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 2
    push eax
    push dword ptr [esi + 4]
    mov ecx, edi
    mov dword ptr [ebp - 36], eax
    call sub_10086436
    cmp eax, -1
    je L9
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp - 16]
    mov dword ptr [edx + ecx], eax
    mov eax, dword ptr [esi + 4]
    cmp eax, dword ptr [edi + 000000088h]
    jne L22
    push dword ptr [ebp - 36]
    mov ecx, edi
    push dword ptr [ebp - 20]
    push dword ptr [ebp + 8]
    call L0
    mov edi, eax
    test edi, edi
    jl L25
    mov edi, dword ptr [ebp - 4]
L22:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 2
    push dword ptr [ebp + 16]
    mov ecx, edi
    push dword ptr [edi + 000000088h]
    call sub_1008648C
    cmp eax, -1
    mov dword ptr [ebp - 36], eax
    je L9
    mov ecx, dword ptr [ebx + 12]
    mov edx, dword ptr [ebp + 12]
    mov edi, dword ptr [edx + 16]
    mov esi, dword ptr [ebx + 16]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    inc dword ptr [ebp - 24]
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [edx + 16]
    mov eax, dword ptr [ebx + 12]
    mov edx, dword ptr [ebp - 36]
    mov dword ptr [ecx + eax*4], edx
    mov eax, dword ptr [ebp - 40]
    shl eax, 2
    add dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp - 48]
    add dword ptr [ebp - 12], eax
    add dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [ebp - 44]
    jb L16
L23:
    push dword ptr [ebp + 12]
L24:
    mov eax, dword ptr [ebp - 28]
    mov ecx, dword ptr [eax]
    call sub_10085E74
    mov ecx, dword ptr [ebp + 12]
    push 1
    call sub_1006C7D8
    and dword ptr [ebp + 12], 0
    xor edi, edi
L25:
    mov ecx, dword ptr [ebp + 12]
    test ecx, ecx
    je L26
    push 1
    call sub_1006C7EC
L26:
    mov eax, edi
L27:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_100ad49d ENDP
END
