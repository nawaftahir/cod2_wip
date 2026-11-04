; FUN_1008a7ee @ 0x1008a7ee — auto-synthesized
.CODE
FUN_1008a7ee PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    mov edi, dword ptr [eax + 0x38]
    cmp edi, -1
    je L0
    mov eax, dword ptr [edx + edi*4]
    cmp dword ptr [eax + 0x54], esi
    mov edx, dword ptr [eax + 4]
    mov edi, dword ptr [ecx + 0x10]
    mov edx, dword ptr [edi + edx*4]
    jbe L1
    mov dword ptr [eax + 0x54], esi
    cmp dword ptr [eax + 0x58], esi
    jae L2
    mov dword ptr [eax + 0x58], esi
    inc dword ptr [eax + 0x5c]
    cmp dword ptr [eax + 8], -1
    je L3
    cmp dword ptr [edx + 0x28], esi
    jbe L4
    mov dword ptr [edx + 0x28], esi
    cmp dword ptr [edx + 0x2c], esi
    jae L5
    mov dword ptr [edx + 0x2c], esi
    inc dword ptr [edx + 0x30]
    mov eax, dword ptr [eax + 8]
    jmp L6
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_1008a7ee ENDP
END