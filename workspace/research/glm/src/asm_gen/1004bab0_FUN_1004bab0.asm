; FUN_1004bab0 @ 0x1004bab0 — auto-synthesized
.CODE
FUN_1004bab0 PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [edi + 4]
    mov esi, dword ptr [edi + 0x1ac]
    push 0x400
    push 1
    push edi
    call dword ptr [eax]
    push 0x400
    mov dword ptr [esi + 8], eax
    mov ecx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [ecx]
    push 0x400
    mov dword ptr [esi + 0xc], eax
    mov edx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [edx]
    push 0x400
    mov dword ptr [esi + 0x10], eax
    mov eax, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [eax]
    add esp, 0x30
    mov dword ptr [esi + 0x14], eax
    xor eax, eax
    mov dword ptr [esp + 0x10], 0x5b6900
    mov edi, 0xff1daf00
    mov edx, 0xff4d0b80
    mov ecx, 0x2c8d00
    lea esp, [esp]
    mov ebp, dword ptr [esi + 8]
    mov ebx, edx
    sar ebx, 0x10
    mov dword ptr [eax + ebp], ebx
    mov ebp, dword ptr [esi + 0xc]
    mov ebx, edi
    sar ebx, 0x10
    mov dword ptr [eax + ebp], ebx
    mov ebp, dword ptr [esi + 0x10]
    mov ebx, dword ptr [esp + 0x10]
    mov dword ptr [eax + ebp], ebx
    mov ebp, dword ptr [esi + 0x14]
    mov dword ptr [eax + ebp], ecx
    sub ebx, 0xb6d2
    sub ecx, 0x581a
    add edx, 0x166e9
    add edi, 0x1c5a2
    add eax, 4
    cmp ecx, 0xffd4cb1a
    mov dword ptr [esp + 0x10], ebx
    jge L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_1004bab0 ENDP
END