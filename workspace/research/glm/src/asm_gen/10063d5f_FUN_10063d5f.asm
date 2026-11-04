; FUN_10063d5f @ 0x10063d5f — auto-synthesized
    sub_10067750 PROTO C
.CODE
FUN_10063d5f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    mov edx, dword ptr [ebp + 8]
    je L0
    test edx, edx
    jne L0
    mov eax, 0x8876086c
    jmp L1
    push dword ptr [ebp + 0x14]
    mov dword ptr [ecx + 0x64], edx
    push dword ptr [ebp + 0x10]
    mov dword ptr [ecx + 0x68], eax
    push 1
    push 0
    push eax
    push edx
    call sub_10067750
    test eax, eax
    jl L1
    xor eax, eax
    pop ebp
    ret 0x10
FUN_10063d5f ENDP
END