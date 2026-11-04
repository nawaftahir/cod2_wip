; __onexit @ 0x1010823b — auto-synthesized
    sub_100fb61c PROTO C
    sub_100fb67c PROTO C
    sub_100fd625 PROTO C
    sub_101081b0 PROTO C
    sub_10108296 PROTO C
.CODE
__onexit PROC
    push 0xc
    push 0x101822c0
    call sub_100fb61c
    call sub_100fd625
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [ebp + 8]
    call sub_101081b0
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_10108296
    mov eax, dword ptr [ebp - 0x1c]
    call sub_100fb67c
    ret
__onexit ENDP
END