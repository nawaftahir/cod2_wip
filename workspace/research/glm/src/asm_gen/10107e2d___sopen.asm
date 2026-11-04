; __sopen @ 0x10107e2d — auto-synthesized
    sub_100fb61c PROTO C
    sub_100fb68f PROTO C
    sub_10107b1e PROTO C
    sub_10107eae PROTO C
.CODE
__sopen PROC
    push 0x14
    push 0x10182290
    call sub_100fb61c
    and dword ptr [ebp - 0x1c], 0
    and dword ptr [ebp - 4], 0
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    lea eax, [ebp - 0x20]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    mov ecx, dword ptr [ebp + 0x10]
    call sub_10107b1e
    add esp, 0x14
    mov dword ptr [ebp - 0x24], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_10107eae
    mov eax, dword ptr [ebp - 0x24]
    call sub_100fb68f
    ret
__sopen ENDP
END