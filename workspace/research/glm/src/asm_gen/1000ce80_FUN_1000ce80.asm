; FUN_1000ce80 @ 0x1000ce80 — auto-synthesized
    EXTRN g_101d1bf8:DWORD
    sub_1001392b PROTO C
    sub_100efe88 PROTO C
.CODE
FUN_1000ce80 PROC
    push ebp
    push edi
    push 0
    lea ebp, [esi + 4]
    push ebp
    mov ebp, dword ptr [esp + 0x1c]
    push ebp
    mov ebp, dword ptr [esp + 0x1c]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x20]
    mov word ptr [esi + 0x1a], ax
    mov word ptr [esi + 0x18], cx
    push ebp
    movzx eax, ax
    movzx ecx, cx
    push eax
    mov word ptr [esi + 0x1c], 1
    mov dword ptr [esi], 3
    mov edx, dword ptr [g_101d1bf8]
    mov edi, dword ptr [edx]
    push ecx
    push edx
    call dword ptr [edi + 0x5c]
    mov edi, eax
    test edi, edi
    jge L0
    push edi
    call sub_100efe88
    movzx edx, word ptr [esi + 0x1a]
    mov ecx, dword ptr [esi + 0x20]
    push eax
    movzx eax, word ptr [esi + 0x18]
    push edi
    push ebx
    push 0
    push edx
    push eax
    push ecx
    push 0x101935d4
    push 1
    call sub_1001392b
    add esp, 0x24
    pop edi
    pop ebp
    ret
FUN_1000ce80 ENDP
END