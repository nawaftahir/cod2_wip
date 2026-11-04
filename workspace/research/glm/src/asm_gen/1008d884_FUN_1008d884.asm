; FUN_1008d884 @ 0x1008d884 — auto-synthesized
    sub_10085565 PROTO C
    sub_100857b7 PROTO C
    sub_1008736b PROTO C
.CODE
FUN_1008d884 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    cmp dword ptr [edi + 0x48], -1
    mov esi, ecx
    je L0
    mov eax, dword ptr [ebx + 0x14]
    cmp eax, -1
    je L0
    mov ecx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 0x48]
    and dword ptr [ebp + 8], 0
    cmp eax, -1
    je L1
    mov ecx, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ecx + eax*4]
    call sub_10085565
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [edi + 0x48]
    mov ecx, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ecx + eax*4]
    call sub_100857b7
    test eax, eax
    je L0
    cmp dword ptr [ebp + 8], 0
    jne L0
    or dword ptr [edi + 0x14], 0xffffffff
    mov dword ptr [edi + 0x18], 1
    xor eax, eax
    jmp L2
    push dword ptr [ebx + 0x18]
    lea eax, [edi + 0x18]
    push dword ptr [ebx + 0x14]
    add edi, 0x14
    push eax
    push edi
    mov ecx, esi
    call sub_1008736b
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_1008d884 ENDP
END