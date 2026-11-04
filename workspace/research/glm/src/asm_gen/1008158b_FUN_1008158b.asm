; FUN_1008158b @ 0x1008158b — auto-synthesized
    sub_1007e6dd PROTO C
    sub_100811ce PROTO C
.CODE
FUN_1008158b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 0x10]
    test edi, edi
    jge L0
    neg edi
    jmp L1
    mov ecx, dword ptr [ebp + 8]
    lea eax, [ebp + 0x10]
    push eax
    push edi
    call sub_100811ce
    test eax, eax
    jl L2
    mov edi, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebp + 0x18]
    shr esi, 2
    jmp L3
    mov edi, dword ptr [edi + 0x24]
    test edi, edi
    je L4
    push 0
    push esi
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push edi
    call sub_1007e6dd
    test eax, eax
    jge L5
    jmp L6
    xor eax, eax
    pop esi
    pop edi
    pop ebp
    ret 0x14
FUN_1008158b ENDP
END