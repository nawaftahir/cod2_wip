.686
.MODEL FLAT, C
EXTRN sub_1008B279:PROC
EXTRN sub_1008B2EE:PROC
EXTRN sub_100AEC51:PROC
EXTRN sub_100AF0CD:PROC
EXTRN sub_100AF0EB:PROC
EXTRN sub_100AF109:PROC
EXTRN sub_100B1D8E:PROC
EXTRN sub_100B1E66:PROC
EXTRN sub_100B1E76:PROC
EXTRN sub_100B1E94:PROC
EXTRN sub_100B1E9E:PROC
EXTRN sub_100B1EB2:PROC
EXTRN sub_100B1ECE:PROC
EXTRN sub_100B1F09:PROC
EXTRN sub_100B1F1C:PROC
EXTRN sub_100B1F7F:PROC
EXTRN sub_100B1F86:PROC
EXTRN sub_100B1F8F:PROC
EXTRN sub_100F7A69:PROC
.CODE
FUN_100b1b2e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 76], 4
    mov mov dword ptr [ebp - 12], ebx
    je L0
    mov mov eax, 080004005h
    jmp sub_100B1D8E
    push push edi
    xor xor eax, eax
    lea lea edi, [ebp - 28]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor eax, eax
    lea lea edi, [ebp - 44]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 4], ebx
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 8], ebx
    mov mov eax, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [ebp - 8]
    lea lea eax, [eax + ecx*4]
    mov mov edx, dword ptr [eax]
    cmp cmp edx, ebx
    je L3
    mov mov ecx, dword ptr [edx]
    cmp cmp ecx, ebx
    je L4
    mov mov edi, edx
    mov mov edi, dword ptr [edi]
    mov mov ebx, edi
    and and ebx, 0FFF00000h
    cmp cmp ebx, 072100000h
    je L5
    and and ecx, 0FFF00000h
    xor xor ebx, ebx
    cmp cmp ecx, 011000000h
    je L1
    and and edi, 0FFFFFh
    mov mov ebx, edi
    mov mov ecx, dword ptr [edx + 8]
    mov mov ecx, dword ptr [ecx + ebx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    cmp cmp ecx, dword ptr [esi + 088h]
    mov mov ecx, dword ptr [eax]
    jne L6
    mov mov edx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ebp + edx*4 - 44], ecx
    jmp L7
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp + edx*4 - 28], ecx
    xor xor ebx, ebx
    mov mov dword ptr [eax], ebx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 76]
    jb L2
    xor xor edx, edx
    cmp cmp dword ptr [esi + 76], ebx
    jbe L8
    mov mov eax, dword ptr [esi + 022Ch]
    lea lea eax, [eax + edx*4]
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, ebx
    je L9
    mov mov ecx, dword ptr [ecx]
    cmp cmp ecx, ebx
    je L10
    and and ecx, 0FFF00000h
    cmp cmp ecx, 072100000h
    je L11
    lea lea ecx, [ebp + edx*4 - 28]
    cmp cmp dword ptr [ecx], ebx
    jne sub_100B1E66
    mov mov edi, dword ptr [eax]
    mov mov dword ptr [ecx], edi
L2:
    mov mov dword ptr [eax], ebx
    inc inc edx
L3:
    cmp cmp edx, dword ptr [esi + 76]
    jb L8
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0101h
    jbe L12
    push push 1
    lea lea eax, [ebp - 28]
    push push eax
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 44]
    push push eax
    mov mov ecx, esi
    call sub_100AF0CD
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100B1E76
    push push 2
    lea lea eax, [ebp - 28]
    push push eax
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 44]
    push push eax
    mov mov ecx, esi
    call sub_100AF0EB
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100B1E94
L7:
    push push 3
    lea lea eax, [ebp - 28]
    push push eax
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 44]
    push push eax
    mov mov ecx, esi
    call sub_100AF109
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100B1EB2
    lea lea eax, [ebp - 28]
    push push eax
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 44]
    push push eax
    mov mov ecx, esi
    call sub_100AEC51
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100B1ECE
    cmp cmp dword ptr [esi + 76], 0
    mov mov dword ptr [ebp - 8], ebx
    mov mov ebx, 080004005h
    jbe sub_100B1E9E
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + eax*4 - 44]
    test test eax, eax
    je sub_100B1E9E
    mov mov ecx, dword ptr [esi + 0C8h]
    and and ecx, 0FFh
    push push ecx
    push push 010117980h
    push push 011ABh
    push push dword ptr [eax + 60]
    mov mov edi, ebx
    push push esi
    call sub_1008B279
    add add esp, 20
L8:
    mov mov dword ptr [ebp - 12], 1
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 76]
    jb sub_100B1E9E
    cmp cmp edi, ebx
    je sub_100B1F1C
    xor xor eax, eax
    cmp cmp dword ptr [esi + 76], eax
    jbe sub_100B1F09
L11:
    mov mov edx, dword ptr [ebp + eax*4 - 28]
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov dword ptr [ecx + eax*4], edx
    inc inc eax
    cmp cmp eax, dword ptr [esi + 76]
    jb sub_100B1F09
    lea lea edi, [esi + 022Ch]
    push push dword ptr [edi]
    call sub_100F7A69
    and and dword ptr [edi], 0
    and and dword ptr [esi + 0220h], 0
    pop pop ecx
    xor xor edi, edi
    test test edi, edi
    jge sub_100B1F7F
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp - 12], ebx
    jne sub_100B1F86
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFh
    push push eax
    push push 010117900h
    push push 011ABh
    push push ebx
    push push esi
    call sub_1008B2EE
    add add esp, 20
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov edi, 080004005h
    jmp sub_100B1F8F
FUN_100b1b2e ENDP
END
