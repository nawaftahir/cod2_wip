; FUN_10051320 @ 0x10051320 — auto-synthesized
    sub_100513d1 PROTO C
.CODE
FUN_10051320 PROC
    mov eax, dword ptr [esi + 4]
    push ebx
    push 0x40
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0x1a0], eax
    mov dword ptr [eax], 0x10050680
    xor ebx, ebx
    mov dword ptr [eax + 0x2c], ebx
    mov dword ptr [eax + 0x30], ebx
    mov dword ptr [eax + 0x34], ebx
    mov dword ptr [eax + 0x38], ebx
    mov edx, dword ptr [esi + 0x2c]
    mov ecx, dword ptr [esi + 4]
    shl edx, 8
    push edx
    push 1
    push esi
    call dword ptr [ecx]
    mov dword ptr [esi + 0x94], eax
    mov edx, eax
    mov eax, dword ptr [esi + 0x2c]
    add esp, 0x18
    cmp eax, ebx
    jle sub_100513d1
    push edi
    jmp L0
    lea esp, [esp]
    or eax, 0xffffffff
    mov edi, edx
    mov ecx, 0x40
    add edx, 0x100
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi + 0x2c]
    inc ebx
FUN_10051320 ENDP
END