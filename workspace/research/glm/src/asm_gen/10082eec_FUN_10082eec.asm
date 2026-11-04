; FUN_10082eec @ 0x10082eec — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10082eec PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 0xa
    mov edx, ecx
    call sub_100827c9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x14], eax
    mov eax, dword ptr [ebp + 0x10]
    and dword ptr [edx + 0x38], 0
    and dword ptr [edx + 0x3c], 0
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
    mov eax, dword ptr [ebp + 0x2c]
    mov dword ptr [edx + 0x34], eax
    mov dword ptr [edx], 0x10110038
    mov eax, edx
    pop ebp
    ret 0x28
FUN_10082eec ENDP
END