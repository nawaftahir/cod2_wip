; FUN_1009bee5 @ 0x1009bee5 — auto-synthesized
    sub_1009be4b PROTO C
.CODE
FUN_1009bee5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    fldz
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    test esi, esi
    push 5
    lea eax, [ecx + 0x20]
    pop edx
    je L0
    cmp dword ptr [esi + 4], 3
    jne L0
    lea eax, [esi + 0x10]
    mov esi, dword ptr [eax]
    dec esi
    dec esi
    je L1
    dec esi
    je L2
    dec esi
    je L3
    dec esi
    je L4
    dec esi
    je L5
    dec esi
    je L6
    dec esi
    jne L0
    push 0xc
    fstp st(0)
    pop edx
    fld qword ptr [eax + 8]
    jmp L0
    push 0xb
    jmp L7
    push 0xa
    jmp L7
    push 9
    jmp L7
    push 8
    mov edi, dword ptr [eax + 8]
    pop edx
    jmp L0
    push 4
    jmp L8
    mov esi, dword ptr [eax + 8]
    mov edx, esi
    and edx, 0xbfffffff
    or edx, 0x20000000
    shr edx, 0x1d
    mov edi, esi
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edi
    push edx
    call sub_1009be4b
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_1009bee5 ENDP
END