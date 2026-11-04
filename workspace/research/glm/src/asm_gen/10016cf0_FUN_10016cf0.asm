; FUN_10016cf0 @ 0x10016cf0 — auto-synthesized
    EXTRN g_101da560:DWORD
    sub_100138e4 PROTO C
    sub_10016c4a PROTO C
.CODE
FUN_10016cf0 PROC
    push ecx
    mov eax, dword ptr [g_101da560]
    inc eax
    cmp eax, 0x100
    mov dword ptr [g_101da560], eax
    jne L0
    push 0xff
    push 0x10194458
    push 1
    call sub_100138e4
    add esp, 0xc
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [esp + 8]
    lea eax, [esp]
    push eax
    push ecx
    push edx
    call sub_10016c4a
    mov eax, dword ptr [esp + 0xc]
    mov ecx, dword ptr [esp + 0x1c]
    mov dword ptr [eax*4 + 0x101da564], ecx
    add esp, 0x10
    ret
FUN_10016cf0 ENDP
END