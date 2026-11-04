; __allmul @ 0x100fd5b0 — auto-synthesized
.CODE
__allmul PROC
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [esp + 0x10]
    or ecx, eax
    mov ecx, dword ptr [esp + 0xc]
    jne L0
    mov eax, dword ptr [esp + 4]
    mul ecx
    ret 0x10
    push ebx
    mul ecx
    mov ebx, eax
    mov eax, dword ptr [esp + 8]
    mul dword ptr [esp + 0x14]
    add ebx, eax
    mov eax, dword ptr [esp + 8]
    mul ecx
    add edx, ebx
    pop ebx
    ret 0x10
__allmul ENDP
END