; __lock_file2 @ 0x100fb4e8 — auto-synthesized
    EXTRN fp_1010c030:DWORD
    sub_100fc08f PROTO C
.CODE
__lock_file2 PROC
    mov eax, dword ptr [esp + 4]
    cmp eax, 0x14
    jge L0
    add eax, 0x10
    push eax
    call sub_100fc08f
    pop ecx
    ret
    mov eax, dword ptr [esp + 8]
    add eax, 0x20
    push eax
    call dword ptr [fp_1010c030]
    ret
__lock_file2 ENDP
END