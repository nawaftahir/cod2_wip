; FUN_10013e50 @ 0x10013e50 — auto-synthesized
    sub_10014311 PROTO C
.CODE
FUN_10013e50 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    mov esi, eax
    push edi
    mov edi, esi
    sub edi, ebx
    mov eax, edi
    sar eax, 4
    cmp eax, 1
    jle L0
    push ebp
    mov eax, esi
    mov ecx, ebx
    call sub_10014311
    sub edi, 0x10
    mov eax, edi
    sar eax, 4
    add esp, 4
    sub esi, 0x10
    cmp eax, 1
    jg L1
    pop edi
    pop esi
    pop ebp
    ret
FUN_10013e50 ENDP
END