; R_ParseSunLight @ 0x10016f30 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101d0b00:DWORD
    sub_10016f73 PROTO C
    sub_10017069 PROTO C
.CODE
R_ParseSunLight PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 0x14]
    push esi
    push edi
    lea eax, [esp + 0xf]
    push eax
    lea ecx, [esp + 0x14]
    push ecx
    call sub_10017069
    mov al, byte ptr [esp + 0x17]
    add esp, 8
    test al, al
    je L0
    movzx edx, word ptr [esp + 0x10]
    mov eax, dword ptr [edx*4 + 0x101d4d28]
    mov edx, dword ptr [eax]
    mov esi, dword ptr [esp + 0x18]
    mov ecx, 0x11
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    mov dword ptr [eax], edx
    mov dword ptr [g_101d0b00], 1
    pop ebx
    add esp, 8
    ret
    mov eax, ebx
    lea edx, [eax + 1]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L1
    sub eax, edx
    lea ebx, [eax + 1]
    lea eax, [ebx + 0x44]
    push ebp
    push eax
    call dword ptr [fp_101d49d4]
    mov esi, dword ptr [esp + 0x20]
    mov ebp, eax
    mov ecx, 0x11
    mov edi, ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov esi, dword ptr [esp + 0x24]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebp + 0x44]
    mov dword ptr [ebp], edi
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [esp + 0x18]
    add esp, 4
    call sub_10016f73
    mov eax, ebp
    pop ebp
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
R_ParseSunLight ENDP
END