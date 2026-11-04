; FUN_100814ee @ 0x100814ee — auto-synthesized
    sub_100810ba PROTO C
    sub_100811d4 PROTO C
    sub_100811f7 PROTO C
.CODE
FUN_100814ee PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jne L0
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    jge L1
    neg eax
    jmp L2
    lea ecx, [ebp + 8]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811d4
    test eax, eax
    jl L3
    mov eax, dword ptr [ebp + 8]
    neg eax
    pop ebp
    ret 0xc
    jge L4
    neg eax
    mov dword ptr [ebp + 8], eax
    jmp L5
    lea ecx, [ebp + 8]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811f7
    test eax, eax
    jl L3
    mov ecx, dword ptr [ebp + 8]
    push 1
    push dword ptr [ebp + 0x10]
    call sub_100810ba
    test eax, eax
    jne L2
    xor eax, eax
    jmp L6
FUN_100814ee ENDP
END