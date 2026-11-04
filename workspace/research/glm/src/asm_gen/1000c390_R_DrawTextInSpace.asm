; R_DrawTextInSpace @ 0x1000c390 — auto-synthesized
    sub_1000bfbc PROTO C
    sub_1000c139 PROTO C
    sub_1000c2e7 PROTO C
    sub_1010a960 PROTO C
.CODE
R_DrawTextInSpace PROC
    sub esp, 0x414
    push esi
    mov esi, dword ptr [esp + 0x41c]
    test esi, esi
    mov dword ptr [esp + 8], 0
    je L0
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x42c]
    push edi
    jmp L1
    lea ebx, [ebx]
    lea eax, [esp + 0x13]
    push eax
    lea ecx, [esp + 0x430]
    push ecx
    push esi
    xor eax, eax
    lea ebx, [esp + 0x30]
    call sub_1000c139
    mov edx, dword ptr [esp + 0x438]
    push ebp
    mov esi, eax
    push edx
    mov eax, ebx
    push eax
    call sub_1000bfbc
    mov dword ptr [esp + 0x30], eax
    fild dword ptr [esp + 0x30]
    mov al, byte ptr [esp + 0x2b]
    add esp, 0x18
    test al, al
    fadd dword ptr [esp + 0x14]
    fstp dword ptr [esp + 0x14]
    je L2
    lea ecx, [esp + 0x18]
    push ecx
    lea edx, [esp + 0x24]
    push edx
    lea eax, [esp + 0x434]
    push eax
    push esi
    xor edi, edi
    xor ebx, ebx
    lea edx, [esp + 0x2c]
    call sub_1000c2e7
    fld dword ptr [esp + 0x2c]
    fadd dword ptr [esp + 0x24]
    add esp, 0x10
    mov esi, eax
    fstp dword ptr [esp + 0x14]
    test esi, esi
    jne L1
    pop edi
    pop ebp
    pop ebx
    fld dword ptr [esp + 8]
    call sub_1010a960
    pop esi
R_DrawTextInSpace ENDP
END