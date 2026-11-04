; __close_lk @ 0x100fcc98 — auto-synthesized
    EXTRN fp_1010c054:DWORD
    EXTRN fp_1010c084:DWORD
    sub_100fc2a0 PROTO C
    sub_101076e7 PROTO C
    sub_1010771c PROTO C
    sub_10107733 PROTO C
    sub_1010773c PROTO C
    sub_10107748 PROTO C
.CODE
__close_lk PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    push esi
    call sub_1010771c
    cmp eax, -1
    pop ecx
    je L0
    cmp esi, 1
    je L1
    cmp esi, 2
    jne L2
    push 2
    call sub_10107733
    push 1
    mov edi, eax
    call sub_1010773c
    cmp eax, edi
    pop ecx
    pop ecx
    je L0
    push esi
    call sub_10107748
    pop ecx
    push eax
    call dword ptr [fp_1010c084]
    test eax, eax
    jne L0
    call dword ptr [fp_1010c054]
    mov edi, eax
    jmp L3
    xor edi, edi
    push esi
    call sub_101076e7
    mov eax, esi
    sar eax, 5
    mov eax, dword ptr [eax*4 + 0x1076aca0]
    and esi, 0x1f
    test edi, edi
    pop ecx
    lea ecx, [esi + esi*8]
    mov byte ptr [eax + ecx*4 + 4], 0
    je L4
    push edi
    call sub_100fc2a0
    pop ecx
    or eax, 0xffffffff
    jmp L5
    xor eax, eax
    pop edi
    pop esi
    ret
__close_lk ENDP
END