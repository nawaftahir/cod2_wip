; FUN_100c445e @ 0x100c445e — auto-synthesized
    sub_1008b0ec PROTO C
.CODE
FUN_100c445e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov edx, dword ptr [ebp + 0xc]
    mov dword ptr [eax], 1
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 0xc]
    mov dword ptr [edx], eax
    cmp eax, dword ptr [ecx + 0x28]
    jb L0
    mov eax, dword ptr [ecx + 0x100]
    push 0x10119ea8
    push 0x119a
    push dword ptr [eax + 0x3c]
    push ecx
    call sub_1008b0ec
    add esp, 0x10
    mov eax, 0x80004005
    jmp L1
    xor eax, eax
    pop ebp
    ret 0xc
FUN_100c445e ENDP
END