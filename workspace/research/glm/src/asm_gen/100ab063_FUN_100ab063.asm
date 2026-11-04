; FUN_100ab063 @ 0x100ab063 — auto-synthesized
.CODE
FUN_100ab063 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 0x1c]
    and dword ptr [ebp - 4], 0
    and dword ptr [eax], 0
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [ebp + 0xc]
    cmp ecx, dword ptr [ebp + 0x10]
    jae L0
    push ebx
    push esi
    push edi
    mov edx, dword ptr [ebp + 8]
    mov edi, dword ptr [edx + ecx*4]
    xor ebx, ebx
    cmp edi, ebx
    je L1
    cmp dword ptr [edi + 4], ebx
    jbe L1
    mov edx, dword ptr [edi + 8]
    mov esi, dword ptr [edx + ebx*4]
    cmp esi, dword ptr [ebp + 0x14]
    mov edx, dword ptr [ebp - 8]
    mov edx, dword ptr [edx + 0x14]
    mov edx, dword ptr [edx + esi*4]
    je L2
    mov esi, dword ptr [ebp + 0x14]
    cmp dword ptr [edx + 0x38], esi
    jne L3
    mov esi, dword ptr [ebp + 0x18]
    mov esi, dword ptr [esi + 0xc]
    mov dword ptr [edx + 0xc], esi
    mov esi, dword ptr [ebp + 0x18]
    mov esi, dword ptr [esi + 0x10]
    mov dword ptr [edx + 0x10], esi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [eax], 1
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L4
    inc ecx
    cmp ecx, dword ptr [ebp + 0x10]
    jb L5
    pop edi
    pop esi
    pop ebx
    mov eax, dword ptr [ebp - 4]
    leave
    ret 0x18
FUN_100ab063 ENDP
END