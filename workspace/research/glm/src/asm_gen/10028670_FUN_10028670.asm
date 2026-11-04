; FUN_10028670 @ 0x10028670 — auto-synthesized
    sub_100287e9 PROTO C
.CODE
FUN_10028670 PROC
    push ebp
    push esi
    push edi
    mov edi, ecx
    sub eax, edi
    sar eax, 3
    mov ebp, eax
    cdq
    sub eax, edx
    mov esi, eax
    sar esi, 1
    test esi, esi
    jle L0
    push ebx
    lea ebx, [edi + esi*8]
    jmp L1
    lea ecx, [ecx]
    mov eax, dword ptr [esp + 0x14]
    mov ecx, dword ptr [ebx - 4]
    mov edx, dword ptr [ebx - 8]
    push eax
    sub ebx, 8
    push ecx
    push edx
    dec esi
    push ebp
    mov eax, esi
    call sub_100287e9
    add esp, 0x10
    test esi, esi
    jg L1
    pop ebx
    pop edi
FUN_10028670 ENDP
END