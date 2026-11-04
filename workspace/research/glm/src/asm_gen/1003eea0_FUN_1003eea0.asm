; FUN_1003eea0 @ 0x1003eea0 — auto-synthesized
    EXTRN g_10730550:DWORD
    sub_1003deab PROTO C
.CODE
FUN_1003eea0 PROC
    mov eax, dword ptr [g_10730550]
    mov edx, dword ptr [ecx + 8]
    imul eax, eax, 0xcd0
    add eax, 0x1072def0
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 0xc]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 0x10]
    mov dword ptr [eax + 8], edx
    xor edx, edx
    mov dword ptr [eax + 0xc], edx
    push esi
    mov esi, dword ptr [ecx + 0x14]
    mov dword ptr [eax + 0x10], esi
    mov esi, dword ptr [ecx + 0x18]
    mov dword ptr [eax + 0x14], esi
    mov esi, dword ptr [ecx + 0x1c]
    mov dword ptr [eax + 0x18], esi
    mov dword ptr [eax + 0x1c], edx
    mov esi, dword ptr [ecx + 0x20]
    mov dword ptr [eax + 0x20], esi
    mov esi, dword ptr [ecx + 0x24]
    mov dword ptr [eax + 0x24], esi
    mov esi, dword ptr [ecx + 0x28]
    mov dword ptr [eax + 0x28], esi
    mov dword ptr [eax + 0x2c], edx
    mov edx, dword ptr [ecx + 0x2c]
    mov dword ptr [eax + 0x30], edx
    mov edx, dword ptr [ecx + 0x30]
    mov dword ptr [eax + 0x34], edx
    mov ecx, dword ptr [ecx + 0x34]
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 0x38], ecx
    mov dword ptr [eax + 0x3c], 0x3f800000
    mov eax, dword ptr [edx + 0x38]
    pop esi
    mov dword ptr [esp + 4], eax
    jmp sub_1003deab
FUN_1003eea0 ENDP
END