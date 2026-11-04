.686
.MODEL FLAT, C
EXTRN sub_1008B279:PROC
EXTRN sub_1008B2EE:PROC
EXTRN sub_100AEC51:PROC
EXTRN sub_100AF0CD:PROC
EXTRN sub_100AF0EB:PROC
EXTRN sub_100AF109:PROC
EXTRN sub_100F7A69:PROC
.CODE
FUN_100b1b2e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 76], 4
    mov dword ptr [ebp - 12], ebx
    je L0
    mov eax, 080004005h
    jmp L19
L0:
    push edi
    xor eax, eax
    lea edi, [ebp - 28]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor eax, eax
    lea edi, [ebp - 44]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 4], ebx
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 8], ebx
L1:
    mov eax, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [ebp - 8]
    lea eax, [eax + ecx*4]
    mov edx, dword ptr [eax]
    cmp edx, ebx
    je L6
    mov ecx, dword ptr [edx]
    cmp ecx, ebx
    je L6
    mov edi, edx
    mov edi, dword ptr [edi]
    mov ebx, edi
    and ebx, 0FFF00000h
    cmp ebx, 072100000h
    je L3
    and ecx, 0FFF00000h
    xor ebx, ebx
    cmp ecx, 011000000h
    je L2
    and edi, 0000FFFFFh
    mov ebx, edi
L2:
    mov ecx, dword ptr [edx + 8]
    mov ecx, dword ptr [ecx + ebx*4]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    cmp ecx, dword ptr [esi + 000000088h]
    mov ecx, dword ptr [eax]
    jne L4
    mov edx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp + edx*4 - 44], ecx
    jmp L5
L3:
    mov ecx, dword ptr [eax]
L4:
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ebp + edx*4 - 28], ecx
L5:
    xor ebx, ebx
    mov dword ptr [eax], ebx
L6:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 76]
    jb L1
    xor edx, edx
    cmp dword ptr [esi + 76], ebx
    jbe L9
L7:
    mov eax, dword ptr [esi + 00000022Ch]
    lea eax, [eax + edx*4]
    mov ecx, dword ptr [eax]
    cmp ecx, ebx
    je L8
    mov ecx, dword ptr [ecx]
    cmp ecx, ebx
    je L8
    and ecx, 0FFF00000h
    cmp ecx, 072100000h
    je L8
    lea ecx, [ebp + edx*4 - 28]
    cmp dword ptr [ecx], ebx
    jne L20
    mov edi, dword ptr [eax]
    mov dword ptr [ecx], edi
    mov dword ptr [eax], ebx
L8:
    inc edx
    cmp edx, dword ptr [esi + 76]
    jb L7
L9:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000101h
    jbe L10
    push 1
    lea eax, [ebp - 28]
    push eax
    push dword ptr [ebp - 4]
    lea eax, [ebp - 44]
    push eax
    mov ecx, esi
    call sub_100AF0CD
    mov edi, eax
    cmp edi, ebx
    jl L17
L10:
    push 2
    lea eax, [ebp - 28]
    push eax
    push dword ptr [ebp - 4]
    lea eax, [ebp - 44]
    push eax
    mov ecx, esi
    call sub_100AF0EB
    mov edi, eax
    cmp edi, ebx
    jl L17
    push 3
    lea eax, [ebp - 28]
    push eax
    push dword ptr [ebp - 4]
    lea eax, [ebp - 44]
    push eax
    mov ecx, esi
    call sub_100AF109
    mov edi, eax
    cmp edi, ebx
    jl L17
    lea eax, [ebp - 28]
    push eax
    push dword ptr [ebp - 4]
    lea eax, [ebp - 44]
    push eax
    mov ecx, esi
    call sub_100AEC51
    mov edi, eax
    cmp edi, ebx
    jl L17
    cmp dword ptr [esi + 76], 0
    mov dword ptr [ebp - 8], ebx
    mov ebx, 080004005h
    jbe L13
L11:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp + eax*4 - 44]
    test eax, eax
    je L12
    mov ecx, dword ptr [esi + 0000000C8h]
    and ecx, 0000000FFh
    push ecx
    push 010117980h
    push 0000011ABh
    push dword ptr [eax + 60]
    mov edi, ebx
    push esi
    call sub_1008B279
    add esp, 20
    mov dword ptr [ebp - 12], 1
L12:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 76]
    jb L11
L13:
    cmp edi, ebx
    je L16
    xor eax, eax
    cmp dword ptr [esi + 76], eax
    jbe L15
L14:
    mov edx, dword ptr [ebp + eax*4 - 28]
    mov ecx, dword ptr [esi + 000000230h]
    mov dword ptr [ecx + eax*4], edx
    inc eax
    cmp eax, dword ptr [esi + 76]
    jb L14
L15:
    lea edi, [esi + 00000022Ch]
    push dword ptr [edi]
    call sub_100F7A69
    and dword ptr [edi], 0
    and dword ptr [esi + 000000220h], 0
    pop ecx
    xor edi, edi
L16:
    test edi, edi
    jge L18
    xor ebx, ebx
L17:
    cmp dword ptr [ebp - 12], ebx
    jne L18
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 010117900h
    push 0000011ABh
    push ebx
    push esi
    call sub_1008B2EE
    add esp, 20
L18:
    mov eax, edi
    pop edi
L19:
    pop esi
    pop ebx
    leave
    ret
L20:
    mov edi, 080004005h
    jmp L17
FUN_100b1b2e ENDP
END
