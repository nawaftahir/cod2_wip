; FUN_100468d0 @ 0x100468d0 — auto-synthesized
    sub_10045e68 PROTO C
    sub_10046045 PROTO C
.CODE
FUN_100468d0 PROC
    push ebx
    push esi
    push edi
    push 0x20
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    push 1
    push esi
    call dword ptr [eax]
    mov edi, eax
    mov dword ptr [esi + 0x144], edi
    xor ebx, ebx
    add esp, 0xc
    mov dword ptr [edi], 0x10046690
    mov dword ptr [edi + 4], 0x10046820
    mov dword ptr [edi + 8], 0x10046850
    mov byte ptr [edi + 0xd], bl
    call sub_10045e68
    cmp dword ptr [esi + 0xb4], ebx
    je L0
    call sub_10046045
    jmp L1
    mov byte ptr [esi + 0xdc], bl
    mov dword ptr [esi + 0xb0], 1
    cmp byte ptr [esi + 0xdc], bl
    je L2
    mov byte ptr [esi + 0xba], 1
    cmp byte ptr [esp + 0x10], bl
    je L3
    mov dl, byte ptr [esi + 0xba]
    xor ecx, ecx
    cmp dl, bl
    sete cl
    inc ecx
    mov dword ptr [edi + 0x10], ecx
    jmp L4
    mov dword ptr [edi + 0x10], ebx
    mov dword ptr [edi + 0x1c], ebx
    mov dword ptr [edi + 0x14], ebx
    cmp byte ptr [esi + 0xba], bl
    je L5
    mov edx, dword ptr [esi + 0xb0]
    shl edx, 1
    mov dword ptr [edi + 0x18], edx
    pop edi
    pop esi
    pop ebx
    ret
    mov eax, dword ptr [esi + 0xb0]
    mov dword ptr [edi + 0x18], eax
    pop edi
    pop esi
    pop ebx
    ret
FUN_100468d0 ENDP
END