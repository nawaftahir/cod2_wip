; FUN_10086899 @ 0x10086899 — auto-synthesized
.CODE
FUN_10086899 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 0xbc]
    mov eax, dword ptr [eax + 0x58]
    mov ecx, dword ptr [ebp + 8]
    lea ecx, [ecx + ecx*2]
    lea edx, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 0xc]
    mov edx, dword ptr [edx]
    lea ecx, [ecx + ecx*2]
    lea eax, [eax + ecx*4]
    mov eax, dword ptr [eax]
    cmp edx, eax
    jbe L0
    or eax, 0xffffffff
    jmp L1
    sbb eax, eax
    neg eax
    pop ebp
    ret 0xc
FUN_10086899 ENDP
END