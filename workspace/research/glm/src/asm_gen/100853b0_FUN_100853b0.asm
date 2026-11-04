; FUN_100853b0 @ 0x100853b0 — auto-synthesized
.CODE
FUN_100853b0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jne L0
    mov eax, 0x80004005
    jmp L1
    mov eax, dword ptr [eax + 0x3c]
    mov dword ptr [ecx + 0x3c], eax
    xor eax, eax
    pop ebp
    ret 4
FUN_100853b0 ENDP
END