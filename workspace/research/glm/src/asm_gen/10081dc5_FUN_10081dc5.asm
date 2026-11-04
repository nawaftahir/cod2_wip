; FUN_10081dc5 @ 0x10081dc5 — auto-synthesized
    sub_10081db6 PROTO C
    sub_100f7886 PROTO C
.CODE
FUN_10081dc5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    test ebx, ebx
    jne L0
    mov eax, 0x8876086c
    jmp L1
    push esi
    push 0x18
    call sub_100f7886
    test eax, eax
    pop ecx
    je L2
    mov ecx, eax
    call sub_10081db6
    mov esi, eax
    jmp L3
    xor esi, esi
    test esi, esi
    jne L4
    mov eax, 0x8007000e
    jmp L5
    mov eax, dword ptr [esi]
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call dword ptr [eax + 0x18]
    mov edi, eax
    test edi, edi
    jge L6
    mov eax, dword ptr [esi]
    push 1
    mov ecx, esi
    call dword ptr [eax + 0x14]
    mov eax, edi
    jmp L7
    mov dword ptr [ebx], esi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_10081dc5 ENDP
END