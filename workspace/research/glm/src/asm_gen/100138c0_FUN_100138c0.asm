; FUN_100138c0 @ 0x100138c0 — auto-synthesized
    EXTRN fp_101d49cc:DWORD
    EXTRN fp_101d4b88:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d492d:DWORD
    sub_100f6202 PROTO C
.CODE
FUN_100138c0 PROC
    sub esp, 0x400
    call dword ptr [fp_101d4b88]
    mov al, byte ptr [g_101d492d]
    test al, al
    je L0
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xa8]
    mov byte ptr [g_101d492d], 0
    mov eax, dword ptr [esp + 0x408]
    lea edx, [esp + 0x40c]
    push edx
    push eax
    lea ecx, [esp + 8]
    push 0x3ff
    push ecx
    call sub_100f6202
    mov eax, dword ptr [esp + 0x414]
    lea edx, [esp + 0x10]
    push edx
    push 0x10193358
    push eax
    mov byte ptr [esp + 0x41b], 0
    call dword ptr [fp_101d49cc]
    add esp, 0x41c
    ret
FUN_100138c0 ENDP
END