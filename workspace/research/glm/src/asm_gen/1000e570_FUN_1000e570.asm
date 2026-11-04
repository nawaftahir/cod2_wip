; FUN_1000e570 @ 0x1000e570 — auto-synthesized
    sub_1000e6a1 PROTO C
.CODE
FUN_1000e570 PROC
    sub eax, edi
    sar eax, 2
    push ebx
    mov ebx, eax
    cdq
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    sub eax, edx
    push esi
    mov esi, eax
    sar esi, 1
    test esi, esi
    jle L0
    lea esp, [esp]
    mov eax, dword ptr [edi + esi*4 - 4]
    dec esi
    push ebp
    push eax
    push ebx
    mov eax, esi
    mov ecx, edi
    call sub_1000e6a1
    add esp, 0xc
    test esi, esi
    jg L1
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1000e570 ENDP
END