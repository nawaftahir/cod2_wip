; __unlock_file2 @ 0x100fb53a — auto-synthesized
    EXTRN fp_1010c03c:DWORD
    sub_100fbfc2 PROTO C
.CODE
__unlock_file2 PROC
    mov eax, dword ptr [esp + 4]
    cmp eax, 0x14
    jge L0
    add eax, 0x10
    push eax
    call sub_100fbfc2
    pop ecx
    ret
    mov eax, dword ptr [esp + 8]
    add eax, 0x20
    push eax
    call dword ptr [fp_1010c03c]
    ret
__unlock_file2 ENDP
END