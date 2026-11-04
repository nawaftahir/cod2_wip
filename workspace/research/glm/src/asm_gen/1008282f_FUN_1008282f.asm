; FUN_1008282f @ 0x1008282f — auto-synthesized
.CODE
FUN_1008282f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 8], 0
    jne L0
    mov eax, dword ptr [ebp + 0xc]
    jmp L1
    lea eax, [ebp + 8]
    mov eax, dword ptr [eax]
    add eax, 0xc
    cmp dword ptr [eax], 0
    jne L2
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 8]
    pop ebp
    ret 8
FUN_1008282f ENDP
END