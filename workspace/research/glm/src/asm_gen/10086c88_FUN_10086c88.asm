; FUN_10086c88 @ 0x10086c88 — auto-synthesized
.CODE
FUN_10086c88 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    cmp edx, -1
    je L0
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x38]
    cmp eax, -1
    jne L1
    mov eax, edx
    pop ebp
    ret 4
FUN_10086c88 ENDP
END