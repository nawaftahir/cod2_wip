; _fwrite @ 0x100f71e1 — auto-synthesized
    sub_100f7104 PROTO C
    sub_100f725c PROTO C
    sub_100fb4cd PROTO C
    sub_100fb61c PROTO C
    sub_100fb68c PROTO C
.CODE
_fwrite PROC
    push 0xc
    push 0x1017c498
    call sub_100fb61c
    push dword ptr [ebp + 0x14]
    call sub_100fb4cd
    pop ecx
    and dword ptr [ebp - 4], 0
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100f7104
    add esp, 0x10
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100f725c
    mov eax, dword ptr [ebp - 0x1c]
    call sub_100fb68c
    ret
_fwrite ENDP
END