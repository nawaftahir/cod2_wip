; FUN_100cb9d7 @ 0x100cb9d7 — auto-synthesized
.CODE
FUN_100cb9d7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0xc]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 0x14]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [eax + 0x38]
    cmp edi, -1
    je L0
    mov edx, edi
    jmp L1
    or dword ptr [eax + 0x30], 0xffffffff
    mov edi, dword ptr [eax + 4]
    mov dword ptr [eax + 0x74], esi
    mov ebx, dword ptr [ecx + 4]
    mov ebx, dword ptr [ebx + 0x10]
    mov edi, dword ptr [ebx + edi*4]
    test byte ptr [edi + 4], 0x10
    jne L2
    cmp dword ptr [ecx + 0x10], 0
    je L3
    mov edi, dword ptr [ecx + 0xc]
    mov ebx, dword ptr [ecx + 8]
    shl esi, 2
    mov edi, dword ptr [edi + esi]
    add edi, dword ptr [ebx + esi]
    mov esi, dword ptr [ecx + 0x10]
    mov dword ptr [esi + edi*4], edx
    mov esi, dword ptr [ebp + 8]
    mov edx, dword ptr [ecx + 8]
    lea edx, [edx + esi*4]
    inc dword ptr [edx]
    mov eax, dword ptr [eax + 8]
    cmp eax, -1
    je L4
    mov edx, eax
    jmp L1
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_100cb9d7 ENDP
END