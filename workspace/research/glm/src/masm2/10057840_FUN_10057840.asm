.686
.MODEL FLAT, C
EXTRN sub_10057756:PROC
EXTRN sub_10057984:PROC
EXTRN sub_100579B5:PROC
EXTRN sub_100579C8:PROC
EXTRN sub_10057A17:PROC
EXTRN sub_10057A3B:PROC
EXTRN sub_10057A6A:PROC
.CODE
FUN_10057840 PROC
    mov mov eax, dword ptr [esi + 4]
    push push edi
    push push 44
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov edi, eax
    mov mov dword ptr [esi + 01B0h], edi
    mov mov dword ptr [edi], 010057710h
    mov mov dword ptr [edi + 12], 010057830h
    mov mov dword ptr [edi + 32], 0
    mov mov dword ptr [edi + 40], 0
    mov mov eax, dword ptr [esi + 108]
    add add esp, 12
    cmp cmp eax, 3
    je L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 47
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 4]
    push push ebp
    push push 080h
    push push 1
    push push esi
    call call dword ptr [eax]
    add add esp, 12
    mov mov dword ptr [edi + 24], eax
    xor xor ebp, ebp
    mov mov ecx, dword ptr [esi + 4]
    push push 01000h
    push push 1
    push push esi
    call call dword ptr [ecx + 4]
    mov mov edx, dword ptr [edi + 24]
    mov mov dword ptr [edx + ebp], eax
    add add ebp, 4
    add add esp, 12
    cmp cmp ebp, 080h
    jl L1
    mov mov byte ptr [edi + 28], 1
    mov mov al, byte ptr [esi + 98]
    test test al, al
    je sub_100579B5
    mov mov ebp, dword ptr [esi + 92]
    cmp cmp ebp, 8
    jge sub_10057984
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 56
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 24], 8
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    cmp cmp ebp, 0100h
    jle sub_100579C8
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 57
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 24], 0100h
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 4]
    push push 3
    push push ebp
    push push 1
    push push esi
    call call dword ptr [eax + 8]
    add add esp, 16
    mov mov dword ptr [edi + 16], eax
    mov mov dword ptr [edi + 20], ebp
    jmp sub_10057A17
    mov mov dword ptr [edi + 16], 0
    mov mov eax, dword ptr [esi + 84]
    test test eax, eax
    mov mov ecx, 2
    pop pop ebp
    je sub_10057A3B
    mov mov dword ptr [esi + 84], ecx
    cmp cmp dword ptr [esi + 84], ecx
    jne sub_10057A6A
    mov mov eax, dword ptr [esi + 100]
    mov mov edx, dword ptr [esi + 4]
    add add eax, ecx
    lea lea eax, [eax + eax*2]
    shl shl eax, 1
    push push eax
    push push 1
    push push esi
    call call dword ptr [edx + 4]
    add add esp, 12
    mov mov dword ptr [edi + 32], eax
    mov mov eax, esi
    pop pop edi
    jmp sub_10057756
    pop pop edi
    ret ret
FUN_10057840 ENDP
END
