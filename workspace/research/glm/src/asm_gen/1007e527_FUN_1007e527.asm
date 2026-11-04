; FUN_1007e527 @ 0x1007e527 — auto-synthesized
.CODE
FUN_1007e527 PROC
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
    mov dword ptr [ebp + 0x18], edx
    fild dword ptr [ebp + 0x18]
    fstp dword ptr [eax]
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
    call dword ptr [ecx + 0x178]
    pop edi
    pop ebp
    ret 0x14
FUN_1007e527 ENDP
END