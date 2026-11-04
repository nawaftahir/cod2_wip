; FUN_1006dca1 @ 0x1006dca1 — auto-synthesized
    sub_10067c98 PROTO C
    sub_1006dc7d PROTO C
    sub_100f61e7 PROTO C
.CODE
FUN_1006dca1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x100
    push esi
    mov esi, dword ptr [ebp + 8]
    lea eax, [ebp + 0x18]
    push eax
    push dword ptr [ebp + 0x14]
    lea eax, [ebp - 0x100]
    push 0x100
    push eax
    mov dword ptr [esi + 0x4c], 1
    call sub_100f61e7
    add esp, 0x10
    lea eax, [ebp - 0x100]
    push eax
    push 0x10193358
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    push dword ptr [ebp + 0xc]
    mov byte ptr [ebp - 1], 0
    call sub_1006dc7d
    push eax
    mov eax, dword ptr [esi]
    add eax, 0x18
    push eax
    call sub_10067c98
    add esp, 0x14
    xor eax, eax
    pop esi
    leave
    ret
FUN_1006dca1 ENDP
END