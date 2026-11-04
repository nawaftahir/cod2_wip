; FUN_100827f5 @ 0x100827f5 — auto-synthesized
.CODE
FUN_100827f5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L0
    push dword ptr [ebp + 0xc]
    mov eax, dword ptr [ecx]
    call dword ptr [eax]
    jmp L1
    xor eax, eax
    cmp dword ptr [ebp + 0xc], eax
    sete al
    pop ebp
    ret 8
FUN_100827f5 ENDP
END