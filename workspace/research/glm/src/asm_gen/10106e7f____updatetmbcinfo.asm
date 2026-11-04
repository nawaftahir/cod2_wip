; ___updatetmbcinfo @ 0x10106e7f — auto-synthesized
    EXTRN g_1076aa34:DWORD
    sub_100f850e PROTO C
    sub_100fb131 PROTO C
    sub_100fb61c PROTO C
    sub_100fb6ad PROTO C
    sub_100fc090 PROTO C
    sub_10106f40 PROTO C
.CODE
___updatetmbcinfo PROC
    push 0x10
    push 0x101821d0
    call sub_100fb61c
    push 0xd
    call sub_100fc090
    pop ecx
    and dword ptr [ebp - 4], 0
    call sub_100fb131
    mov edi, eax
    mov dword ptr [ebp - 0x20], edi
    mov esi, dword ptr [edi + 0x60]
    mov dword ptr [ebp - 0x1c], esi
    cmp esi, dword ptr [g_1076aa34]
    je L0
    test esi, esi
    je L1
    dec dword ptr [esi]
    jne L1
    push esi
    call sub_100f850e
    pop ecx
    mov eax, dword ptr [g_1076aa34]
    mov dword ptr [edi + 0x60], eax
    mov esi, dword ptr [g_1076aa34]
    mov dword ptr [ebp - 0x1c], esi
    inc dword ptr [esi]
    or dword ptr [ebp - 4], 0xffffffff
    call sub_10106f40
    mov eax, esi
    call sub_100fb6ad
    ret
___updatetmbcinfo ENDP
END