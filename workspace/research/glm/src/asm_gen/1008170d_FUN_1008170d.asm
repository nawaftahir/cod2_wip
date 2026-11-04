; FUN_1008170d @ 0x1008170d — auto-synthesized
    sub_1007ef6f PROTO C
    sub_100811ce PROTO C
.CODE
FUN_1008170d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0x10]
    test esi, esi
    jge L0
    neg esi
    jmp L1
    mov ecx, dword ptr [ebp + 8]
    lea eax, [ebp + 0x10]
    push eax
    push esi
    call sub_100811ce
    test eax, eax
    jl L2
    mov esi, dword ptr [ebp + 0x10]
    jmp L1
    mov esi, dword ptr [esi + 0x24]
    test esi, esi
    je L3
    push 0
    push 1
    lea eax, [ebp + 0x14]
    push eax
    push dword ptr [ebp + 0xc]
    push esi
    call sub_1007ef6f
    test eax, eax
    jge L4
    jmp L2
    xor eax, eax
    pop esi
    pop ebp
    ret 0x10
FUN_1008170d ENDP
END