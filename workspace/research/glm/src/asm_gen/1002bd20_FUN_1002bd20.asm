; FUN_1002bd20 @ 0x1002bd20 — auto-synthesized
    sub_100f5c49 PROTO C
.CODE
FUN_1002bd20 PROC
    sub esp, 0x1c
    push 0
    push 0x101977cc
    lea eax, [esp + 8]
    push eax
    push ecx
    call sub_100f5c49
    test eax, eax
    jge L0
    xor eax, eax
    add esp, 0x1c
    ret
    mov eax, dword ptr [esp]
    xor edx, edx
    mov dword ptr [esp + 0xc], edx
    mov dword ptr [esp + 0x10], edx
    mov dword ptr [esp + 0x14], edx
    mov dword ptr [esp + 0x18], edx
    push esi
    lea edx, [esp + 0xc]
    push edx
    lea edx, [esp + 0xc]
    push edx
    lea edx, [esp + 0x18]
    push edx
    mov dword ptr [esp + 0x1c], 0x4000
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x5c]
    mov esi, eax
    mov eax, dword ptr [esp + 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [esp + 8]
    xor eax, eax
    test esi, esi
    setl al
    pop esi
    dec eax
    and eax, ecx
    add esp, 0x1c
    ret
FUN_1002bd20 ENDP
END