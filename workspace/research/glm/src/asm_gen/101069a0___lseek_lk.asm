; __lseek_lk @ 0x101069a0 — auto-synthesized
    EXTRN fp_1010c054:DWORD
    EXTRN fp_1010c0cc:DWORD
    sub_100fc22c PROTO C
    sub_100fc276 PROTO C
    sub_1010771b PROTO C
.CODE
__lseek_lk PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push esi
    call sub_1010771b
    cmp eax, -1
    pop ecx
    jne L0
    call sub_100fc22c
    mov dword ptr [eax], 9
    or eax, 0xffffffff
    pop esi
    ret
    push edi
    push dword ptr [esp + 0x14]
    push 0
    push dword ptr [esp + 0x18]
    push eax
    call dword ptr [fp_1010c0cc]
    mov edi, eax
    cmp edi, -1
    jne L1
    call dword ptr [fp_1010c054]
    jmp L2
    xor eax, eax
    test eax, eax
    je L3
    push eax
    call sub_100fc276
    pop ecx
    or eax, 0xffffffff
    jmp L4
    mov ecx, esi
    and esi, 0x1f
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 0x1076aca0]
    mov eax, esi
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4 + 4]
    and byte ptr [eax], 0xfd
    mov eax, edi
    pop edi
    pop esi
    ret
__lseek_lk ENDP
END