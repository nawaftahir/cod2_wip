.686
.MODEL FLAT, C
EXTRN sub_1000D889:PROC
EXTRN sub_1000D891:PROC
EXTRN sub_1000D8A2:PROC
EXTRN sub_1000D8A3:PROC
EXTRN sub_1000D8B6:PROC
EXTRN sub_1000D8BC:PROC
EXTRN sub_1000D8C9:PROC
EXTRN sub_1000D8D9:PROC
EXTRN sub_1000D8DC:PROC
EXTRN sub_1000D8E9:PROC
EXTRN sub_1000D8F0:PROC
EXTRN sub_1000D935:PROC
EXTRN sub_1000D957:PROC
EXTRN sub_1000D970:PROC
EXTRN sub_1000D97E:PROC
EXTRN sub_1000D988:PROC
EXTRN sub_1000D994:PROC
EXTRN sub_1000D9AE:PROC
EXTRN sub_1002BF57:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A6C:DWORD:DWORD
EXTRN EXTRN fp_101D4AB4:DWORD:DWORD
EXTRN EXTRN g_101CE5F8:DWORD:DWORD
EXTRN EXTRN g_101CE6C0:DWORD:DWORD
EXTRN EXTRN g_101CE704:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7D4:DWORD:DWORD
EXTRN EXTRN g_101D0A68:DWORD:DWORD
EXTRN EXTRN g_101D0A6C:DWORD:DWORD
EXTRN EXTRN g_101D0A70:DWORD:DWORD
.CODE
FUN_1000d680 PROC
    push push ebx
    push push esi
    call sub_1002BF57
    push push 010193488h
    mov mov esi, eax
    call dword ptr [fp_101D4AB4]
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101CE704]
    mov mov cl, byte ptr [eax + 8]
    add add esp, 4
    test test cl, cl
    je L0
    push push 01019346Ch
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov ecx, dword ptr [g_101CE5F8]
    mov mov eax, dword ptr [ecx + 8]
    mov mov edx, dword ptr [g_101CE6C0]
    mov mov dword ptr [g_101D0A68], eax
    mov mov ecx, dword ptr [edx + 8]
    mov mov edx, dword ptr [g_101CE7D4]
    mov mov dword ptr [g_101D0A6C], ecx
    mov mov ecx, dword ptr [edx + 8]
    add add esp, 8
    mov mov dword ptr [g_101D0A70], ecx
    jmp sub_1000D889
    mov mov edx, dword ptr [g_101CE708]
    mov mov eax, dword ptr [edx + 8]
    push push edi
    mov mov edi, 2
    cmp cmp eax, edi
    jne L2
    push push 010193438h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    cmp cmp esi, 100
    jb L1
    xor xor eax, eax
    xor xor ecx, ecx
    xor xor esi, esi
    jmp L3
    cmp cmp esi, 28
    jb L2
    mov mov eax, 1
    mov mov ecx, eax
    mov mov esi, eax
    jmp L4
    mov mov eax, edi
    mov mov ecx, edi
    mov mov esi, edi
    mov mov dword ptr [g_101D0A68], eax
    mov mov dword ptr [g_101D0A6C], ecx
    mov mov dword ptr [g_101D0A70], esi
    cmp cmp ebx, 0180h
    jmp sub_1000D8A2
    push push 010193410h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    cmp cmp esi, 012Ch
    jb L5
    xor xor eax, eax
    xor xor ecx, ecx
    xor xor esi, esi
    jmp sub_1000D8A3
    cmp cmp esi, 0F0h
    jb L6
    xor xor eax, eax
    xor xor ecx, ecx
    mov mov esi, 1
    jmp sub_1000D8B6
    cmp cmp esi, 0BEh
    jb sub_1000D891
    mov mov ecx, 1
    xor xor eax, eax
    mov mov esi, ecx
    jmp sub_1000D8C9
    cmp cmp esi, 096h
    mov mov eax, 1
    jb sub_1000D8BC
    mov mov ecx, eax
    mov mov esi, eax
    jmp sub_1000D8DC
    cmp cmp esi, 082h
    jb sub_1000D8D9
    mov mov ecx, 1
    jmp sub_1000D8E9
    cmp cmp esi, 120
    mov mov ecx, edi
    jae sub_1000D8F0
    mov mov eax, edi
    mov mov esi, edi
    cmp cmp ebx, 0180h
L2:
    mov mov dword ptr [g_101D0A68], eax
    mov mov dword ptr [g_101D0A6C], ecx
    mov mov dword ptr [g_101D0A70], esi
L4:
    jb sub_1000D935
    cmp cmp ebx, 01E0h
    jae sub_1000D97E
    mov mov edi, 1
    xor xor dl, dl
    cmp cmp eax, edi
    jge sub_1000D957
    mov mov eax, edi
    mov mov dword ptr [g_101D0A68], eax
    mov mov dl, 1
    cmp cmp ecx, edi
    jge sub_1000D970
    mov mov dword ptr [g_101D0A6C], edi
    mov mov dl, 1
    cmp cmp esi, edi
    jge sub_1000D988
    mov mov dword ptr [g_101D0A70], edi
    jmp sub_1000D994
    test test dl, dl
    je sub_1000D9AE
    push push ebx
    push push 0101933B8h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [g_101D0A68]
    add add esp, 12
    pop pop edi
    push push eax
    mov mov eax, dword ptr [g_101CE5F8]
    push push eax
    call dword ptr [fp_101D4A6C]
    mov mov ecx, dword ptr [g_101D0A6C]
    mov mov edx, dword ptr [g_101CE6C0]
    push push ecx
    push push edx
    call dword ptr [fp_101D4A6C]
    mov mov eax, dword ptr [g_101D0A70]
    mov mov ecx, dword ptr [g_101CE7D4]
    push push eax
    push push ecx
    call dword ptr [fp_101D4A6C]
    mov mov edx, dword ptr [g_101D0A70]
    mov mov eax, dword ptr [g_101D0A6C]
    mov mov ecx, dword ptr [g_101D0A68]
    push push edx
    push push eax
    push push ecx
L6:
    push push 010193368h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 44
    pop pop esi
    pop pop ebx
    ret ret
FUN_1000d680 ENDP
END
