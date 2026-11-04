; __msize @ 0x1010977a — auto-synthesized
    EXTRN fp_1010c0ac:DWORD
    EXTRN g_1076ac94:DWORD
    EXTRN g_1076ac98:DWORD
    sub_100fb61c PROTO C
    sub_100fb6b4 PROTO C
    sub_100fc099 PROTO C
    sub_101011d5 PROTO C
    sub_10109830 PROTO C
.CODE
__msize PROC
    push 0x10
    push 0x10182530
    call sub_100fb61c
    cmp dword ptr [g_1076ac98], 3
    jne L0
    push 4
    call sub_100fc099
    pop ecx
    and dword ptr [ebp - 4], 0
    mov esi, dword ptr [ebp + 8]
    push esi
    call sub_101011d5
    pop ecx
    mov dword ptr [ebp - 0x20], eax
    test eax, eax
    je L1
    mov esi, dword ptr [esi - 4]
    sub esi, 9
    mov dword ptr [ebp - 0x1c], esi
    jmp L2
    mov esi, dword ptr [ebp - 0x1c]
    or dword ptr [ebp - 4], 0xffffffff
    call sub_10109830
    cmp dword ptr [ebp - 0x20], 0
    jne L3
    push dword ptr [ebp + 8]
    push 0
    push dword ptr [g_1076ac94]
    call dword ptr [fp_1010c0ac]
    mov esi, eax
    mov eax, esi
    call sub_100fb6b4
    ret
__msize ENDP
END