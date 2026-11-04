; _fprintf @ 0x100f6d05 — auto-synthesized
    sub_100f6da4 PROTO C
    sub_100fa519 PROTO C
    sub_100fb4d1 PROTO C
    sub_100fb580 PROTO C
    sub_100fb61c PROTO C
    sub_100fb624 PROTO C
    sub_100fb69e PROTO C
.CODE
_fprintf PROC
    push 0x14
    push 0x1017c478
    call sub_100fb61c
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0x20], esi
    push esi
    call sub_100fb4d1
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_100fb580
    mov dword ptr [ebp - 0x1c], eax
    lea eax, [ebp + 0x10]
    push eax
    push dword ptr [ebp + 0xc]
    push esi
    call sub_100fa519
    mov dword ptr [ebp - 0x24], eax
    push esi
    push dword ptr [ebp - 0x1c]
    call sub_100fb624
    add esp, 0x18
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100f6da4
    mov eax, dword ptr [ebp - 0x24]
    call sub_100fb69e
    ret
_fprintf ENDP
END