; FUN_1000f020 @ 0x1000f020 — auto-synthesized
    sub_1000ef53 PROTO C
    sub_1000efa9 PROTO C
.CODE
FUN_1000f020 PROC
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 0x14]
    mov esi, eax
    push esi
    mov eax, edi
    mov ecx, ebx
    call sub_1000ef53
    mov ebp, eax
    mov al, byte ptr [esp + 0x14]
    add esp, 4
    test al, 2
    jne L0
    cmp edi, 1
    jg L1
    cmp esi, 1
    jg L1
    cmp edx, 1
    jle L0
    sar edi, 1
    mov eax, 1
    sub eax, edi
    js L2
    mov edi, 1
    sar esi, 1
    mov ecx, 1
    sub ecx, esi
    js L3
    mov esi, 1
    sar edx, 1
    mov eax, 1
    sub eax, edx
    js L4
    mov edx, 1
    push esi
    mov eax, edi
    mov ecx, ebx
    call sub_1000efa9
    add esp, 4
    add ebp, eax
    jmp L5
    test byte ptr [esp + 0x10], 4
    je L6
    pop edi
    lea eax, [ebp + ebp*2]
    pop esi
    shl eax, 1
    pop ebp
    ret
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    ret
FUN_1000f020 ENDP
END