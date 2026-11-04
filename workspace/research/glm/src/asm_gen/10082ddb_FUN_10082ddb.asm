; FUN_10082ddb @ 0x10082ddb — auto-synthesized
    sub_100827e8 PROTO C
    sub_1008281e PROTO C
.CODE
FUN_10082ddb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push edx
    call sub_100827e8
    test eax, eax
    jne L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [ecx + 0x14]
    cmp eax, dword ptr [edx + 0x14]
    jne L2
    push dword ptr [edx + 0x10]
    push dword ptr [ecx + 0x10]
    call sub_1008281e
    neg eax
    sbb eax, eax
    neg eax
    pop ebp
    ret 4
FUN_10082ddb ENDP
END