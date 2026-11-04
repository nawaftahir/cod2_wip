; FUN_100515b0 @ 0x100515b0 — auto-synthesized
.CODE
FUN_100515b0 PROC
    push ebx
    mov ebx, dword ptr [esp + 8]
    push ebp
    push esi
    mov esi, dword ptr [ebx + 0x194]
    mov eax, dword ptr [esi + 0x18]
    test eax, eax
    push edi
    jne L0
    mov ecx, dword ptr [esi + 0x10]
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ebx + 4]
    push 0
    push ecx
    mov ecx, dword ptr [esi + 8]
    push edx
    push ecx
    push ebx
    call dword ptr [eax + 0x1c]
    add esp, 0x14
    mov dword ptr [esi + 0xc], eax
    mov ebp, dword ptr [esi + 0x18]
    mov edi, dword ptr [esi + 0x10]
    mov eax, dword ptr [esp + 0x2c]
    sub edi, ebp
    mov ebp, dword ptr [esp + 0x28]
    mov ecx, dword ptr [ebp]
    sub eax, ecx
    cmp edi, eax
    jbe L1
    mov edi, eax
    mov eax, dword ptr [ebx + 0x68]
    sub eax, dword ptr [esi + 0x14]
    cmp edi, eax
    jbe L2
    mov edi, eax
    mov eax, dword ptr [esp + 0x24]
    mov edx, dword ptr [ebx + 0x1b0]
    lea ecx, [eax + ecx*4]
    mov eax, dword ptr [esi + 0x18]
    push edi
    push ecx
    mov ecx, dword ptr [esi + 0xc]
    lea eax, [ecx + eax*4]
    push eax
    push ebx
    call dword ptr [edx + 4]
    add dword ptr [ebp], edi
    mov ebx, dword ptr [esi + 0x18]
    mov eax, dword ptr [esi + 0x10]
    add ebx, edi
    mov ecx, ebx
    add esp, 0x10
    cmp ecx, eax
    mov dword ptr [esi + 0x18], ebx
    jb L3
    add dword ptr [esi + 0x14], eax
    mov dword ptr [esi + 0x18], 0
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_100515b0 ENDP
END