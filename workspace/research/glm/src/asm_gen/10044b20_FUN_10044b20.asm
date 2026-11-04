; FUN_10044b20 @ 0x10044b20 — auto-synthesized
.CODE
FUN_10044b20 PROC
    mov eax, dword ptr [esi + 4]
    push 0x6c
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0x164], eax
    xor ecx, ecx
    mov dword ptr [eax], 0x10043c60
    add esp, 0xc
    mov dword ptr [eax + 0x3c], ecx
    mov dword ptr [eax + 0x2c], ecx
    mov dword ptr [eax + 0x5c], ecx
    mov dword ptr [eax + 0x4c], ecx
    mov dword ptr [eax + 0x40], ecx
    mov dword ptr [eax + 0x30], ecx
    mov dword ptr [eax + 0x60], ecx
    mov dword ptr [eax + 0x50], ecx
    mov dword ptr [eax + 0x44], ecx
    mov dword ptr [eax + 0x34], ecx
    mov dword ptr [eax + 0x64], ecx
    mov dword ptr [eax + 0x54], ecx
    mov dword ptr [eax + 0x48], ecx
    mov dword ptr [eax + 0x38], ecx
    mov dword ptr [eax + 0x68], ecx
    mov dword ptr [eax + 0x58], ecx
    ret
FUN_10044b20 ENDP
END