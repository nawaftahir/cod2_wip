; FUN_10018e80 @ 0x10018e80 — auto-synthesized
    sub_10016abc PROTO C
    sub_10016af0 PROTO C
    sub_10018d89 PROTO C
.CODE
FUN_10018e80 PROC
    push ecx
    push ebx
    push edi
    lea ebx, [esp + 8]
    call sub_10016abc
    add esp, 4
    test al, al
    je L0
    mov eax, dword ptr [esp + 4]
    mov eax, dword ptr [eax*4 + 0x101da3dc]
    test eax, eax
    jne L1
    push esi
    push edi
    call sub_10018d89
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L2
    pop esi
    pop ebx
    pop ecx
    ret
    push edi
    lea ebx, [esp + 0xc]
    call sub_10016af0
    mov ecx, dword ptr [esp + 0xc]
    add esp, 4
    mov dword ptr [ecx*4 + 0x101da3dc], esi
    mov eax, esi
    pop esi
    pop ebx
    pop ecx
    ret
FUN_10018e80 ENDP
END