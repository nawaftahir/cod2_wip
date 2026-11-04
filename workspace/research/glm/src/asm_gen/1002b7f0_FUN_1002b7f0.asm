; FUN_1002b7f0 @ 0x1002b7f0 — auto-synthesized
    EXTRN g_101d492c:DWORD
    EXTRN g_106a3130:DWORD
    EXTRN g_106a3134:DWORD
    sub_1002ad19 PROTO C
    sub_1002b73e PROTO C
    sub_1002b848 PROTO C
.CODE
FUN_1002b7f0 PROC
    mov al, byte ptr [g_101d492c]
    sub esp, 0xc
    test al, al
    push ebp
    mov ebp, dword ptr [esp + 0x18]
    push esi
    push edi
    jne L0
    mov ax, word ptr [ebx + 2]
    cmp ax, 0x200
    jg L0
    movsx eax, ax
    cmp eax, 0x20
    mov edi, 5
    jle L1
    lea ebx, [ebx]
    inc edi
    mov edx, 1
    mov ecx, edi
    shl edx, cl
    cmp eax, edx
    jg L2
    push edi
    mov eax, 0x10696d00
    call sub_1002ad19
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L3
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    add esp, 0xc
    ret
    mov edx, dword ptr [esp + 0x1c]
    mov ecx, edi
    mov eax, 1
    shl eax, cl
    mov ecx, dword ptr [g_106a3130]
    push 0x101daa00
    mov dword ptr [esp + 0x10], esi
    add ecx, eax
    mov eax, dword ptr [g_106a3134]
    mov dword ptr [g_106a3130], ecx
    movsx ecx, word ptr [ebx + 2]
    add eax, ecx
    mov dword ptr [g_106a3134], eax
    mov eax, dword ptr [esp + 0x28]
    lea ecx, [esp + 0x10]
    push ecx
    mov dword ptr [esi + 0xc], edx
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 4], ebp
    mov dword ptr [esp + 0x18], ebp
    mov dword ptr [esp + 0x1c], eax
    call sub_1002b73e
    add esp, 8
    mov eax, esi
    call sub_1002b848
    pop edi
    mov eax, esi
    pop esi
    pop ebp
    add esp, 0xc
    ret
FUN_1002b7f0 ENDP
END