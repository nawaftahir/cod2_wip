.686
.MODEL FLAT, C
EXTRN sub_1002BF57:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A6C:DWORD
EXTRN fp_101D4AB4:DWORD
EXTRN g_101CE5F8:DWORD
EXTRN g_101CE6C0:DWORD
EXTRN g_101CE704:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE7D4:DWORD
EXTRN g_101D0A68:DWORD
EXTRN g_101D0A6C:DWORD
EXTRN g_101D0A70:DWORD
.CODE
FUN_1000d680 PROC
    push ebx
    push esi
    call sub_1002BF57
    push 010193488h
    mov esi, eax
    call dword ptr [fp_101D4AB4]
    mov ebx, eax
    mov eax, dword ptr [g_101CE704]
    mov cl, byte ptr [eax + 8]
    add esp, 4
    test cl, cl
    je L0
    push 01019346Ch
    push 0
    call dword ptr [fp_101D49C8]
    mov ecx, dword ptr [g_101CE5F8]
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [g_101CE6C0]
    mov dword ptr [g_101D0A68], eax
    mov ecx, dword ptr [edx + 8]
    mov edx, dword ptr [g_101CE7D4]
    mov dword ptr [g_101D0A6C], ecx
    mov ecx, dword ptr [edx + 8]
    add esp, 8
    mov dword ptr [g_101D0A70], ecx
    jmp L19
L0:
    mov edx, dword ptr [g_101CE708]
    mov eax, dword ptr [edx + 8]
    push edi
    mov edi, 2
    cmp eax, edi
    jne L4
    push 010193438h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    cmp esi, 100
    jb L1
    xor eax, eax
    xor ecx, ecx
    xor esi, esi
    jmp L3
L1:
    cmp esi, 28
    jb L2
    mov eax, 1
    mov ecx, eax
    mov esi, eax
    jmp L3
L2:
    mov eax, edi
    mov ecx, edi
    mov esi, edi
L3:
    mov dword ptr [g_101D0A68], eax
    mov dword ptr [g_101D0A6C], ecx
    mov dword ptr [g_101D0A70], esi
    cmp ebx, 000000180h
    jmp L12
L4:
    push 010193410h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    cmp esi, 00000012Ch
    jb L5
    xor eax, eax
    xor ecx, ecx
    xor esi, esi
    jmp L11
L5:
    cmp esi, 0000000F0h
    jb L6
    xor eax, eax
    xor ecx, ecx
    mov esi, 1
    jmp L11
L6:
    cmp esi, 0000000BEh
    jb L7
    mov ecx, 1
    xor eax, eax
    mov esi, ecx
    jmp L11
L7:
    cmp esi, 000000096h
    mov eax, 1
    jb L8
    mov ecx, eax
    mov esi, eax
    jmp L11
L8:
    cmp esi, 000000082h
    jb L9
    mov ecx, 1
    jmp L10
L9:
    cmp esi, 120
    mov ecx, edi
    jae L10
    mov eax, edi
L10:
    mov esi, edi
L11:
    cmp ebx, 000000180h
    mov dword ptr [g_101D0A68], eax
    mov dword ptr [g_101D0A6C], ecx
    mov dword ptr [g_101D0A70], esi
    jb L13
    cmp ebx, 0000001E0h
L12:
    jae L18
    mov edi, 1
L13:
    xor dl, dl
    cmp eax, edi
    jge L14
    mov eax, edi
    mov dword ptr [g_101D0A68], eax
    mov dl, 1
L14:
    cmp ecx, edi
    jge L15
    mov dword ptr [g_101D0A6C], edi
    mov dl, 1
L15:
    cmp esi, edi
    jge L16
    mov dword ptr [g_101D0A70], edi
    jmp L17
L16:
    test dl, dl
    je L18
L17:
    push ebx
    push 0101933B8h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101D0A68]
    add esp, 12
L18:
    pop edi
L19:
    push eax
    mov eax, dword ptr [g_101CE5F8]
    push eax
    call dword ptr [fp_101D4A6C]
    mov ecx, dword ptr [g_101D0A6C]
    mov edx, dword ptr [g_101CE6C0]
    push ecx
    push edx
    call dword ptr [fp_101D4A6C]
    mov eax, dword ptr [g_101D0A70]
    mov ecx, dword ptr [g_101CE7D4]
    push eax
    push ecx
    call dword ptr [fp_101D4A6C]
    mov edx, dword ptr [g_101D0A70]
    mov eax, dword ptr [g_101D0A6C]
    mov ecx, dword ptr [g_101D0A68]
    push edx
    push eax
    push ecx
    push 010193368h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 44
    pop esi
    pop ebx
    ret
FUN_1000d680 ENDP
END
