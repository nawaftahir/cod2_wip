; FUN_10036040 @ 0x10036040 — auto-synthesized
    EXTRN g_101ce6d4:DWORD
    sub_10035b5e PROTO C
    sub_10035c66 PROTO C
    sub_10035fea PROTO C
.CODE
FUN_10036040 PROC
    sub esp, 0x14
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x20]
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101ce6d4]
    push edi
    mov edi, ecx
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    mov ebx, edx
    je L0
    push 1
    push esi
    push edi
    call sub_10035c66
    add esp, 0xc
    lea ecx, [esp + 0x14]
    push ecx
    push edi
    mov edx, esi
    mov eax, ebx
    mov ecx, ebp
    call sub_10035fea
    add esp, 8
    test al, al
    je L1
    mov edx, dword ptr [ebp + 4]
    mov ecx, dword ptr [esp + 0x2c]
    add ebx, 0xfffff000
    shl ebx, 5
    mov dword ptr [esp + 0x10], ebx
    fild dword ptr [esp + 0x10]
    mov ebx, dword ptr [esp + 0x30]
    add edi, 0xfffff000
    shl edi, 5
    fstp dword ptr [esp + 0x18]
    add esi, 0xfffff800
    mov dword ptr [esp + 0x10], edi
    fild dword ptr [esp + 0x10]
    shl esi, 6
    mov dword ptr [esp + 0x10], esi
    mov esi, dword ptr [esp + 0x14]
    fstp dword ptr [esp + 0x1c]
    shl esi, 3
    fild dword ptr [esp + 0x10]
    add edx, esi
    push edx
    lea edi, [esp + 0x1c]
    fstp dword ptr [esp + 0x24]
    call sub_10035b5e
    add esp, 4
    test al, al
    jne L2
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 0x14
    ret
    mov eax, dword ptr [ebp + 4]
    pop edi
    add eax, esi
    pop esi
    pop ebp
    pop ebx
    add esp, 0x14
    ret
FUN_10036040 ENDP
END