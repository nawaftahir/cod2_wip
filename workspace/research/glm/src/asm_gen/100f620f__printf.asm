; _printf @ 0x100f620f — auto-synthesized
    sub_100f62b7 PROTO C
    sub_100fa51b PROTO C
    sub_100fb501 PROTO C
    sub_100fb582 PROTO C
    sub_100fb61c PROTO C
    sub_100fb626 PROTO C
    sub_100fb6a0 PROTO C
.CODE
_printf PROC
    push 0x10
    push 0x1017c3d8
    call sub_100fb61c
    mov esi, 0x101a48c0
    push esi
    push 1
    call sub_100fb501
    pop ecx
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_100fb582
    mov dword ptr [ebp - 0x1c], eax
    lea eax, [ebp + 0xc]
    push eax
    push dword ptr [ebp + 8]
    push esi
    call sub_100fa51b
    mov dword ptr [ebp - 0x20], eax
    push esi
    push dword ptr [ebp - 0x1c]
    call sub_100fb626
    add esp, 0x18
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100f62b7
    mov eax, dword ptr [ebp - 0x20]
    call sub_100fb6a0
    ret
_printf ENDP
END