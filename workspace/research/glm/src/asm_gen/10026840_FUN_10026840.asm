; FUN_10026840 @ 0x10026840 — auto-synthesized
    EXTRN g_101d4928:DWORD
    sub_1002661d PROTO C
.CODE
FUN_10026840 PROC
    mov cx, word ptr [g_101d4928]
    movzx eax, cx
    push edi
    xor edi, edi
    test eax, eax
    jle L0
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x18]
    push esi
    xor esi, esi
    test eax, eax
    jle L1
    mov edi, edi
    imul eax, edi
    add eax, esi
    lea ebx, [eax*4 + 0x12]
    mov eax, dword ptr [esp + 0x18]
    push ebp
    push eax
    mov eax, dword ptr [esp + 0x1c]
    push edi
    push esi
    call sub_1002661d
    mov ecx, dword ptr [esp + 0x30]
    mov byte ptr [ecx + ebx + 3], al
    mov cx, word ptr [g_101d4928]
    add esp, 0x10
    movzx eax, cx
    inc esi
    cmp esi, eax
    jl L2
    movzx eax, cx
    inc edi
    cmp edi, eax
    jl L3
    pop esi
    pop ebp
    pop ebx
    pop edi
    ret
FUN_10026840 ENDP
END