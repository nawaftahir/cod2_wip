; FUN_10082e0f @ 0x10082e0f — auto-synthesized
    sub_100827c4 PROTO C
.CODE
FUN_10082e0f PROC
    push 9
    mov edx, ecx
    call sub_100827c4
    xor eax, eax
    mov dword ptr [edx + 0x10], eax
    mov dword ptr [edx + 0x18], eax
    mov dword ptr [edx + 0x1c], eax
    mov dword ptr [edx + 0x20], eax
    mov dword ptr [edx], 0x1011002c
    mov dword ptr [edx + 0x14], 9
    mov eax, edx
    ret
FUN_10082e0f ENDP
END