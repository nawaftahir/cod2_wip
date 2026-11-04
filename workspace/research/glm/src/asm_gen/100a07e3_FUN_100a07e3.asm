; FUN_100a07e3 @ 0x100a07e3 — auto-synthesized
    sub_10099adf PROTO C
    sub_1009ca39 PROTO C
    sub_100a06c8 PROTO C
.CODE
FUN_100a07e3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_100a06c8
    mov edx, eax
    test edx, edx
    je L0
    mov eax, dword ptr [edx + 0x10]
    test eax, eax
    je L0
    cmp dword ptr [eax + 4], 9
    jne L0
    push eax
    mov ecx, esi
    call sub_10099adf
    test eax, eax
    je L0
    lea eax, [edx + 0x30]
    push eax
    mov eax, dword ptr [edx + 0x20]
    mov eax, dword ptr [eax + 8]
    add eax, 0x10
    push eax
    push dword ptr [ebp + 0xc]
    mov ecx, esi
    call sub_1009ca39
    test eax, eax
    jl L1
    xor eax, eax
    jmp L1
    mov eax, 0x80004005
    pop esi
    pop ebp
    ret 8
FUN_100a07e3 ENDP
END