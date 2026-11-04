; FUN_1008149e @ 0x1008149e — auto-synthesized
    sub_1007dabf PROTO C
    sub_100811e9 PROTO C
.CODE
FUN_1008149e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jne L0
    mov eax, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 8]
    cmp eax, dword ptr [ecx + 0x18]
    jae L1
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    neg eax
    pop ebp
    ret 0xc
    jge L2
    neg eax
    mov dword ptr [ebp + 8], eax
    jmp L3
    lea ecx, [ebp + 8]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811e9
    test eax, eax
    jl L1
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 8]
    call sub_1007dabf
    test eax, eax
    jne L4
    xor eax, eax
    jmp L5
FUN_1008149e ENDP
END