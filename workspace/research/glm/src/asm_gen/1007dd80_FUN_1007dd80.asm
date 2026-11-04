; FUN_1007dd80 @ 0x1007dd80 — auto-synthesized
.CODE
FUN_1007dd80 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0x18]
    mov edx, esi
    shl edx, 2
    je L0
    mov eax, dword ptr [ebp + 0x14]
    mov ecx, dword ptr [ebp + 0x10]
    sub ecx, eax
    fild dword ptr [ecx + eax]
    fstp dword ptr [eax]
    add eax, 4
    dec edx
    jne L1
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push esi
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push eax
    call dword ptr [ecx + 0x1b4]
    pop esi
    pop ebp
    ret 0x14
FUN_1007dd80 ENDP
END