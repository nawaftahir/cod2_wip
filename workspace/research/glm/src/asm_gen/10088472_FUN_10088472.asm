; FUN_10088472 @ 0x10088472 — auto-synthesized
    sub_10088450 PROTO C
.CODE
FUN_10088472 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [ebp + 8]
    mov esi, dword ptr [ecx]
    mov eax, dword ptr [ecx + 4]
    and esi, 0xfffff
    xor edx, edx
    div esi
    and dword ptr [ebp - 4], 0
    test eax, eax
    mov dword ptr [ebp - 0xc], eax
    jbe L0
    mov eax, dword ptr [ecx + 8]
    mov ebx, dword ptr [edi + 0x14]
    mov ecx, esi
    shl ecx, 2
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [ebp + 0x10]
    lea ecx, [eax + ecx*4]
    mov dword ptr [ebp + 8], ecx
    mov ecx, dword ptr [ebp + 0xc]
    lea esi, [eax + ecx*4]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi]
    mov dword ptr [ebp + 0x10], eax
    mov eax, dword ptr [ebx + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [edi + 0x10]
    mov edx, dword ptr [eax + edx*4]
    test byte ptr [edx + 4], 0x40
    je L1
    mov edx, dword ptr [ebp + 0x10]
    mov edx, dword ptr [ebx + edx*4]
    mov edx, dword ptr [edx + 4]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 4], 0x40
    je L1
    push dword ptr [ebp + 0x10]
    push ecx
    mov ecx, edi
    call sub_10088450
    test eax, eax
    je L2
    mov eax, dword ptr [ebp - 8]
    inc dword ptr [ebp - 4]
    add dword ptr [ebp + 8], eax
    add esi, eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 0xc]
    jb L3
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    xor eax, eax
    inc eax
    jmp L4
FUN_10088472 ENDP
END