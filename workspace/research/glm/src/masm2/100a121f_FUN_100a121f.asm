.686
.MODEL FLAT, C
EXTRN sub_1006508D:PROC
EXTRN sub_10065105:PROC
EXTRN sub_1008291B:PROC
EXTRN sub_10083183:PROC
EXTRN sub_1009953E:PROC
EXTRN sub_100A0E93:PROC
EXTRN sub_100A12E3:PROC
EXTRN sub_100A12E4:PROC
EXTRN sub_100A12F3:PROC
EXTRN sub_100A12FE:PROC
EXTRN sub_100A1315:PROC
EXTRN sub_100A131A:PROC
EXTRN sub_100A1365:PROC
EXTRN sub_100A1377:PROC
.CODE
FUN_100a121f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 24], ebx
    jne L0
    xor xor eax, eax
    jmp sub_100A12E4
    push push edi
    push push 36
    call sub_1006508D
    cmp cmp eax, ebx
    je L1
    mov mov ecx, eax
    call sub_10083183
    mov mov edi, eax
    jmp L2
    xor xor edi, edi
    cmp cmp edi, ebx
    je sub_100A12FE
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp dword ptr [ebp + 8], ebx
    mov mov dword ptr [edi + 16], ecx
    mov mov eax, dword ptr [esi + 24]
    je L3
    cmp cmp dword ptr [eax + 32], ebx
    jne sub_100A12E3
    mov mov eax, dword ptr [esi + 16]
    push push dword ptr [eax + 20]
    push push 010115390h
    push push 0C07h
    lea lea eax, [esi + 32]
    push push eax
    push push esi
    call sub_1009953E
    add add esp, 20
    jmp sub_100A1315
    cmp cmp dword ptr [eax + 32], ebx
    je sub_100A131A
    mov mov eax, dword ptr [esi + 16]
    push push dword ptr [eax + 20]
    push push 01010FB4Ch
    push push 0C08h
    jmp sub_100A12F3
    push push ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    push push dword ptr [eax + 44]
    push push 21
    call sub_100A0E93
    mov mov dword ptr [edi + 20], eax
    push push 20
    call sub_10065105
    cmp cmp eax, ebx
    je sub_100A1365
    push push 010114734h
    push push ebx
    push push edi
    mov mov ecx, eax
    call sub_1008291B
    jmp sub_100A1377
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 4
FUN_100a121f ENDP
END
