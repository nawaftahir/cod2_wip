; ___initstdio @ 0x100fb3fc — auto-synthesized
    EXTRN g_1076adb8:DWORD
    EXTRN g_1076bdc0:DWORD
    sub_100fd7f0 PROTO C
    sub_100fd809 PROTO C
.CODE
___initstdio PROC
    mov eax, dword ptr [g_1076bdc0]
    test eax, eax
    push esi
    push 0x14
    pop esi
    jne L0
    mov eax, 0x200
    jmp L1
    cmp eax, esi
    jge L2
    mov eax, esi
    mov dword ptr [g_1076bdc0], eax
    push 4
    push eax
    call sub_100fd7f0
    test eax, eax
    pop ecx
    pop ecx
    mov dword ptr [g_1076adb8], eax
    jne L3
    push 4
    push esi
    mov dword ptr [g_1076bdc0], esi
    call sub_100fd809
    test eax, eax
    pop ecx
    pop ecx
    mov dword ptr [g_1076adb8], eax
    jne L3
    push 0x1a
    pop eax
    pop esi
    ret
    xor edx, edx
    mov ecx, 0x101a48a0
    jmp L4
    mov eax, dword ptr [g_1076adb8]
    mov dword ptr [edx + eax], ecx
    add ecx, 0x20
    add edx, 4
    cmp ecx, 0x101a4b20
    jl L5
    xor ecx, ecx
    mov edx, 0x101a48b0
    mov esi, ecx
    mov eax, ecx
    and eax, 0x1f
    sar esi, 5
    mov esi, dword ptr [esi*4 + 0x1076aca0]
    lea eax, [eax + eax*8]
    mov eax, dword ptr [esi + eax*4]
    cmp eax, -1
    je L6
    test eax, eax
    jne L7
    or dword ptr [edx], 0xffffffff
    add edx, 0x20
    inc ecx
    cmp edx, 0x101a4910
    jl L8
    xor eax, eax
    pop esi
    ret
___initstdio ENDP
END