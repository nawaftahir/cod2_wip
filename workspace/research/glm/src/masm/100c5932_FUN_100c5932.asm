.686
.MODEL FLAT, C
EXTRN sub_1006C670:PROC
EXTRN sub_100854D1:PROC
EXTRN sub_1008629E:PROC
EXTRN sub_100864DC:PROC
EXTRN sub_100BA853:PROC
.CODE
FUN_100c5932 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 96
    push ebx
    mov ebx, ecx
    call sub_100BA853
    test eax, eax
    jl L15
    and dword ptr [ebp - 8], 0
    push esi
    push edi
    mov edi, dword ptr [ebx + 12]
    test edi, edi
    mov dword ptr [ebp - 40], edi
    jbe L11
L0:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi]
    test eax, 0FFF00000h
    mov dword ptr [ebp - 4], esi
    je L10
    and dword ptr [ebp - 12], 0
    and eax, 0000FFFFFh
    lea ecx, [ebp - 36]
    push ecx
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebx]
    push esi
    mov ecx, ebx
    call dword ptr [eax + 0x20]
    jmp L8
L1:
    mov eax, dword ptr [esi]
    and eax, 0FFF00000h
    cmp eax, 074100000h
    je L9
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebx + 00000014Ch]
    jb L2
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 64]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 80]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
L2:
    mov ecx, dword ptr [ebp - 20]
    mov edx, dword ptr [ebp - 36]
    mov esi, dword ptr [esi + 8]
    mov eax, ecx
    dec eax
    neg eax
    sbb eax, eax
    imul edx, ecx
    and eax, 0FFFFFFFDh
    add eax, 3
    mov dword ptr [ebp - 28], eax
    shl eax, 2
    lea esi, [esi + edx*4]
    shl ecx, 2
    lea edi, [ebp + eax - 80]
    xor edx, edx
    mov dword ptr [ebp - 24], esi
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    mov dword ptr [ebp - 16], eax
    jne L3
    mov edx, dword ptr [ebp - 4]
    cmp dword ptr [edx + 12], 0
    je L7
    mov ecx, dword ptr [edx + 16]
    mov ecx, dword ptr [ecx]
    mov esi, dword ptr [ebx + 20]
    mov ecx, dword ptr [esi + ecx*4]
    cmp dword ptr [ecx + 20], -1
    je L7
L3:
    mov esi, dword ptr [ebp - 20]
    push -1
    mov eax, esi
    and eax, 0000FFFFFh
    push -1
    or eax, 010000000h
    push eax
    mov ecx, ebx
    call sub_1008629E
    cmp eax, -1
    je L16
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [ecx + eax*4]
    push dword ptr [ebp - 4]
    mov ecx, eax
    mov dword ptr [ebp - 32], eax
    call sub_100854D1
    test eax, eax
    jl L14
    push dword ptr [ebp - 12]
    mov edi, dword ptr [ebp - 16]
    mov eax, dword ptr [ebx]
    lea ecx, [ebp - 96]
    push ecx
    push esi
    lea edi, [ebp + edi - 64]
    push edi
    push dword ptr [ebp - 8]
    mov ecx, ebx
    call dword ptr [eax + 0x80]
    test eax, eax
    jl L14
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [ebp - 28]
    lea ecx, [eax + esi]
    mov edx, eax
    mov dword ptr [ebp - 44], ecx
    cmp eax, ecx
    jmp L6
L4:
    mov ecx, dword ptr [ebp + edx*4 - 64]
    mov edx, dword ptr [ebp - 4]
    cmp dword ptr [edx + 12], 0
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    je L5
    mov edx, dword ptr [edx + 16]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [ecx + 20], eax
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [ecx + 24], eax
L5:
    mov edx, dword ptr [ebp - 28]
    inc edx
    cmp edx, dword ptr [ebp - 44]
L6:
    mov dword ptr [ebp - 28], edx
    jb L4
    mov eax, dword ptr [ebp - 48]
    mov eax, dword ptr [eax + 12]
    mov ecx, dword ptr [ebp - 12]
    mov edx, dword ptr [ebp - 32]
    mov dword ptr [ebp + ecx*4 - 96], eax
    mov eax, esi
    mov esi, edi
    mov edi, dword ptr [edx + 16]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 32]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [edx + 8]
    mov esi, dword ptr [ebp - 24]
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    inc dword ptr [ebp - 12]
    mov ecx, edx
    mov edx, dword ptr [ebp - 4]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp - 16]
    mov esi, dword ptr [ebp - 24]
    mov ecx, eax
    shr ecx, 2
    lea edi, [ebp + edi - 80]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 16]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L7:
    mov ecx, dword ptr [ebp - 20]
    mov edi, dword ptr [ebp - 24]
    shl ecx, 2
    lea esi, [ebp + eax - 64]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebx]
    lea ecx, [ebp - 36]
    push ecx
    push edx
    mov ecx, ebx
    call dword ptr [eax + 0x20]
    mov esi, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 40]
L8:
    test eax, eax
    jne L1
L9:
    push esi
    mov ecx, ebx
    call sub_100864DC
    cmp eax, -1
    je L16
    push 1
    mov ecx, esi
    call sub_1006C670
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 8]
    and dword ptr [eax + ecx*4], 0
L10:
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], edi
    jb L0
L11:
    cmp edi, dword ptr [ebx + 12]
    mov ecx, edi
    jae L13
    xor edx, edx
L12:
    mov eax, dword ptr [ebx + 24]
    mov esi, dword ptr [eax + ecx*4]
    mov dword ptr [edx + eax], esi
    inc ecx
    add edx, 4
    cmp ecx, dword ptr [ebx + 12]
    jb L12
L13:
    sub dword ptr [ebx + 12], edi
    xor eax, eax
L14:
    pop edi
    pop esi
L15:
    pop ebx
    leave
    ret
L16:
    mov eax, 08007000Eh
    jmp L14
FUN_100c5932 ENDP
END
