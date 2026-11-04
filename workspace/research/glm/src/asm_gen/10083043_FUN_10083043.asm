; FUN_10083043 @ 0x10083043 — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10083043 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 0xb
    mov edx, ecx
    call sub_100827c9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x14], eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [edx + 0x18], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [edx + 0x1c], eax
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [edx + 0x20], eax
    mov eax, dword ptr [ebp + 0x1c]
    mov dword ptr [edx + 0x24], eax
    mov eax, dword ptr [ebp + 0x20]
    mov dword ptr [edx + 0x28], eax
    mov eax, dword ptr [ebp + 0x24]
    mov dword ptr [edx + 0x2c], eax
    mov eax, dword ptr [ebp + 0x28]
    mov dword ptr [edx + 0x30], eax
    xor eax, eax
    mov dword ptr [edx + 0x34], eax
    mov dword ptr [edx + 0x38], eax
    mov dword ptr [edx + 0x3c], eax
    mov dword ptr [edx], 0x10110044
    mov eax, edx
    pop ebp
    ret 0x24
FUN_10083043 ENDP
END