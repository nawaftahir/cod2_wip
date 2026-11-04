; FUN_10082816 @ 0x10082816 — auto-synthesized
.CODE
FUN_10082816 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    jne L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    pop ebp
    ret 4
FUN_10082816 ENDP
END