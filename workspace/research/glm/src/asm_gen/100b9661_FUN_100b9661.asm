; FUN_100b9661 @ 0x100b9661 — auto-synthesized
.CODE
FUN_100b9661 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 0x10]
    mov edx, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 8]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + esi*4]
    mov eax, dword ptr [eax + 8]
    cmp ecx, eax
    jae L0
    xor eax, eax
    inc eax
    jmp L1
    jbe L2
    or eax, 0xffffffff
    jmp L1
    cmp edx, esi
    ja L3
    sbb eax, eax
    pop esi
    pop ebp
    ret 0xc
FUN_100b9661 ENDP
END