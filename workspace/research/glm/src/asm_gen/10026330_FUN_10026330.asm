; FUN_10026330 @ 0x10026330 — auto-synthesized
    EXTRN fp_101d49e0:DWORD
    sub_100146c0 PROTO C
    sub_10026140 PROTO C
    sub_100f5f2b PROTO C
.CODE
FUN_10026330 PROC
    sub esp, 0x108
    push esi
    push eax
    lea ecx, [esp + 0xc]
    push 0x10196f0c
    push ecx
    call sub_100f5f2b
    add esp, 0xc
    push 0
    push 0x200
    mov eax, 3
    mov ecx, 0x200
    call sub_10026140
    mov esi, eax
    add esp, 8
    test esi, esi
    je L0
    push esi
    push 0x200
    push 0x200
    lea edx, [esp + 0x14]
    push 0x5a
    push edx
    call sub_100146c0
    add esp, 0x14
    push esi
    call dword ptr [fp_101d49e0]
    add esp, 4
    pop esi
    add esp, 0x108
    ret
FUN_10026330 ENDP
END