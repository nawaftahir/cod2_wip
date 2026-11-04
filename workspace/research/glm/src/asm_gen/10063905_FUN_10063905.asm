; FUN_10063905 @ 0x10063905 — auto-synthesized
    sub_100638c3 PROTO C
    sub_10082214 PROTO C
    sub_10082303 PROTO C
    sub_100f7893 PROTO C
.CODE
FUN_10063905 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 8], 0
    jne L0
    mov eax, 0x8876086c
    jmp L1
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    test ebx, ebx
    jne L2
    mov eax, 0x8876086c
    jmp L3
    push esi
    push 0x14
    call sub_100f7893
    test eax, eax
    pop ecx
    je L4
    mov ecx, eax
    call sub_10082303
    mov esi, eax
    jmp L5
    xor esi, esi
    test esi, esi
    jne L6
    mov eax, 0x8007000e
    jmp L7
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10082214
    mov edi, eax
    test edi, edi
    jge L8
    push 1
    mov ecx, esi
    call sub_100638c3
    mov eax, edi
    jmp L9
    mov dword ptr [ebx], esi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_10063905 ENDP
END