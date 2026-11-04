; FUN_10055300 @ 0x10055300 — auto-synthesized
.CODE
FUN_10055300 PROC
    push ecx
    mov eax, dword ptr [esi + 0x10]
    push ebx
    mov ebx, dword ptr [esi + 0x18]
    push ebp
    mov ebp, dword ptr [esi + 8]
    push edi
    imul ebx, ebp
    xor edi, edi
    test eax, eax
    mov dword ptr [esp + 0xc], ebp
    jle L0
    jmp L1
    mov ebp, dword ptr [esp + 0xc]
    mov ecx, dword ptr [esi + 0x14]
    sub eax, edi
    cmp ecx, eax
    jge L2
    mov eax, ecx
    mov ecx, dword ptr [esi + 0x18]
    mov edx, dword ptr [esi + 0x1c]
    add ecx, edi
    sub edx, ecx
    cmp eax, edx
    jl L3
    mov eax, edx
    mov edx, dword ptr [esi + 4]
    sub edx, ecx
    cmp eax, edx
    jl L4
    mov eax, edx
    test eax, eax
    jle L0
    imul eax, ebp
    mov ebp, eax
    mov al, byte ptr [esp + 0x18]
    test al, al
    push ebp
    push ebx
    je L5
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax + edi*4]
    mov eax, dword ptr [esp + 0x1c]
    push ecx
    lea edx, [esi + 0x28]
    push edx
    push eax
    call dword ptr [esi + 0x2c]
    jmp L6
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [esp + 0x1c]
    push edx
    lea eax, [esi + 0x28]
    push eax
    push ecx
    call dword ptr [eax]
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [esi + 0x10]
    add edi, edx
    add esp, 0x14
    add ebx, ebp
    cmp edi, eax
    jl L7
    pop edi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_10055300 ENDP
END