; shortsort @ 0x100f62a0 — auto-synthesized
    sub_100f631a PROTO C
.CODE
shortsort PROC
    mov ecx, dword ptr [esp + 4]
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push edi
    mov edi, eax
    cmp edi, ecx
    jbe sub_100f631a
    push ebx
    push esi
    lea esi, [ecx + ebp]
    cmp esi, edi
    mov ebx, ecx
    ja L0
    jmp L1
    lea ecx, [ecx]
    push ebx
    push esi
    call dword ptr [esp + 0x24]
    add esp, 8
    test eax, eax
    jle L2
    mov ebx, esi
    add esi, ebp
    cmp esi, edi
    jbe L1
    mov ecx, dword ptr [esp + 0x14]
    cmp ebx, edi
    mov eax, edi
    je L3
    test ebp, ebp
    je L3
    mov ecx, ebx
    sub ecx, edi
    mov esi, ebp
    lea esp, [esp]
    mov bl, byte ptr [eax]
    mov dl, byte ptr [ecx + eax]
    mov byte ptr [ecx + eax], bl
    mov byte ptr [eax], dl
    inc eax
    dec esi
    jne L4
    mov ecx, dword ptr [esp + 0x14]
    sub edi, ebp
    cmp edi, ecx
    ja L5
    pop esi
    pop ebx
shortsort ENDP
END