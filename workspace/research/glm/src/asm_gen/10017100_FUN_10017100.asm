; FUN_10017100 @ 0x10017100 — auto-synthesized
    EXTRN g_101d1b2c:DWORD
    sub_10013919 PROTO C
    sub_10016f58 PROTO C
    sub_10016fa4 PROTO C
    sub_10017065 PROTO C
    sub_1001c77c PROTO C
    sub_10061ce7 PROTO C
.CODE
FUN_10017100 PROC
    sub esp, 8
    push ebx
    mov ebx, eax
    lea eax, [esp + 7]
    push eax
    lea ecx, [esp + 0xc]
    push ecx
    call sub_10017065
    mov al, byte ptr [esp + 0xf]
    add esp, 8
    test al, al
    je L0
    movzx edx, word ptr [esp + 8]
    mov eax, dword ptr [edx*4 + 0x101d4d28]
    pop ebx
    add esp, 8
    ret
    mov eax, dword ptr [esp + 0x10]
    push esi
    push eax
    call sub_1001c77c
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L1
    mov eax, dword ptr [g_101d1b2c]
    test eax, eax
    jne L2
    push 0x101943b8
    push esi
    call sub_10013919
    add esp, 8
    push ebx
    push 0x1019438c
    call sub_10061ce7
    mov ecx, dword ptr [g_101d1b2c]
    push ebx
    push ecx
    call sub_10016fa4
    add esp, 0x10
    pop esi
    pop ebx
    add esp, 8
    ret
    mov ecx, dword ptr [esp + 0xc]
    mov eax, esi
    call sub_10016f58
    mov eax, esi
    pop esi
    pop ebx
    add esp, 8
    ret
FUN_10017100 ENDP
END