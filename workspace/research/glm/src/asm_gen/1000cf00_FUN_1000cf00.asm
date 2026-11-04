; FUN_1000cf00 @ 0x1000cf00 — auto-synthesized
    EXTRN g_101d1bf8:DWORD
    sub_1001393b PROTO C
    sub_100efe8f PROTO C
.CODE
FUN_1000cf00 PROC
    push ebx
    push ebp
    push edi
    push 0
    lea ebp, [esi + 4]
    push ebp
    mov ebp, dword ptr [esp + 0x24]
    push ebp
    mov ebp, dword ptr [esp + 0x24]
    push ebp
    mov ebp, dword ptr [esp + 0x24]
    push ebp
    mov ebp, dword ptr [esp + 0x24]
    mov word ptr [esi + 0x1c], ax
    mov word ptr [esi + 0x1a], cx
    push ebp
    movzx eax, ax
    mov word ptr [esi + 0x18], dx
    push eax
    movzx ecx, cx
    movzx edx, dx
    push ecx
    mov dword ptr [esi], 4
    mov edi, dword ptr [g_101d1bf8]
    mov ebx, dword ptr [edi]
    push edx
    push edi
    call dword ptr [ebx + 0x60]
    mov edi, eax
    test edi, edi
    jge L0
    push edi
    call sub_100efe8f
    movzx ecx, word ptr [esi + 0x1c]
    movzx edx, word ptr [esi + 0x1a]
    push eax
    mov eax, dword ptr [esp + 0x1c]
    push edi
    push eax
    movzx eax, word ptr [esi + 0x18]
    push 0
    push ecx
    mov ecx, dword ptr [esi + 0x20]
    push edx
    push eax
    push ecx
    push 0x10193598
    push 1
    call sub_1001393b
    add esp, 0x28
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1000cf00 ENDP
END