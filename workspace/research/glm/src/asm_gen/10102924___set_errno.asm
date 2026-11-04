; __set_errno @ 0x10102924 — auto-synthesized
    sub_100fc22b PROTO C
    sub_100fc237 PROTO C
.CODE
__set_errno PROC
    mov eax, dword ptr [esp + 4]
    cmp eax, 1
    je L0
    jle L1
    cmp eax, 3
    jg L1
    call sub_100fc22b
    mov dword ptr [eax], 0x22
    ret
    call sub_100fc237
    mov dword ptr [eax], 0x21
    ret
__set_errno ENDP
END