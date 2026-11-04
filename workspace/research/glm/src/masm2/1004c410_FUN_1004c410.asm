.686
.MODEL FLAT, C
EXTRN sub_1004C4AC:PROC
EXTRN sub_1004C4B6:PROC
.CODE
FUN_1004c410 PROC
    push push ecx
    mov mov eax, dword ptr [esi + 4]
    push push ebx
    push push 84
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 01A4h], eax
    mov mov dword ptr [eax], 01004C0E0h
    mov mov edx, dword ptr [esi + 44]
    mov mov ecx, dword ptr [esi + 0CCh]
    add add esp, 12
    xor xor ebx, ebx
    test test edx, edx
    jle sub_1004C4AC
    push push ebp
    add add ecx, 80
    push push edi
    mov mov dword ptr [esp + 12], ecx
    lea lea ebp, [eax + 44]
    mov mov ecx, dword ptr [esi + 4]
    push push 0100h
    push push 1
    push push esi
    call call dword ptr [ecx]
    mov mov edx, dword ptr [esp + 24]
    mov mov edi, eax
    xor xor eax, eax
    mov mov dword ptr [edx], edi
    mov mov ecx, 64
    rep stosd rep stosd dword ptr es:[edi], eax
    add add esp, 12
    mov mov dword ptr [ebp], -1
    mov mov eax, dword ptr [esi + 44]
    inc inc ebx
    add add edx, 84
    add add ebp, 4
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 12], edx
    jl sub_1004C4B6
    pop pop edi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1004c410 ENDP
END
