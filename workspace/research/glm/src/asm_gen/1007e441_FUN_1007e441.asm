; FUN_1007e441 @ 0x1007e441 — auto-synthesized
.CODE
FUN_1007e441 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 0x18]
    mov edx, edi
    shl edx, 2
    je L0
    mov eax, dword ptr [ebp + 0x14]
    mov ecx, dword ptr [ebp + 0x10]
    push esi
    sub ecx, eax
    mov esi, edx
    xor edx, edx
    cmp dword ptr [ecx + eax], edx
    setne dl
    mov dword ptr [eax], edx
    add eax, 4
    dec esi
    jne L1
    pop esi
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push edi
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push eax
    call dword ptr [ecx + 0x180]
    pop edi
    pop ebp
    ret 0x14
FUN_1007e441 ENDP
END