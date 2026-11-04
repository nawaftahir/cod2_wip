; FUN_10086e7d @ 0x10086e7d — auto-synthesized
.CODE
FUN_10086e7d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 0x14]
    xor edx, edx
    cmp eax, -1
    je L0
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 0x14]
    inc edx
    cmp eax, -1
    jne L1
    mov eax, dword ptr [ebp + 0xc]
    cmp dword ptr [eax], edx
    jae L0
    mov dword ptr [eax], edx
    pop ebp
    ret 8
FUN_10086e7d ENDP
END