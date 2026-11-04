; FUN_1002cd00 @ 0x1002cd00 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    sub_10010b9b PROTO C
    sub_1002cb89 PROTO C
    sub_10060ccf PROTO C
.CODE
FUN_1002cd00 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov eax, dword ptr [ebp + 0xc]
    imul eax, dword ptr [ebp + 0x10]
    push esi
    push edi
    mov dword ptr [esp + 0x10], eax
    shl eax, 3
    mov ecx, 0x11
    mov esi, ebp
    mov edi, ebx
    push eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call dword ptr [fp_101d49d4]
    mov ecx, dword ptr [esp + 0x14]
    lea edx, [ecx*4]
    push edx
    mov dword ptr [ebx + 4], eax
    call dword ptr [fp_101d49d4]
    add esp, 8
    mov esi, ebx
    mov dword ptr [ebx + 8], eax
    call sub_1002cb89
    mov ecx, dword ptr [esp + 0x14]
    xor eax, eax
    mov ax, word ptr [ebp + 0xc]
    push eax
    push ecx
    push 0x10197940
    call sub_10060ccf
    mov di, word ptr [ebp + 0x10]
    add esp, 8
    call sub_10010b9b
    add esp, 4
    pop edi
    pop esi
    mov dword ptr [ebx + 0x40], eax
    pop ebp
    ret
FUN_1002cd00 ENDP
END