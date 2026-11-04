.686
.MODEL FLAT, C
EXTRN sub_10026160:PROC
EXTRN sub_1002617C:PROC
EXTRN sub_1002618C:PROC
EXTRN sub_1002619B:PROC
EXTRN sub_100261A6:PROC
EXTRN sub_100261AE:PROC
EXTRN sub_100261C4:PROC
EXTRN sub_10026255:PROC
EXTRN sub_10026263:PROC
EXTRN sub_10026264:PROC
EXTRN sub_10026265:PROC
EXTRN sub_1002629B:PROC
EXTRN sub_100262BF:PROC
EXTRN sub_100262CE:PROC
EXTRN sub_100262F2:PROC
EXTRN sub_100262FA:PROC
EXTRN sub_10026342:PROC
EXTRN sub_1005ED15:PROC
EXTRN sub_1005ED2A:PROC
EXTRN sub_100EFF69:PROC
EXTRN sub_100EFFE1:PROC
EXTRN EXTRN fp_1010C1C0:DWORD:DWORD
EXTRN EXTRN fp_1010C1C4:DWORD:DWORD
EXTRN EXTRN fp_1010C1D4:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D493C:DWORD:DWORD
EXTRN EXTRN g_101D4940:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_101D4C78:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10025e80 PROC
    sub sub esp, 76
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 88]
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [g_101D4C78]
    test test eax, eax
    push push esi
    push push edi
    mov mov dword ptr [esp + 16], 0
    mov mov dword ptr [esp + 24], ecx
    je L0
    mov mov ecx, dword ptr [g_101D4C6C]
    mov mov eax, dword ptr [g_101D4C70]
    jmp L2
    mov mov edx, dword ptr [g_101D493C]
    push push 2
    push push edx
    call dword ptr [fp_1010C1C4]
    lea lea ecx, [esp + 52]
    push push ecx
    push push eax
    mov mov dword ptr [esp + 60], 40
    call dword ptr [fp_1010C1D4]
    test test eax, eax
    jne L1
    push push 010197014h
    jmp sub_10026160
    mov mov eax, dword ptr [g_101D493C]
    lea lea edx, [esp + 20]
    push push edx
    push push eax
    call dword ptr [fp_1010C1C0]
    mov mov edi, dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 56]
    cmp cmp edi, esi
    jl sub_1002617C
    mov mov ebx, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 60]
    cmp cmp ebx, edx
    jl sub_1002618C
    mov mov ecx, dword ptr [esp + 64]
    lea lea eax, [edi + ebp]
    cmp cmp eax, ecx
    jg sub_1002619B
    mov mov eax, dword ptr [esp + 100]
    lea lea ebp, [ebx + eax]
    mov mov eax, dword ptr [esp + 68]
    cmp cmp ebp, eax
    jg sub_100261AE
    mov mov ebp, dword ptr [esp + 96]
    sub sub edi, esi
    sub sub ecx, esi
L1:
    sub sub eax, edx
    sub sub ebx, edx
    mov mov dword ptr [esp + 20], edi
    mov mov dword ptr [esp + 24], ebx
    mov mov edx, dword ptr [g_101D1BF8]
    mov mov esi, dword ptr [edx]
    push push 0
    lea lea edi, [esp + 20]
    push push edi
    push push 3
    push push 21
    push push eax
    push push ecx
    push push edx
    call call dword ptr [esi + 090h]
    test test eax, eax
    jge L3
    push push eax
    push push eax
    jmp L4
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [g_101D4940]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push eax
    call call dword ptr [ecx + 16]
L2:
    mov mov esi, eax
    test test esi, esi
    jge L6
    mov mov eax, dword ptr [esp + 16]
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [esp + 16], eax
    jne L5
    push push esi
    push push esi
    call sub_100EFF69
    push push eax
    push push 010196F78h
    push push 3
    call dword ptr [fp_101D49C8]
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 76
    ret ret
    mov mov eax, dword ptr [esp + 20]
    mov mov ebx, dword ptr [esp + 100]
    mov mov dword ptr [esp + 36], eax
    add add eax, ebp
    mov mov dword ptr [esp + 44], eax
    mov mov eax, dword ptr [esp + 24]
    push push 16
    mov mov dword ptr [esp + 44], eax
    lea lea ecx, [esp + 40]
    push push ecx
    add add eax, ebx
    mov mov dword ptr [esp + 56], eax
    mov mov eax, dword ptr [esp + 24]
    mov mov edx, dword ptr [eax]
    lea lea ecx, [esp + 36]
    push push ecx
    push push eax
    call call dword ptr [edx + 52]
    mov mov esi, eax
    test test esi, esi
    jge sub_100261C4
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [esp + 16], eax
    jne sub_100261A6
    push push esi
    push push esi
    call sub_100EFFE1
    push push eax
    push push 010196F34h
    push push 3
    call dword ptr [fp_101D49C8]
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 76
    ret ret
    cmp cmp dword ptr [esp + 104], 3
    mov mov esi, dword ptr [esp + 32]
    mov mov edi, dword ptr [esp + 108]
    jne sub_10026255
    test test ebx, ebx
    jle sub_1002629B
    mov mov ecx, dword ptr [esp + 28]
    lea lea eax, [ebp*4]
    sub sub ecx, eax
    test test ebp, ebp
    jle sub_10026263
    mov mov eax, ebp
    mov mov dl, byte ptr [esi]
    mov mov byte ptr [edi], dl
    mov mov dl, byte ptr [esi + 1]
    mov mov byte ptr [edi + 1], dl
    mov mov dl, byte ptr [esi + 2]
    mov mov byte ptr [edi + 2], dl
    add add edi, 3
    add add esi, 4
    dec dec eax
    jne sub_10026265
    add add esi, ecx
    dec dec ebx
    jne sub_10026264
    jmp sub_100262CE
    mov mov eax, dword ptr [esp + 28]
    lea lea ebx, [ebp*4]
    cmp cmp eax, ebx
    jne sub_100262BF
    imul imul ebp, dword ptr [esp + 100]
    shl shl ebp, 2
    push push ebp
    push push esi
    push push edi
    call sub_1005ED15
    add add esp, 12
    jmp sub_100262F2
    mov mov ebp, dword ptr [esp + 100]
    test test ebp, ebp
    jle sub_100262FA
    push push ebx
    push push esi
    push push edi
    call sub_1005ED2A
    mov mov ecx, dword ptr [esp + 40]
    add add esp, 12
    add add edi, ebx
    add add esi, ecx
    dec dec ebp
    jne sub_100262FA
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [eax]
L6:
    push push eax
    call call dword ptr [ecx + 56]
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [esp + 16], eax
    jne sub_10026342
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    add add esp, 76
    ret ret
    push push 010196FD0h
    push push 3
    call dword ptr [fp_101D49C8]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 76
    ret ret
FUN_10025e80 ENDP
END
