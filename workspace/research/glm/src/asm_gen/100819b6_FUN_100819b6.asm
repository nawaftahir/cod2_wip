; FUN_100819b6 @ 0x100819b6 — auto-synthesized
    sub_10080464 PROTO C
    sub_100811ce PROTO C
.CODE
FUN_100819b6 PROC
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
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push esi
    call sub_10080464
    test eax, eax
    jge L4
    jmp L2
    xor eax, eax
    pop esi
    pop ebp
    ret 0x14
FUN_100819b6 ENDP
END