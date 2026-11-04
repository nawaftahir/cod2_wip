; FUN_10099533 @ 0x10099533 — auto-synthesized
    sub_10067d4d PROTO C
    sub_100f61dc PROTO C
.CODE
FUN_10099533 PROC
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
    lea eax, [ebp - 0x100]
    push eax
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 4]
    push 0x10193358
    push dword ptr [ebp + 0x10]
    add eax, 0x18
    push dword ptr [ebp + 0xc]
    mov byte ptr [ebp - 1], 0
    push eax
    call sub_10067d4d
    add esp, 0x24
    leave
    ret
FUN_10099533 ENDP
END