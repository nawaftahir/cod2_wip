; FUN_100636dd @ 0x100636dd — auto-synthesized
    sub_10062dec PROTO C
    sub_10081d89 PROTO C
.CODE
FUN_100636dd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x2c
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    test ebx, ebx
    je L0
    and dword ptr [ebx], 0
    cmp dword ptr [ebp + 8], 0
    je L1
    test ebx, ebx
    jne L2
    mov eax, 0x8876086c
    jmp L3
    lea eax, [ebp + 8]
    push eax
    lea eax, [ebp - 4]
    push eax
    push 0x47554244
    push dword ptr [ebp + 8]
    call sub_10062dec
    test eax, eax
    jl L3
    cmp eax, 1
    push esi
    push edi
    jne L4
    push 0xa
    pop ecx
    xor eax, eax
    lea edi, [ebp - 0x2c]
    rep stosd dword ptr es:[edi], eax
    push 0x28
    pop eax
    mov dword ptr [ebp - 0x2c], eax
    lea esi, [ebp - 0x2c]
    mov dword ptr [ebp + 8], eax
    jmp L5
    mov esi, dword ptr [ebp - 4]
    lea eax, [ebp + 0xc]
    push eax
    push dword ptr [ebp + 8]
    call sub_10081d89
    test eax, eax
    jl L6
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ebp + 8]
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [ebx], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100636dd ENDP
END