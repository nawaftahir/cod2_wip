.686
.MODEL FLAT, C
EXTRN sub_1006C6B3:PROC
EXTRN sub_1006C6E8:PROC
EXTRN sub_1006C71B:PROC
EXTRN sub_1006C772:PROC
EXTRN sub_1006C793:PROC
EXTRN sub_100854CA:PROC
EXTRN sub_10085542:PROC
EXTRN sub_10085744:PROC
EXTRN sub_1008595A:PROC
EXTRN sub_100859D9:PROC
EXTRN sub_10085E2E:PROC
EXTRN sub_1008B456:PROC
EXTRN sub_100B9A13:PROC
EXTRN sub_100B9A40:PROC
.CODE
FUN_100c19e8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000114h
    push ebx
    push esi
    push edi
    push dword ptr [ebp + 8]
    and dword ptr [ebp - 12], 0
    and dword ptr [ebp - 52], 0
    mov edi, ecx
    mov eax, dword ptr [edi + 000000100h]
    mov esi, dword ptr [eax]
    and esi, 0000FFFFFh
    push esi
    lea ecx, [ebp - 52]
    push ecx
    lea ecx, [ebp - 000000114h]
    push ecx
    lea ecx, [ebp - 12]
    push ecx
    lea ecx, [ebp - 116]
    push ecx
    xor ebx, ebx
    push 010118578h
    inc ebx
    push eax
    mov ecx, edi
    mov dword ptr [ebp - 32], edi
    mov dword ptr [ebp - 48], ebx
    mov dword ptr [ebp - 44], 2
    mov dword ptr [ebp - 40], 3
    mov dword ptr [ebp - 36], esi
    call sub_100B9A13
    test eax, eax
    je L0
    push dword ptr [ebp + 8]
    lea eax, [ebp - 52]
    push esi
    push eax
    lea eax, [ebp - 000000114h]
    push eax
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 116]
    push eax
    push 0101185D8h
    push dword ptr [edi + 000000100h]
    mov ecx, edi
    call sub_100B9A40
    test eax, eax
    je L0
    mov eax, ebx
    jmp L16
L0:
    and dword ptr [ebp - 16], 0
    lea eax, [ebp - 000000114h]
    mov dword ptr [ebp - 20], eax
    lea eax, [ebp - 000000104h]
    mov dword ptr [ebp - 28], eax
L1:
    and dword ptr [ebp - 8], 0
    test esi, esi
    jbe L5
    mov eax, dword ptr [edi + 108]
    shl eax, 6
    sar eax, 31
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebp - 20]
    mov dword ptr [ebp - 4], eax
L2:
    cmp dword ptr [ebp - 24], 0
    mov eax, dword ptr [ebp - 4]
    mov edx, dword ptr [eax]
    mov eax, dword ptr [edi + 20]
    mov ebx, dword ptr [ebp - 8]
    mov ebx, dword ptr [ebp + ebx*4 - 0000000E4h]
    mov ecx, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + ebx*4]
    je L3
    mov ebx, dword ptr [eax + 60]
    xor ebx, dword ptr [ecx + 60]
    cmp ebx, 000080000h
    jne L5
    cmp dword ptr [eax + 56], edx
    jmp L4
L3:
    mov edx, dword ptr [ecx + 4]
    cmp edx, dword ptr [eax + 4]
    jne L5
    mov edx, dword ptr [ecx + 8]
    cmp edx, dword ptr [eax + 8]
    jne L5
    mov edx, dword ptr [ecx + 12]
    cmp edx, dword ptr [eax + 12]
    jne L5
    mov edx, dword ptr [ecx + 16]
    cmp edx, dword ptr [eax + 16]
    jne L5
    mov eax, dword ptr [eax + 60]
    xor eax, dword ptr [ecx + 60]
    cmp eax, 000080000h
L4:
    jne L5
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    cmp dword ptr [ebp - 8], esi
    jb L2
L5:
    cmp dword ptr [ebp - 8], esi
    jne L14
    push 116
    call sub_1008595A
    test eax, eax
    je L6
    mov ecx, eax
    call sub_100854CA
    mov ebx, eax
    jmp L7
L6:
    xor ebx, ebx
L7:
    test ebx, ebx
    je L17
    push 0
    push esi
    lea eax, [esi + esi*2]
    push eax
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 070100000h
    push eax
    mov ecx, ebx
    call sub_100859D9
    test eax, eax
    mov dword ptr [ebp - 4], eax
    mov ecx, ebx
    jl L19
    push dword ptr [edi + 000000100h]
    call sub_10085542
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L18
    mov edx, dword ptr [edi + 000000100h]
    mov edi, dword ptr [ebx + 16]
    mov eax, esi
    mov esi, dword ptr [edx + 16]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov ecx, eax
    shr ecx, 2
    lea esi, [ebp - 0000000F4h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [ebp - 28]
    add edi, eax
    mov ecx, eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 36]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    shl edx, 3
    add edi, edx
    mov ecx, eax
    shr ecx, 2
    and dword ptr [ebp - 8], 0
    lea esi, [ebp - 0000000E4h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [ebp - 32]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 4], ecx
    mov ecx, dword ptr [ebx + 8]
    mov edi, dword ptr [ecx]
    mov ecx, dword ptr [ecx + edx]
    mov edi, dword ptr [eax + edi*4]
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edx + 4]
    cmp ecx, dword ptr [edi + 4]
    jne L8
    mov edx, dword ptr [edx + 12]
    cmp edx, dword ptr [edi + 12]
    je L10
    mov edx, dword ptr [ebp - 4]
L8:
    cmp ecx, dword ptr [eax + 4]
    jne L9
    mov edx, dword ptr [edx + 12]
    cmp edx, dword ptr [eax + 12]
    je L10
L9:
    cmp ecx, dword ptr [esi + 000000088h]
    je L11
L10:
    test byte ptr [esi + 111], 2
    jne L11
    mov dword ptr [ebp - 8], 1
L11:
    mov eax, dword ptr [esi]
    push 0
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x20]
    test eax, eax
    jne L13
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    xor edx, edx
    test byte ptr [eax + 4], 32
    jne L12
    cmp dword ptr [ebp - 8], edx
    je L20
L12:
    test byte ptr [esi + 111], 2
    jne L20
L13:
    push 1
    mov ecx, ebx
    call sub_1006C6B3
    mov esi, dword ptr [ebp - 36]
    mov edi, dword ptr [ebp - 32]
L14:
    inc dword ptr [ebp - 16]
    add dword ptr [ebp - 20], 16
    sub dword ptr [ebp - 28], 16
    cmp dword ptr [ebp - 16], 2
    jb L1
L15:
    xor eax, eax
    inc eax
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
L17:
    mov eax, 08007000Eh
    jmp L16
L18:
    mov ecx, ebx
L19:
    push 1
    call sub_1006C6E8
    mov eax, dword ptr [ebp - 4]
    jmp L16
L20:
    cmp dword ptr [ebp + 8], edx
    jne L21
    mov eax, dword ptr [ebp - 116]
    mov ecx, dword ptr [eax]
    mov dword ptr [ebp - 24], ecx
    mov dword ptr [eax], edx
L21:
    test byte ptr [esi + 111], 2
    je L23
    test byte ptr [edi + 61], 2
    jne L23
    mov eax, dword ptr [edi]
    test al, 4
    je L22
    test al, 16
    jne L23
L22:
    push 1
    mov ecx, ebx
    call sub_1006C71B
    mov eax, dword ptr [esi + 000000100h]
    push 01011A0ECh
    push 00000125Fh
    push dword ptr [eax + 60]
    push esi
    call sub_1008B456
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 116]
    add esp, 16
    mov dword ptr [ecx], eax
    jmp L15
L23:
    cmp dword ptr [ebp + 8], edx
    jne L27
    xor eax, eax
    cmp dword ptr [ebp - 12], edx
    jbe L25
L24:
    mov ecx, dword ptr [ebp + eax*4 - 116]
    inc eax
    cmp eax, dword ptr [ebp - 12]
    mov dword ptr [ecx], edx
    jb L24
L25:
    mov ecx, dword ptr [esi + 24]
    lea edi, [esi + 0000000FCh]
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [ecx + eax*4]
    cmp ecx, edx
    je L26
    push 1
    call sub_1006C772
L26:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [ecx + eax*4], ebx
    jmp L29
L27:
    mov ecx, dword ptr [esi + 000000100h]
    push ebx
    call sub_10085E2E
    push 1
    mov ecx, ebx
    mov edi, eax
    call sub_1006C793
    test edi, edi
    jge L28
    mov eax, edi
    jmp L16
L28:
    mov esi, dword ptr [esi + 000000100h]
    push esi
    mov ecx, esi
    call sub_10085744
    test eax, eax
    jl L16
L29:
    xor eax, eax
    jmp L16
FUN_100c19e8 ENDP
END
