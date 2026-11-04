; FUN_1006c382 @ 0x1006c382 — auto-synthesized
.CODE
FUN_1006c382 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ecx + 0xc]
    jae L0
    mov ecx, dword ptr [ecx + 0x18]
    mov eax, dword ptr [ecx + eax*4]
    jmp L1
    xor eax, eax
    pop ebp
    ret 4
FUN_1006c382 ENDP
END