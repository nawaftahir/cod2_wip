; _atol @ 0x100f73a7 — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7ccf PROTO C
    sub_100fb11b PROTO C
    sub_100fd534 PROTO C
.CODE
_atol PROC
    push esi
    push edi
    call sub_100fb11b
    mov edi, dword ptr [eax + 0x64]
    cmp edi, dword ptr [g_101a4684]
    je L0
    call sub_100f7ccf
    mov edi, eax
    mov esi, dword ptr [esp + 0xc]
    cmp dword ptr [edi + 0x28], 1
    movzx eax, byte ptr [esi]
    jle L1
    push 8
    push eax
    push edi
    call sub_100fd534
    add esp, 0xc
    jmp L2
    mov ecx, dword ptr [edi + 0x48]
    movzx eax, byte ptr [ecx + eax*2]
    and eax, 8
    test eax, eax
    je L3
    inc esi
    jmp L4
    movzx ecx, byte ptr [esi]
    inc esi
    cmp ecx, 0x2d
    mov edx, ecx
    je L5
    cmp ecx, 0x2b
    jne L6
    movzx ecx, byte ptr [esi]
    inc esi
    xor eax, eax
    cmp ecx, 0x30
    jl L7
    cmp ecx, 0x39
    jg L7
    sub ecx, 0x30
    jmp L8
    or ecx, 0xffffffff
    cmp ecx, -1
    je L9
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*2]
    movzx ecx, byte ptr [esi]
    inc esi
    jmp L10
    cmp edx, 0x2d
    pop edi
    pop esi
    jne L11
    neg eax
    ret
_atol ENDP
END