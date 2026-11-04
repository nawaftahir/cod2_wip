; FUN_1004f7c0 @ 0x1004f7c0 — auto-synthesized
.CODE
FUN_1004f7c0 PROC
    mov eax, dword ptr [esi + 4]
    push ebx
    push 0xa8
    xor ebx, ebx
    push ebx
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0x19c], eax
    add esp, 0xc
    mov dword ptr [eax], 0x1004f790
    mov dword ptr [eax + 4], 0x1004f280
    mov dword ptr [eax + 8], 0x1004f600
    mov dword ptr [eax + 0x18], 0x1004f040
    mov dword ptr [eax + 0x5c], ebx
    lea ecx, [eax + 0x60]
    mov edx, 0x10
    mov edi, edi
    mov dword ptr [ecx - 0x44], 0x1004f040
    mov dword ptr [ecx], ebx
    add ecx, 4
    dec edx
    jne L0
    mov ecx, 0x1004ec80
    mov dword ptr [eax + 0x1c], ecx
    mov dword ptr [eax + 0x54], ecx
    mov eax, dword ptr [esi + 0x19c]
    mov dword ptr [esi + 0xcc], ebx
    mov dword ptr [esi + 0x84], ebx
    mov dword ptr [esi + 0x184], ebx
    mov byte ptr [eax + 0xc], bl
    mov byte ptr [eax + 0xd], bl
    mov dword ptr [eax + 0x14], ebx
    mov dword ptr [eax + 0xa0], ebx
    pop ebx
    ret
FUN_1004f7c0 ENDP
END