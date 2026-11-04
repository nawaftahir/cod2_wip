; FUN_1009295e @ 0x1009295e — auto-synthesized
    sub_100926bb PROTO C
.CODE
FUN_1009295e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x14]
    cmp eax, -1
    je L0
    push -1
    push -1
    push 0
    push eax
    push dword ptr [ebp + 8]
    call sub_100926bb
    test eax, eax
    jl L1
    xor eax, eax
    pop ebp
    ret 8
FUN_1009295e ENDP
END