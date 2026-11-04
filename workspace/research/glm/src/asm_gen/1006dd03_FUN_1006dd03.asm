; FUN_1006dd03 @ 0x1006dd03 — auto-synthesized
    sub_10067d57 PROTO C
    sub_1006dc75 PROTO C
    sub_100f61dc PROTO C
.CODE
FUN_1006dd03 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x100
    lea eax, [ebp + 0x18]
    push eax
    push dword ptr [ebp + 0x14]
    lea eax, [ebp - 0x100]
    push 0x100
    push eax
    call sub_100f61dc
    mov edx, dword ptr [ebp + 8]
    add esp, 0x10
    lea eax, [ebp - 0x100]
    push eax
    push 0x10193358
    push dword ptr [ebp + 0x10]
    mov ecx, edx
    push dword ptr [ebp + 0xc]
    mov byte ptr [ebp - 1], 0
    call sub_1006dc75
    push eax
    mov eax, dword ptr [edx]
    add eax, 0x18
    push eax
    call sub_10067d57
    add esp, 0x14
    xor eax, eax
    leave
    ret
FUN_1006dd03 ENDP
END