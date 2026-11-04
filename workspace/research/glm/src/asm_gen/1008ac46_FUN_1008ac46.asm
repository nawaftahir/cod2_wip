; FUN_1008ac46 @ 0x1008ac46 — auto-synthesized
.CODE
FUN_1008ac46 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [ebp + 8]
    cmp dword ptr [ebp + 0x10], 0
    mov eax, dword ptr [edi + 0x18]
    mov edx, dword ptr [edi + 0x14]
    mov eax, dword ptr [eax + ebx*4]
    mov esi, dword ptr [edx + ecx*4]
    je L0
    mov ecx, dword ptr [esi + 4]
    mov edx, dword ptr [edi + 0x10]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 4], 2
    je L0
    mov ecx, dword ptr [eax + 0x18]
    test ecx, ecx
    je L1
    mov ebx, dword ptr [esi + 0x48]
    mov edx, dword ptr [eax + 0x14]
    mov dword ptr [ecx + edx*4], ebx
    mov ebx, dword ptr [ebp + 0xc]
    inc dword ptr [eax + 0x14]
    mov ecx, dword ptr [edi + 0x18]
    mov eax, dword ptr [esi + 0x48]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 0x20]
    test ecx, ecx
    je L2
    mov edx, dword ptr [eax + 0x1c]
    mov dword ptr [ecx + edx*4], ebx
    inc dword ptr [eax + 0x1c]
    mov eax, dword ptr [esi + 8]
    cmp eax, -1
    je L3
    push 1
    push ebx
    push eax
    mov ecx, edi
    call L4
    mov esi, dword ptr [esi + 0x14]
    cmp esi, -1
    je L5
    mov dword ptr [ebp + 0x10], 1
    mov ecx, esi
    jmp L6
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_1008ac46 ENDP
END