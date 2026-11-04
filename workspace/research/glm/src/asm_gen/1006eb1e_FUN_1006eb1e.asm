; FUN_1006eb1e @ 0x1006eb1e — auto-synthesized
    sub_1006de24 PROTO C
    sub_100f7882 PROTO C
    sub_100f78c2 PROTO C
.CODE
FUN_1006eb1e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0x10]
    mov eax, esi
    push edi
    shl eax, 2
    push eax
    mov edi, ecx
    call sub_100f7882
    mov ebx, eax
    test ebx, ebx
    pop ecx
    jne L0
    mov eax, 0x8007000e
    jmp L1
    push ebx
    push dword ptr [ebp + 8]
    mov ecx, edi
    call sub_1006de24
    test esi, esi
    jbe L2
    mov edx, dword ptr [ebp + 0xc]
    mov ecx, ebx
    sub edx, ebx
    mov dword ptr [ebp + 0x10], esi
    mov esi, dword ptr [edi + 8]
    mov eax, dword ptr [edx + ecx]
    mov esi, dword ptr [esi + 0x14]
    mov eax, dword ptr [esi + eax*4]
    mov esi, dword ptr [ecx]
    or dword ptr [eax], esi
    add ecx, 4
    dec dword ptr [ebp + 0x10]
    jne L3
    push ebx
    call sub_100f78c2
    pop ecx
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_1006eb1e ENDP
END