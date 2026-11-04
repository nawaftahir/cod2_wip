; FUN_1007d48d @ 0x1007d48d — auto-synthesized
    sub_1007cfe0 PROTO C
.CODE
FUN_1007d48d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0x20]
    xor eax, eax
    cmp esi, eax
    je L0
    mov dword ptr [esi], eax
    mov edx, dword ptr [ebp + 0x24]
    cmp edx, eax
    je L1
    mov dword ptr [edx], eax
    cmp dword ptr [ebp + 0x10], eax
    jne L2
    mov eax, 0x8876086c
    jmp L3
    push edx
    push esi
    push dword ptr [ebp + 0x1c]
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push eax
    push eax
    push eax
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_1007cfe0
    pop esi
    pop ebp
    ret 0x20
FUN_1007d48d ENDP
END