.686
.MODEL FLAT, C
EXTRN sub_1005ED15:PROC
EXTRN sub_1005ED2A:PROC
EXTRN sub_100EFF69:PROC
EXTRN sub_100EFFE1:PROC
EXTRN fp_1010C1C0:DWORD
EXTRN fp_1010C1C4:DWORD
EXTRN fp_1010C1D4:DWORD
EXTRN fp_101D49C8:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D493C:DWORD
EXTRN g_101D4940:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_101D4C78:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10025e80 PROC
    sub esp, 76
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 88]
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [g_101D4C78]
    test eax, eax
    push esi
    push edi
    mov dword ptr [esp + 16], 0
    mov dword ptr [esp + 24], ecx
    je L0
    mov ecx, dword ptr [g_101D4C6C]
    mov eax, dword ptr [g_101D4C70]
    jmp L2
L0:
    mov edx, dword ptr [g_101D493C]
    push 2
    push edx
    call dword ptr [fp_1010C1C4]
    lea ecx, [esp + 52]
    push ecx
    push eax
    mov dword ptr [esp + 60], 40
    call dword ptr [fp_1010C1D4]
    test eax, eax
    jne L1
    push 010197014h
    jmp L18
L1:
    mov eax, dword ptr [g_101D493C]
    lea edx, [esp + 20]
    push edx
    push eax
    call dword ptr [fp_1010C1C0]
    mov edi, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 56]
    cmp edi, esi
    jl L17
    mov ebx, dword ptr [esp + 24]
    mov edx, dword ptr [esp + 60]
    cmp ebx, edx
    jl L17
    mov ecx, dword ptr [esp + 64]
    lea eax, [edi + ebp]
    cmp eax, ecx
    jg L17
    mov eax, dword ptr [esp + 100]
    lea ebp, [ebx + eax]
    mov eax, dword ptr [esp + 68]
    cmp ebp, eax
    jg L17
    mov ebp, dword ptr [esp + 96]
    sub edi, esi
    sub ecx, esi
    sub eax, edx
    sub ebx, edx
    mov dword ptr [esp + 20], edi
    mov dword ptr [esp + 24], ebx
L2:
    mov edx, dword ptr [g_101D1BF8]
    mov esi, dword ptr [edx]
    push 0
    lea edi, [esp + 20]
    push edi
    push 3
    push 21
    push eax
    push ecx
    push edx
    call dword ptr [esi + 0x90]
    test eax, eax
    jge L3
    push eax
    push eax
    jmp L5
L3:
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [g_101D4940]
    mov ecx, dword ptr [eax]
    push edx
    push eax
    call dword ptr [ecx + 0x10]
    mov esi, eax
    test esi, esi
    jge L6
    mov eax, dword ptr [esp + 16]
    lea ebx, [ebx]
L4:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [esp + 16], eax
    jne L4
    push esi
    push esi
L5:
    call sub_100EFF69
    push eax
    push 010196F78h
    push 3
    call dword ptr [fp_101D49C8]
    add esp, 16
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 76
    ret
L6:
    mov eax, dword ptr [esp + 20]
    mov ebx, dword ptr [esp + 100]
    mov dword ptr [esp + 36], eax
    add eax, ebp
    mov dword ptr [esp + 44], eax
    mov eax, dword ptr [esp + 24]
    push 16
    mov dword ptr [esp + 44], eax
    lea ecx, [esp + 40]
    push ecx
    add eax, ebx
    mov dword ptr [esp + 56], eax
    mov eax, dword ptr [esp + 24]
    mov edx, dword ptr [eax]
    lea ecx, [esp + 36]
    push ecx
    push eax
    call dword ptr [edx + 0x34]
    mov esi, eax
    test esi, esi
    jge L8
    mov eax, dword ptr [esp + 16]
L7:
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [esp + 16], eax
    jne L7
    push esi
    push esi
    call sub_100EFFE1
    push eax
    push 010196F34h
    push 3
    call dword ptr [fp_101D49C8]
    add esp, 16
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 76
    ret
L8:
    cmp dword ptr [esp + 104], 3
    mov esi, dword ptr [esp + 32]
    mov edi, dword ptr [esp + 108]
    jne L12
    test ebx, ebx
    jle L15
    mov ecx, dword ptr [esp + 28]
    lea eax, [ebp*4]
    sub ecx, eax
L9:
    test ebp, ebp
    jle L11
    mov eax, ebp
L10:
    mov dl, byte ptr [esi]
    mov byte ptr [edi], dl
    mov dl, byte ptr [esi + 1]
    mov byte ptr [edi + 1], dl
    mov dl, byte ptr [esi + 2]
    mov byte ptr [edi + 2], dl
    add edi, 3
    add esi, 4
    dec eax
    jne L10
L11:
    add esi, ecx
    dec ebx
    jne L9
    jmp L15
L12:
    mov eax, dword ptr [esp + 28]
    lea ebx, [ebp*4]
    cmp eax, ebx
    jne L13
    imul ebp, dword ptr [esp + 100]
    shl ebp, 2
    push ebp
    push esi
    push edi
    call sub_1005ED15
    add esp, 12
    jmp L15
L13:
    mov ebp, dword ptr [esp + 100]
    test ebp, ebp
    jle L15
L14:
    push ebx
    push esi
    push edi
    call sub_1005ED2A
    mov ecx, dword ptr [esp + 40]
    add esp, 12
    add edi, ebx
    add esi, ecx
    dec ebp
    jne L14
L15:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x38]
    mov eax, dword ptr [esp + 16]
L16:
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [esp + 16], eax
    jne L16
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 76
    ret
L17:
    push 010196FD0h
L18:
    push 3
    call dword ptr [fp_101D49C8]
    add esp, 8
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 76
    ret
FUN_10025e80 ENDP
END
