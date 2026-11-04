; FUN_10016960 @ 0x10016960 — auto-synthesized
    EXTRN g_101d92d0:DWORD
    sub_100138de PROTO C
    sub_1001690b PROTO C
.CODE
FUN_10016960 PROC
    push ecx
    cmp dword ptr [g_101d92d0], 0x3ff
    jne L0
    push 0x3ff
    push 0x10194488
    push 1
    call sub_100138de
    add esp, 0xc
    push ebx
    lea ebx, [esp + 4]
    call sub_1001690b
    mov eax, dword ptr [g_101d92d0]
    mov ecx, dword ptr [esp + 0xc]
    inc eax
    mov dword ptr [g_101d92d0], eax
    mov eax, dword ptr [esp + 4]
    mov dword ptr [eax*4 + 0x101d92d4], ecx
    pop ebx
    pop ecx
    ret
FUN_10016960 ENDP
END