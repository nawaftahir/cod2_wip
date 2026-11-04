; FUN_10068d02 @ 0x10068d02 — auto-synthesized
    sub_10067c78 PROTO C
    sub_10067d6a PROTO C
.CODE
FUN_10068d02 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    and eax, 0xffff
    dec eax
    je L0
    dec eax
    je L1
    sub eax, 3
    je L0
    dec eax
    jne L2
    mov eax, dword ptr [ebp + 0x14]
    push esi
    push dword ptr [ebp + 0x18]
    mov esi, dword ptr [ebp + 0x1c]
    push 0x10193358
    add eax, 0x1388
    push eax
    push dword ptr [esi + 0x30]
    push dword ptr [esi]
    call sub_10067c78
    add esp, 0x14
    mov dword ptr [esi + 0x4c], 1
    pop esi
    jmp L2
    push dword ptr [ebp + 0x18]
    mov eax, dword ptr [ebp + 0x14]
    push 0x10193358
    add eax, 0x1388
    push eax
    mov eax, dword ptr [ebp + 0x1c]
    push dword ptr [eax + 0x30]
    push dword ptr [eax]
    call sub_10067d6a
    add esp, 0x14
    xor eax, eax
    pop ebp
    ret 0x18
FUN_10068d02 ENDP
END