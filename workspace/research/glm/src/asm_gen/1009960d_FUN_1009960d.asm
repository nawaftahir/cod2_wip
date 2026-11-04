; FUN_1009960d @ 0x1009960d — auto-synthesized
    sub_10065092 PROTO C
    sub_10082bbf PROTO C
    sub_100995cf PROTO C
.CODE
FUN_1009960d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x10]
    push edi
    xor edi, edi
    cmp eax, edi
    je L0
    cmp dword ptr [ebp + 0xc], edi
    jne L0
    mov eax, dword ptr [eax + 0x14]
    mov dword ptr [ebp + 0xc], eax
    push 0x24
    call sub_10065092
    cmp eax, edi
    je L1
    push dword ptr [esi + 0x10]
    mov ecx, eax
    push edi
    push edi
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10082bbf
    jmp L2
    xor eax, eax
    cmp eax, edi
    jne L3
    push 0x1010c928
    push edi
    push edi
    push esi
    call sub_100995cf
    add esp, 0x10
    mov eax, 0x8007000e
    jmp L4
    mov dword ptr [esi + 0x10], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_1009960d ENDP
END