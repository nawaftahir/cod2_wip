; FUN_10082c4b @ 0x10082c4b — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10082c4b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 6
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
    xor eax, eax
    or dword ptr [edx + 0x24], 0xffffffff
    mov dword ptr [edx + 0x20], eax
    mov dword ptr [edx + 0x28], eax
    mov dword ptr [edx + 0x2c], eax
    mov dword ptr [edx], 0x10110008
    mov eax, edx
    pop ebp
    ret 0x10
FUN_10082c4b ENDP
END