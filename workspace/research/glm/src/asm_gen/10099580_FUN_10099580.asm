; FUN_10099580 @ 0x10099580 — auto-synthesized
    sub_10067c87 PROTO C
    sub_100f61dd PROTO C
.CODE
FUN_10099580 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x100
    push esi
    lea eax, [ebp + 0x18]
    push eax
    push dword ptr [ebp + 0x14]
    lea eax, [ebp - 0x100]
    push 0x100
    push eax
    call sub_100f61dd
    mov esi, dword ptr [ebp + 8]
    lea eax, [ebp - 0x100]
    push eax
    mov eax, dword ptr [esi + 4]
    push 0x10193358
    push dword ptr [ebp + 0x10]
    add eax, 0x18
    push dword ptr [ebp + 0xc]
    mov byte ptr [ebp - 1], 0
    push eax
    call sub_10067c87
    add esp, 0x24
    xor eax, eax
    inc eax
    mov dword ptr [esi + 0x40], eax
    mov dword ptr [esi + 0x44], eax
    pop esi
    leave
    ret
FUN_10099580 ENDP
END