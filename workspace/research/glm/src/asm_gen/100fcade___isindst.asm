; __isindst @ 0x100fcade — auto-synthesized
    sub_100fb61c PROTO C
    sub_100fb67f PROTO C
    sub_100fc090 PROTO C
    sub_100fc8f6 PROTO C
    sub_100fcb3f PROTO C
.CODE
__isindst PROC
    push 0xc
    push 0x1017c950
    call sub_100fb61c
    push 6
    call sub_100fc090
    pop ecx
    and dword ptr [ebp - 4], 0
    mov ebx, dword ptr [ebp + 8]
    call sub_100fc8f6
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100fcb3f
    mov eax, dword ptr [ebp - 0x1c]
    call sub_100fb67f
    ret
__isindst ENDP
END