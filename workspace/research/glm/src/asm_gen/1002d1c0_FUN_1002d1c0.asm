; FUN_1002d1c0 @ 0x1002d1c0 — auto-synthesized
    sub_1002d23d PROTO C
.CODE
FUN_1002d1c0 PROC
    test edx, edx
    jle sub_1002d23d
    add ecx, 0x38
    add eax, 0x18
    push edi
    jmp L0
    lea ecx, [ecx]
    mov edi, dword ptr [ecx - 8]
    mov dword ptr [eax - 0x18], edi
    mov edi, dword ptr [ecx - 4]
    mov dword ptr [eax - 0x14], edi
    mov edi, dword ptr [ecx]
    mov dword ptr [eax - 0x10], edi
    mov dword ptr [eax - 0xc], 0x3f800000
    mov edi, dword ptr [ecx - 0x38]
    mov dword ptr [eax - 8], edi
    mov edi, dword ptr [ecx - 0x34]
    mov dword ptr [eax - 4], edi
    mov edi, dword ptr [ecx - 0x30]
    mov dword ptr [eax], edi
    mov edi, dword ptr [ecx - 0x2c]
    mov dword ptr [eax + 4], edi
    mov edi, dword ptr [ecx - 0x1c]
    mov dword ptr [eax + 8], edi
    mov edi, dword ptr [ecx - 0xc]
    mov dword ptr [eax + 0xc], edi
    mov edi, dword ptr [ecx - 0x28]
    mov dword ptr [eax + 0x10], edi
    mov edi, dword ptr [ecx - 0x24]
    mov dword ptr [eax + 0x14], edi
    mov edi, dword ptr [ecx - 0x20]
    mov dword ptr [eax + 0x18], edi
    mov edi, dword ptr [ecx - 0x18]
    mov dword ptr [eax + 0x1c], edi
    mov edi, dword ptr [ecx - 0x14]
    mov dword ptr [eax + 0x20], edi
    mov edi, dword ptr [ecx - 0x10]
    mov dword ptr [eax + 0x24], edi
    add ecx, 0x40
    add eax, 0x40
    dec edx
FUN_1002d1c0 ENDP
END