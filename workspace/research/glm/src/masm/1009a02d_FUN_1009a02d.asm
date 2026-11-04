.686
.MODEL FLAT, C
.CODE
FUN_1009a02d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    push ebx
    push esi
    push edi
    je L22
    cmp dword ptr [ecx + 4], 9
    jne L22
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L22
    cmp dword ptr [eax + 4], 9
    jne L22
    mov esi, dword ptr [ecx + 20]
    mov edi, dword ptr [eax + 20]
    cmp esi, edi
    jne L0
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], esi
    jmp L25
L0:
    mov eax, dword ptr [esi*8 + 010114878h]
    mov ecx, dword ptr [edi*8 + 010114878h]
    cmp eax, ecx
    jbe L1
    mov ecx, eax
L1:
    mov eax, dword ptr [esi*8 + 01011487Ch]
    and eax, dword ptr [edi*8 + 01011487Ch]
    xor edx, edx
    inc edx
    test dl, al
    je L2
    mov eax, dword ptr [ebp + 16]
    and dword ptr [eax], 0
    jmp L25
L2:
    push 4
    pop ebx
    test bl, al
    je L7
    test ecx, ecx
    je L6
    push 8
    pop edx
    cmp ecx, edx
    je L5
    cmp ecx, 16
    je L4
    cmp ecx, 32
    je L3
    cmp ecx, 64
    jne L25
L3:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], edx
    jmp L25
L4:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 7
    jmp L25
L5:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 6
    jmp L25
L6:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 5
    jmp L25
L7:
    test al, 2
    je L11
    test ecx, ecx
    je L3
    cmp ecx, 8
    je L10
    cmp ecx, 16
    je L9
    cmp ecx, 32
    je L8
    cmp ecx, 64
    jne L25
L8:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], ebx
    jmp L25
L9:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 3
    jmp L25
L10:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 2
    jmp L25
L11:
    push 8
    pop edx
    test dl, al
    je L15
    test ecx, ecx
    je L14
    cmp ecx, edx
    je L13
    cmp ecx, 16
    je L13
    cmp ecx, 32
    je L12
    cmp ecx, 64
    jne L25
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 12
    jmp L25
L12:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 11
    jmp L25
L13:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 10
    jmp L25
L14:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 9
    jmp L25
L15:
    test al, 16
    je L22
    xor edx, edx
L16:
    test edx, edx
    mov ecx, esi
    jne L18
    mov ecx, edi
    mov eax, esi
L17:
    cmp ecx, 13
    je L24
    cmp ecx, 15
    jne L19
    cmp eax, ecx
    jl L21
    cmp eax, 19
    jmp L20
L18:
    mov eax, edi
    jmp L17
L19:
    cmp ecx, 20
    jne L21
    cmp eax, ecx
    jl L21
    cmp eax, 24
L20:
    jle L24
L21:
    inc edx
    cmp edx, 2
    jb L16
L22:
    mov eax, 080004005h
L23:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
L24:
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ecx], eax
L25:
    xor eax, eax
    jmp L23
FUN_1009a02d ENDP
END
