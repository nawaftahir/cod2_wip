; FUN_100b3f18 @ 0x100b3f18 — auto-synthesized
.CODE
FUN_100b3f18 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 0xc]
    push esi
    xor esi, esi
    sub ecx, eax
    mov edx, dword ptr [eax]
    cmp edx, -1
    je L0
    cmp edx, dword ptr [ecx + eax]
    jne L1
    inc esi
    add eax, 4
    cmp esi, 4
    jb L2
    xor eax, eax
    inc eax
    pop esi
    pop ebp
    ret 8
    xor eax, eax
    jmp L3
FUN_100b3f18 ENDP
END