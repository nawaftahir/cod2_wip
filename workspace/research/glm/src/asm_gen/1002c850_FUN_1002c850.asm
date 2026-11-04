; FUN_1002c850 @ 0x1002c850 — auto-synthesized
    EXTRN g_101d496b:DWORD
    sub_1000de46 PROTO C
    sub_1000ea99 PROTO C
    sub_1000ec51 PROTO C
.CODE
FUN_1002c850 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [eax + 0x10]
    push esi
    mov esi, dword ptr [eax + 0xc]
    push edi
    mov dword ptr [esp + 0x10], esi
    mov edi, 1
    cmp esi, 1
    jg L0
    cmp ebp, 1
    jle L1
    mov ebx, dword ptr [esp + 0x20]
    push ebp
    push ebx
    mov eax, ebx
    mov ecx, 1
    mov edx, esi
    call sub_1000de46
    mov ecx, dword ptr [esp + 0x20]
    mov eax, dword ptr [ecx]
    add esp, 8
    cmp eax, 4
    jne L2
    mov eax, dword ptr [esp + 0x1c]
    push ebx
    push edi
    push eax
    push ecx
    call sub_1000ec51
    add esp, 0x10
    jmp L3
    cmp eax, 5
    jne L4
    test edi, edi
    je L4
    mov al, byte ptr [g_101d496b]
    test al, al
    je L3
    mov ecx, dword ptr [esp + 0x1c]
    mov esi, dword ptr [esp + 0x18]
    push ebx
    push ecx
    xor ebx, ebx
    call sub_1000ea99
    mov esi, dword ptr [esp + 0x18]
    add esp, 8
    sar esi, 1
    mov edx, 1
    sub edx, esi
    mov dword ptr [esp + 0x10], 1
    jns L5
    mov dword ptr [esp + 0x10], esi
    sar ebp, 1
    mov eax, 1
    sub eax, ebp
    js L6
    mov ebp, 1
    mov esi, dword ptr [esp + 0x10]
    inc edi
    jmp L7
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_1002c850 ENDP
END