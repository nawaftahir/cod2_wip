.686
.MODEL FLAT, C
EXTRN sub_1006C5AB:PROC
EXTRN sub_1006C6C2:PROC
EXTRN sub_1006E3D7:PROC
EXTRN sub_1006E3FD:PROC
EXTRN sub_1006E4B0:PROC
EXTRN sub_1006E4D9:PROC
EXTRN sub_1006E4FA:PROC
EXTRN sub_100F7895:PROC
EXTRN sub_100F79A6:PROC
EXTRN sub_100F7ADD:PROC
.CODE
FUN_10070d24 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 8]
    test byte ptr [eax + 113], 16
    mov dword ptr [ebp - 4], edi
    jne L6
    mov esi, dword ptr [ebp + 24]
    mov eax, esi
    shl eax, 3
    push eax
    call sub_100F7895
    mov ebx, eax
    test ebx, ebx
    pop ecx
    mov dword ptr [ebp - 12], ebx
    je L7
    lea eax, [esi + esi]
    push eax
    push ebx
    mov ecx, edi
    call sub_1006C5AB
    mov edi, eax
    test edi, edi
    jl L17
    mov edx, esi
    xor eax, eax
    shl edx, 2
    mov dword ptr [ebp + 24], edx
    mov ecx, ebx
L0:
    mov dword ptr [ebp + eax*4 - 24], ecx
    inc eax
    add ecx, edx
    cmp eax, 2
    jb L0
    mov eax, dword ptr [ebp + 20]
    push 4
    pop edx
    xor ecx, ecx
    test esi, esi
    mov dword ptr [ebp - 8], edx
    jbe L2
    mov edi, dword ptr [ebp - 4]
    mov edi, dword ptr [edi + 8]
    mov edi, dword ptr [edi + 20]
    mov dword ptr [ebp + 20], edi
L1:
    mov edi, dword ptr [eax + ecx*4]
    mov ebx, dword ptr [ebp + 20]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi]
    and edi, edx
    and dword ptr [ebp - 8], edi
    inc ecx
    cmp ecx, esi
    jb L1
    cmp dword ptr [ebp - 8], 0
    je L3
L2:
    push edx
    and esi, 0000FFFFFh
    push 0
    push eax
    mov eax, esi
    or eax, 010000000h
    jmp L4
L3:
    push edx
    push eax
    and esi, 0000FFFFFh
    push eax
    mov eax, esi
    or eax, 020500000h
L4:
    push dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 4]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E3D7
    mov edi, eax
    test edi, edi
    jl L17
    mov ecx, dword ptr [ebp - 4]
    push 8
    push 0
    push dword ptr [ebp - 24]
    or esi, 010100000h
    push dword ptr [ebp - 20]
    push esi
    push dword ptr [ebp + 8]
    call sub_1006E3FD
    mov edi, eax
    test edi, edi
    jl L17
    mov edi, dword ptr [ebp + 12]
    test edi, edi
    je L5
    mov ecx, dword ptr [ebp + 24]
    mov esi, dword ptr [ebp - 24]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L5:
    mov edi, dword ptr [ebp + 16]
    test edi, edi
    je L16
    mov esi, dword ptr [ebp - 20]
    jmp L15
L6:
    mov ebx, dword ptr [ebp + 24]
    lea eax, [ebx + ebx*2]
    shl eax, 2
    push eax
    call sub_100F79A6
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 12], eax
    jne L8
L7:
    mov edi, 08007000Eh
    jmp L17
L8:
    lea eax, [ebx + ebx*2]
    push eax
    push dword ptr [ebp - 12]
    mov ecx, edi
    call sub_1006C6C2
    mov edi, eax
    test edi, edi
    jl L17
    mov ecx, dword ptr [ebp - 12]
    mov edx, ebx
    xor eax, eax
    shl edx, 2
    mov dword ptr [ebp + 24], edx
L9:
    mov dword ptr [ebp + eax*4 - 24], ecx
    inc eax
    add ecx, edx
    cmp eax, 3
    jb L9
    mov ecx, dword ptr [ebp - 4]
    push 0
    push 0
    push dword ptr [ebp + 20]
    mov esi, ebx
    push dword ptr [ebp - 24]
    and esi, 0000FFFFFh
    mov dword ptr [ebp - 8], esi
    or word ptr [ebp - 6], 000001010h
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E4B0
    mov edi, eax
    test edi, edi
    jl L17
    push 4
    push dword ptr [ebp - 24]
    or esi, 020100000h
    push dword ptr [ebp + 20]
    push dword ptr [ebp - 20]
    push esi
    mov esi, dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E4D9
    mov edi, eax
    test edi, edi
    jl L17
    push 8
    push 0
    push dword ptr [ebp - 20]
    mov ecx, esi
    push dword ptr [ebp - 16]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E4FA
    mov edi, eax
    test edi, edi
    jl L17
    xor eax, eax
    test ebx, ebx
    jbe L11
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + 20]
L10:
    mov edx, dword ptr [ebp + 20]
    mov edx, dword ptr [edx + eax*4]
    mov edx, dword ptr [ecx + edx*4]
    test byte ptr [edx], 23
    je L11
    inc eax
    cmp eax, ebx
    jb L10
L11:
    cmp eax, ebx
    jne L13
    xor ecx, ecx
    test ebx, ebx
    jbe L13
L12:
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edx + 20]
    mov eax, dword ptr [edx + eax*4]
    or dword ptr [eax], 23
    inc ecx
    cmp ecx, ebx
    jb L12
L13:
    mov edi, dword ptr [ebp + 12]
    test edi, edi
    je L14
    mov ecx, dword ptr [ebp + 24]
    mov esi, dword ptr [ebp - 20]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L14:
    mov edi, dword ptr [ebp + 16]
    test edi, edi
    je L16
    mov esi, dword ptr [ebp - 16]
L15:
    mov ecx, dword ptr [ebp + 24]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L16:
    xor edi, edi
L17:
    push dword ptr [ebp - 12]
    call sub_100F7ADD
    pop ecx
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_10070d24 ENDP
END
