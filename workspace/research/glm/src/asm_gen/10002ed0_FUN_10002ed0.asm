; FUN_10002ed0 @ 0x10002ed0 — auto-synthesized
    sub_100f5de8 PROTO C
    sub_100f78f3 PROTO C
.CODE
FUN_10002ed0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x18]
    push esi
    mov esi, 1
    cmp ebp, esi
    mov bl, 1
    jle L0
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0x18]
    mov edx, dword ptr [ecx + esi*8]
    push eax
    push edx
    call sub_100f78f3
    add esp, 8
    test eax, eax
    je L1
    inc esi
    cmp esi, ebp
    jl L2
    jmp L0
    mov eax, dword ptr [esp + 0x18]
    mov esi, dword ptr [eax + esi*8 + 4]
    test esi, esi
    jne L3
    mov esi, dword ptr [esp + 0x14]
    xor bl, bl
    lea ecx, [edi + 8]
    push ecx
    lea eax, [edi + 4]
    push eax
    push edi
    push 0x10191928
    push esi
    mov dword ptr [edi], 0
    mov dword ptr [eax], 0
    mov dword ptr [ecx], 0
    call sub_100f5de8
    add esp, 0x14
    pop esi
    pop ebp
    mov al, bl
    pop ebx
    ret
FUN_10002ed0 ENDP
END