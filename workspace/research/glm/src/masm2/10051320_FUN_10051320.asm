.686
.MODEL FLAT, C
EXTRN sub_100513B9:PROC
EXTRN sub_100513D1:PROC
.CODE
FUN_10051320 PROC
    mov mov eax, dword ptr [esi + 4]
    push push ebx
    push push 64
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 01A0h], eax
    mov mov dword ptr [eax], 010050680h
    xor xor ebx, ebx
    mov mov dword ptr [eax + 44], ebx
    mov mov dword ptr [eax + 48], ebx
    mov mov dword ptr [eax + 52], ebx
    mov mov dword ptr [eax + 56], ebx
    mov mov edx, dword ptr [esi + 44]
    mov mov ecx, dword ptr [esi + 4]
    shl shl edx, 8
    push push edx
    push push 1
    push push esi
    call call dword ptr [ecx]
    mov mov dword ptr [esi + 094h], eax
    mov mov edx, eax
    mov mov eax, dword ptr [esi + 44]
    add add esp, 24
    cmp cmp eax, ebx
    jle sub_100513D1
    push push edi
    jmp sub_100513B9
    lea lea esp, [esp]
    or or eax, -1
    mov mov edi, edx
    mov mov ecx, 64
    add add edx, 0100h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [esi + 44]
    inc inc ebx
FUN_10051320 ENDP
END
