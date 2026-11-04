; FUN_10051510 @ 0x10051510 — auto-synthesized
.CODE
FUN_10051510 PROC
    push ebx
    push esi
    push edi
    mov edi, dword ptr [esp + 0x10]
    mov esi, dword ptr [edi + 0x194]
    mov eax, dword ptr [esi + 0x18]
    test eax, eax
    lea ebx, [esi + 0x18]
    jne L0
    mov ecx, dword ptr [esi + 0x10]
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [edi + 4]
    push 1
    push ecx
    mov ecx, dword ptr [esi + 8]
    push edx
    push ecx
    push edi
    call dword ptr [eax + 0x1c]
    add esp, 0x14
    mov dword ptr [esi + 0xc], eax
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [esi + 0xc]
    mov edx, dword ptr [edi + 0x1a8]
    push ebp
    mov ebp, dword ptr [ebx]
    push eax
    mov eax, dword ptr [esp + 0x24]
    push ebx
    push ecx
    mov ecx, dword ptr [esp + 0x28]
    push eax
    mov eax, dword ptr [esp + 0x28]
    push ecx
    push eax
    push edi
    call dword ptr [edx + 4]
    mov eax, dword ptr [ebx]
    add esp, 0x1c
    cmp eax, ebp
    jbe L1
    mov edx, dword ptr [esi + 0xc]
    mov ecx, dword ptr [edi + 0x1b0]
    sub eax, ebp
    push eax
    mov dword ptr [esp + 0x18], eax
    push 0
    lea eax, [edx + ebp*4]
    push eax
    push edi
    call dword ptr [ecx + 4]
    mov eax, dword ptr [esp + 0x38]
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [esp + 0x24]
    add esp, 0x10
    add edx, ecx
    mov dword ptr [eax], edx
    mov eax, dword ptr [esi + 0x10]
    cmp dword ptr [ebx], eax
    pop ebp
    jb L2
    add dword ptr [esi + 0x14], eax
    mov dword ptr [ebx], 0
    pop edi
    pop esi
    pop ebx
    ret
FUN_10051510 ENDP
END