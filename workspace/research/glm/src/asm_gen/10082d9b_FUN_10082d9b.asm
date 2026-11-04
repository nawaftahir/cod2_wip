; FUN_10082d9b @ 0x10082d9b — auto-synthesized
    sub_100827c4 PROTO C
.CODE
FUN_10082d9b PROC
    push 8
    mov edx, ecx
    call sub_100827c4
    and dword ptr [edx + 0x10], 0
    and dword ptr [edx + 0x14], 0
    mov dword ptr [edx], 0x10110020
    mov eax, edx
    ret
FUN_10082d9b ENDP
END