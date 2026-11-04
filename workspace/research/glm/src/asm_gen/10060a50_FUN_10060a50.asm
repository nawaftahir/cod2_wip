; FUN_10060a50 @ 0x10060a50 — auto-synthesized
    sub_100f75fd PROTO C
    sub_100f7608 PROTO C
.CODE
FUN_10060a50 PROC
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 0x14]
    push edi
    mov edi, dword ptr [esp + 0x14]
    lea esp, [esp]
    mov bl, byte ptr [edi]
    inc edi
    cmp bl, 0x2a
    jne L0
    cmp byte ptr [edi], 0
    je L1
    cmp byte ptr [esi], 0
    je L2
    lea eax, [esi + 1]
    push eax
    lea ecx, [edi - 1]
    push ecx
    call L3
    add esp, 8
    test eax, eax
    jne L2
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    ret
    mov al, byte ptr [esi]
    inc esi
    cmp bl, al
    je L4
    cmp bl, 0x3f
    je L4
    movsx edx, al
    push edx
    call sub_100f75fd
    mov ebp, eax
    movsx eax, bl
    push eax
    call sub_100f7608
    add esp, 8
    sub eax, ebp
    jne L5
    test bl, bl
    jmp L6
    xor ecx, ecx
    test eax, eax
    setge cl
    pop edi
    pop esi
    pop ebp
    pop ebx
    lea ecx, [ecx + ecx - 1]
    mov eax, ecx
    ret
FUN_10060a50 ENDP
END