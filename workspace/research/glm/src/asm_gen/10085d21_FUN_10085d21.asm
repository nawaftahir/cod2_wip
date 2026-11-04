; FUN_10085d21 @ 0x10085d21 — auto-synthesized
.CODE
FUN_10085d21 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jne L0
    mov eax, 0x80004005
    jmp L1
    mov edx, dword ptr [eax + 0x60]
    mov dword ptr [ecx + 0x60], edx
    mov edx, dword ptr [eax + 0x64]
    mov dword ptr [ecx + 0x64], edx
    mov edx, dword ptr [eax + 0x68]
    mov dword ptr [ecx + 0x68], edx
    mov edx, dword ptr [eax + 0x6c]
    mov dword ptr [ecx + 0x6c], edx
    mov edx, dword ptr [eax + 0x70]
    mov dword ptr [ecx + 0x70], edx
    mov eax, dword ptr [eax + 0x74]
    mov dword ptr [ecx + 0x74], eax
    xor eax, eax
    pop ebp
    ret 4
FUN_10085d21 ENDP
END