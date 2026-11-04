; FUN_1004cf60 @ 0x1004cf60 — auto-synthesized
.CODE
FUN_1004cf60 PROC
    mov eax, dword ptr [esi + 4]
    push 0xac
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0x1a0], eax
    xor ecx, ecx
    mov dword ptr [eax], 0x1004c490
    mov dword ptr [eax + 4], 0x1004cb30
    add esp, 0xc
    mov dword ptr [eax + 0x38], ecx
    mov dword ptr [eax + 0x28], ecx
    mov dword ptr [eax + 0x3c], ecx
    mov dword ptr [eax + 0x2c], ecx
    mov dword ptr [eax + 0x40], ecx
    mov dword ptr [eax + 0x30], ecx
    mov dword ptr [eax + 0x44], ecx
    mov dword ptr [eax + 0x34], ecx
    ret
FUN_1004cf60 ENDP
END