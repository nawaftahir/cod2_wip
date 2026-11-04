; FUN_100850af @ 0x100850af — auto-synthesized
    sub_10065b05 PROTO C
    sub_10065c5b PROTO C
    sub_10067067 PROTO C
    sub_1006770e PROTO C
    sub_1006775f PROTO C
    sub_10084998 PROTO C
.CODE
FUN_100850af PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x2b0
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x1c]
    test edi, edi
    je L0
    and dword ptr [edi], 0
    lea ecx, [ebp - 0x2b0]
    call sub_10065b05
    push dword ptr [ebp + 0x14]
    lea ecx, [ebp - 0x2b0]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10067067
    mov esi, eax
    test esi, esi
    jl L1
    push dword ptr [ebp + 0x20]
    lea eax, [ebp - 0x2b0]
    push edi
    push dword ptr [ebp + 0x18]
    push eax
    call sub_10084998
    mov esi, eax
    test esi, esi
    jl L1
    lea ecx, [ebp - 0x298]
    call sub_1006775f
    test eax, eax
    je L1
    mov esi, 0x88760b59
    cmp dword ptr [ebp + 0x20], 0
    je L2
    push dword ptr [ebp + 0x20]
    lea ecx, [ebp - 0x298]
    call sub_1006770e
    lea ecx, [ebp - 0x2b0]
    call sub_10065c5b
    pop edi
    mov eax, esi
    pop esi
    leave
    ret 0x1c
FUN_100850af ENDP
END