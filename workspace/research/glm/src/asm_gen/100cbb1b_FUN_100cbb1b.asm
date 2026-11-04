; FUN_100cbb1b @ 0x100cbb1b — auto-synthesized
.CODE
FUN_100cbb1b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov edx, eax
    sub edx, esi
    shr edx, 1
    je L0
    push ebx
    push edi
    mov edi, esi
    shl edi, 2
    lea eax, [eax*4 - 4]
    mov dword ptr [ebp + 0xc], edx
    mov edx, dword ptr [ecx + 0x3c]
    lea esi, [edi + edx]
    mov edx, dword ptr [eax + edx]
    mov ebx, dword ptr [esi]
    mov dword ptr [esi], edx
    mov edx, dword ptr [ecx + 0x3c]
    mov dword ptr [eax + edx], ebx
    add edi, 4
    sub eax, 4
    dec dword ptr [ebp + 0xc]
    jne L1
    pop edi
    pop ebx
    pop esi
    pop ebp
    ret 8
FUN_100cbb1b ENDP
END