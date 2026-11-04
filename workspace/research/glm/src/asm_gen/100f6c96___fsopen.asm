; __fsopen @ 0x100f6c96 — auto-synthesized
    sub_100f6d31 PROTO C
    sub_100fb61c PROTO C
    sub_100fb69c PROTO C
    sub_100fc0e8 PROTO C
    sub_100fc233 PROTO C
    sub_100fc2ac PROTO C
.CODE
__fsopen PROC
    push 0x10
    push 0x1017c468
    call sub_100fb61c
    call sub_100fc2ac
    mov dword ptr [ebp - 0x1c], eax
    test eax, eax
    jne L0
    call sub_100fc233
    mov dword ptr [eax], 0x18
    xor eax, eax
    jmp L1
    and dword ptr [ebp - 4], 0
    push eax
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fc0e8
    add esp, 0x10
    mov dword ptr [ebp - 0x20], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100f6d31
    mov eax, dword ptr [ebp - 0x20]
    call sub_100fb69c
    ret
__fsopen ENDP
END