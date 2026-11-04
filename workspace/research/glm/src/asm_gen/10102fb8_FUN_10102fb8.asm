; FUN_10102fb8 @ 0x10102fb8 — auto-synthesized
.CODE
FUN_10102fb8 PROC
    mov eax, dword ptr [esp + 8]
    and eax, 0x7ff00000
    cmp eax, 0x7ff00000
    je L0
    ret
    mov eax, dword ptr [esp + 8]
    ret
FUN_10102fb8 ENDP
END