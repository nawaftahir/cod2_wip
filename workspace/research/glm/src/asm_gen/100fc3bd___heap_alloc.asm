; __heap_alloc @ 0x100fc3bd — auto-synthesized
    EXTRN fp_1010c130:DWORD
    EXTRN g_1076ac70:DWORD
    EXTRN g_1076ac94:DWORD
    EXTRN g_1076ac98:DWORD
    sub_100fb61c PROTO C
    sub_100fb6b9 PROTO C
    sub_100fc0a4 PROTO C
    sub_100fc46e PROTO C
    sub_10101e01 PROTO C
.CODE
__heap_alloc PROC
    push 0xc
    push 0x1017c910
    call sub_100fb61c
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [g_1076ac98], 3
    jne L0
    cmp esi, dword ptr [g_1076ac70]
    ja L0
    push 4
    call sub_100fc0a4
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_10101e01
    pop ecx
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100fc46e
    mov eax, dword ptr [ebp - 0x1c]
    test eax, eax
    jne L1
    test esi, esi
    jne L2
    inc esi
    cmp dword ptr [g_1076ac98], 1
    je L3
    add esi, 0xf
    and esi, 0xfffffff0
    push esi
    push 0
    push dword ptr [g_1076ac94]
    call dword ptr [fp_1010c130]
    call sub_100fb6b9
    ret
__heap_alloc ENDP
END