; FUN_1001ed70 @ 0x1001ed70 — auto-synthesized
    sub_1001e2bf PROTO C
.CODE
FUN_1001ed70 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff0
    sub esp, 0x54
    push ebx
    mov ebx, dword ptr [eax + 0xc]
    movsx eax, word ptr [eax + 2]
    mov dword ptr [esp + 0xc], ecx
    mov ecx, dword ptr [ebp + 8]
    add ecx, edx
    test eax, eax
    push esi
    push edi
    mov dword ptr [esp + 0x1c], ecx
    jle L0
    mov dword ptr [esp + 0x18], eax
    jmp L1
    lea ebx, [ebx]
    mov edx, dword ptr [ebx + 0xc]
    mov eax, dword ptr [ebx + 0x1c]
    mov ecx, dword ptr [ebx + 0x2c]
    mov dword ptr [esp + 0x3c], edx
    mov dword ptr [esp + 0x40], eax
    lea edx, [ebx + 0x20]
    push edx
    lea eax, [ebx + 0x30]
    mov dword ptr [esp + 0x48], ecx
    push eax
    mov eax, dword ptr [esp + 0x24]
    lea esi, [ebx + 0x10]
    lea ecx, [esp + 0x28]
    mov edi, ebx
    call sub_1001e2bf
    mov eax, dword ptr [esp + 0x1c]
    mov edi, eax
    add eax, 0x40
    mov dword ptr [esp + 0x1c], eax
    mov eax, dword ptr [esp + 0x20]
    add esp, 8
    add ebx, 0x40
    mov ecx, 0x10
    lea esi, [esp + 0x20]
    dec eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [esp + 0x18], eax
    jne L1
    pop edi
FUN_1001ed70 ENDP
END