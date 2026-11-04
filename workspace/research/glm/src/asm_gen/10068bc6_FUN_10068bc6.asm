; FUN_10068bc6 @ 0x10068bc6 — auto-synthesized
    EXTRN fp_1010c048:DWORD
    sub_10068b95 PROTO C
.CODE
FUN_10068bc6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_10068b95
    mov esi, dword ptr [esi + eax*4]
    jmp L0
    push dword ptr [ebp + 8]
    push dword ptr [esi]
    call dword ptr [fp_1010c048]
    test eax, eax
    je L1
    mov esi, dword ptr [esi + 0x20]
    test esi, esi
    jne L2
    xor eax, eax
    pop esi
    pop ebp
    ret 4
    mov eax, esi
    jmp L3
FUN_10068bc6 ENDP
END