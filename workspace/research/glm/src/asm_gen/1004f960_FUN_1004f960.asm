; FUN_1004f960 @ 0x1004f960 — auto-synthesized
.CODE
FUN_1004f960 PROC
    mov al, byte ptr [edx + 0x50]
    test al, al
    jne L0
    mov al, byte ptr [edx + 0x112]
    test al, al
    jne L0
    mov ecx, dword ptr [edx + 0x30]
    mov eax, 3
    cmp ecx, eax
    jne L0
    cmp dword ptr [edx + 0x2c], eax
    jne L0
    cmp dword ptr [edx + 0x34], 2
    jne L0
    cmp dword ptr [edx + 0x6c], eax
    jne L0
    mov ecx, dword ptr [edx + 0xcc]
    cmp dword ptr [ecx + 8], 2
    push edi
    jne L1
    mov edi, dword ptr [ecx + 0x5c]
    mov eax, 1
    cmp edi, eax
    jne L1
    cmp dword ptr [ecx + 0xb0], eax
    jne L1
    cmp dword ptr [ecx + 0xc], 2
    jg L1
    cmp dword ptr [ecx + 0x60], eax
    jne L1
    cmp dword ptr [ecx + 0xb4], eax
    jne L1
    mov edx, dword ptr [edx + 0x120]
    cmp dword ptr [ecx + 0x24], edx
    jne L1
    cmp dword ptr [ecx + 0x78], edx
    jne L1
    cmp dword ptr [ecx + 0xcc], edx
    je L2
    xor al, al
    pop edi
    ret
    xor al, al
    ret
FUN_1004f960 ENDP
END