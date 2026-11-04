; __lock_file @ 0x100fb4b9 — auto-synthesized
    EXTRN fp_1010c030:DWORD
    sub_100fc09f PROTO C
.CODE
__lock_file PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, 0x101a48a0
    cmp eax, ecx
    jb L0
    cmp eax, 0x101a4b00
    ja L0
    sub eax, ecx
    sar eax, 5
    add eax, 0x10
    push eax
    call sub_100fc09f
    pop ecx
    ret
    add eax, 0x20
    push eax
    call dword ptr [fp_1010c030]
    ret
__lock_file ENDP
END