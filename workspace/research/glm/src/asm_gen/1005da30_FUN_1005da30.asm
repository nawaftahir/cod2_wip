; FUN_1005da30 @ 0x1005da30 — auto-synthesized
    EXTRN g_1076a83c:DWORD
    EXTRN g_1076a840:DWORD
    EXTRN g_1076a844:DWORD
    EXTRN g_1076a848:DWORD
    EXTRN g_1076a84c:DWORD
    EXTRN g_1076a850:DWORD
    EXTRN g_1076a854:DWORD
    EXTRN g_1076a858:DWORD
    EXTRN g_1076a85c:DWORD
    sub_1005dce3 PROTO C
.CODE
FUN_1005da30 PROC
    push ebx
    cmp dword ptr [g_1076a85c], 1
    je L0
    mov dword ptr [g_1076a85c], 1
    mov dword ptr [g_1076a83c], 0x1005dab8
    mov dword ptr [g_1076a840], 0x1005daeb
    mov dword ptr [g_1076a844], 0x1005db1e
    mov dword ptr [g_1076a848], 0x1005db51
    mov dword ptr [g_1076a84c], 0x1005db84
    mov dword ptr [g_1076a850], 0x1005dbb7
    mov dword ptr [g_1076a854], 0x1005dbe7
    mov dword ptr [g_1076a858], 0x1005dc17
    mov edx, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 8]
    xor eax, eax
    mov ebx, dword ptr [esp + 0xc]
    mov al, byte ptr [edx + 0x11]
    cmp al, 8
    jae sub_1005dce3
    fld dword ptr [edx]
    fld st(0)
    jmp dword ptr [eax*4 + 0x1076a83c]
FUN_1005da30 ENDP
END