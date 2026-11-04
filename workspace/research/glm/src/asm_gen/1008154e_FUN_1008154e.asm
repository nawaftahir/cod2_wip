; FUN_1008154e @ 0x1008154e — auto-synthesized
    sub_10080caa PROTO C
    sub_100811d0 PROTO C
.CODE
FUN_1008154e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jge L0
    neg eax
    mov dword ptr [ebp + 0xc], eax
    jmp L1
    lea ecx, [ebp + 0xc]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811d0
    test eax, eax
    jl L2
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 0xc]
    call sub_10080caa
    test eax, eax
    jne L3
    xor eax, eax
    jmp L4
    neg eax
    pop ebp
    ret 0xc
FUN_1008154e ENDP
END