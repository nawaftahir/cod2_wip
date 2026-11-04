; FUN_10063cf7 @ 0x10063cf7 — auto-synthesized
    sub_1006777b PROTO C
    sub_10067c74 PROTO C
    sub_10082341 PROTO C
.CODE
FUN_10063cf7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push dword ptr [ebp + 0x10]
    mov esi, ecx
    push 0
    push dword ptr [ebp + 0xc]
    lea ecx, [esi + 0x4c]
    push dword ptr [ebp + 8]
    call sub_10082341
    mov ebx, eax
    test ebx, ebx
    jge L0
    push 0x1010c5ac
    push 0x5e8
    push 0
    push dword ptr [ebp + 0x18]
    call sub_10067c74
    add esp, 0x10
    mov eax, ebx
    jmp L1
    push dword ptr [ebp + 0x18]
    mov ecx, dword ptr [esi + 0x54]
    push dword ptr [ebp + 0x14]
    mov eax, dword ptr [esi + 0x50]
    push 1
    push 0
    push ecx
    mov dword ptr [esi + 0x68], ecx
    push eax
    mov ecx, esi
    mov dword ptr [esi + 0x64], eax
    call sub_1006777b
    test eax, eax
    jl L1
    xor eax, eax
    pop esi
    pop ebx
    pop ebp
    ret 0x14
FUN_10063cf7 ENDP
END