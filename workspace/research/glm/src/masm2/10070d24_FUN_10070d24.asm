.686
.MODEL FLAT, C
EXTRN sub_1006C5AB:PROC
EXTRN sub_1006C6C2:PROC
EXTRN sub_1006E3D7:PROC
EXTRN sub_1006E3FD:PROC
EXTRN sub_1006E4B0:PROC
EXTRN sub_1006E4D9:PROC
EXTRN sub_1006E4FA:PROC
EXTRN sub_10070FB6:PROC
EXTRN sub_10070FE3:PROC
EXTRN sub_10071016:PROC
EXTRN sub_1007106D:PROC
EXTRN sub_10071093:PROC
EXTRN sub_100710AE:PROC
EXTRN sub_100710B7:PROC
EXTRN sub_100710E2:PROC
EXTRN sub_100710FA:PROC
EXTRN sub_10071139:PROC
EXTRN sub_1007113F:PROC
EXTRN sub_10071146:PROC
EXTRN sub_1007114D:PROC
EXTRN sub_1007116F:PROC
EXTRN sub_10071177:PROC
EXTRN sub_1007117D:PROC
EXTRN sub_1007118C:PROC
EXTRN sub_100711B6:PROC
EXTRN sub_100711EC:PROC
EXTRN sub_100F7895:PROC
EXTRN sub_100F79A6:PROC
EXTRN sub_100F7ADD:PROC
.CODE
FUN_10070d24 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 8]
    test test byte ptr [eax + 113], 16
    mov mov dword ptr [ebp - 4], edi
    jne L3
    mov mov esi, dword ptr [ebp + 24]
    mov mov eax, esi
    shl shl eax, 3
    push push eax
    call sub_100F7895
    mov mov ebx, eax
    test test ebx, ebx
    pop pop ecx
    mov mov dword ptr [ebp - 12], ebx
    je L6
    lea lea eax, [esi + esi]
    push push eax
    push push ebx
    mov mov ecx, edi
    call sub_1006C5AB
    mov mov edi, eax
    test test edi, edi
    jl sub_10070FE3
    mov mov edx, esi
    xor xor eax, eax
    shl shl edx, 2
    mov mov dword ptr [ebp + 24], edx
    mov mov ecx, ebx
    mov mov dword ptr [ebp + eax*4 - 24], ecx
    inc inc eax
    add add ecx, edx
    cmp cmp eax, 2
    jb L0
    mov mov eax, dword ptr [ebp + 20]
    push push 4
    pop pop edx
    xor xor ecx, ecx
    test test esi, esi
    mov mov dword ptr [ebp - 8], edx
    jbe L1
    mov mov edi, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edi + 8]
    mov mov edi, dword ptr [edi + 20]
    mov mov dword ptr [ebp + 20], edi
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov ebx, dword ptr [ebp + 20]
    mov mov edi, dword ptr [ebx + edi*4]
    mov mov edi, dword ptr [edi]
    and and edi, edx
    and and dword ptr [ebp - 8], edi
    inc inc ecx
    cmp cmp ecx, esi
    jb L2
    cmp cmp dword ptr [ebp - 8], 0
    je L4
    push push edx
    and and esi, 0FFFFFh
    push push 0
    push push eax
    mov mov eax, esi
    or or eax, 010000000h
    jmp L5
    push push edx
    push push eax
    and and esi, 0FFFFFh
    push push eax
    mov mov eax, esi
    or or eax, 020500000h
    push push dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 4]
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E3D7
    mov mov edi, eax
    test test edi, edi
    jl sub_1007106D
    mov mov ecx, dword ptr [ebp - 4]
    push push 8
    push push 0
    push push dword ptr [ebp - 24]
    or or esi, 010100000h
    push push dword ptr [ebp - 20]
    push push esi
    push push dword ptr [ebp + 8]
    call sub_1006E3FD
    mov mov edi, eax
    test test edi, edi
    jl sub_10071093
    mov mov edi, dword ptr [ebp + 12]
    test test edi, edi
    je L7
    mov mov ecx, dword ptr [ebp + 24]
    mov mov esi, dword ptr [ebp - 24]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L1:
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebp + 16]
    test test edi, edi
    je sub_100710B7
    mov mov esi, dword ptr [ebp - 20]
    jmp sub_100710AE
    mov mov ebx, dword ptr [ebp + 24]
    lea lea eax, [ebx + ebx*2]
    shl shl eax, 2
    push push eax
    call sub_100F79A6
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 12], eax
    jne sub_10070FB6
    mov mov edi, 08007000Eh
    jmp sub_100710E2
    lea lea eax, [ebx + ebx*2]
    push push eax
    push push dword ptr [ebp - 12]
    mov mov ecx, edi
    call sub_1006C6C2
    mov mov edi, eax
    test test edi, edi
    jl sub_100710FA
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edx, ebx
    xor xor eax, eax
    shl shl edx, 2
L5:
    mov mov dword ptr [ebp + 24], edx
    mov mov dword ptr [ebp + eax*4 - 24], ecx
    inc inc eax
    add add ecx, edx
    cmp cmp eax, 3
L6:
    jb sub_10071016
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    push push 0
    push push dword ptr [ebp + 20]
    mov mov esi, ebx
    push push dword ptr [ebp - 24]
    and and esi, 0FFFFFh
    mov mov dword ptr [ebp - 8], esi
    or or word ptr [ebp - 6], 01010h
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call sub_1006E4B0
    mov mov edi, eax
    test test edi, edi
    jl sub_10071146
    push push 4
    push push dword ptr [ebp - 24]
    or or esi, 020100000h
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp - 20]
    push push esi
    mov mov esi, dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E4D9
    mov mov edi, eax
    test test edi, edi
    jl sub_1007116F
    push push 8
    push push 0
    push push dword ptr [ebp - 20]
    mov mov ecx, esi
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call sub_1006E4FA
    mov mov edi, eax
    test test edi, edi
    jl sub_1007118C
    xor xor eax, eax
    test test ebx, ebx
    jbe sub_10071139
    mov mov ecx, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov edx, dword ptr [ebp + 20]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ecx + edx*4]
    test test byte ptr [edx], 23
    je sub_1007114D
    inc inc eax
    cmp cmp eax, ebx
    jb sub_1007113F
    cmp cmp eax, ebx
    jne sub_10071177
    xor xor ecx, ecx
    test test ebx, ebx
    jbe sub_1007117D
    mov mov edx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    or or dword ptr [eax], 23
    inc inc ecx
    cmp cmp ecx, ebx
    jb sub_1007117D
    mov mov edi, dword ptr [ebp + 12]
    test test edi, edi
    je sub_100711B6
    mov mov ecx, dword ptr [ebp + 24]
    mov mov esi, dword ptr [ebp - 20]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebp + 16]
    test test edi, edi
    je sub_100711EC
    mov mov esi, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp + 24]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    xor xor edi, edi
    push push dword ptr [ebp - 12]
    call sub_100F7ADD
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_10070d24 ENDP
END
