; __mtterm @ 0x100fb0e4 — auto-synthesized
    EXTRN fp_101addc4:DWORD
    EXTRN g_101a4898:DWORD
    sub_100fbf78 PROTO C
.CODE
__mtterm PROC
    mov eax, dword ptr [g_101a4898]
    cmp eax, -1
    je L0
    push eax
    call dword ptr [fp_101addc4]
    or dword ptr [g_101a4898], 0xffffffff
    jmp sub_100fbf78
__mtterm ENDP
END