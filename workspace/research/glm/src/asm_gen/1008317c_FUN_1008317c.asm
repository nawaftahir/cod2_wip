; FUN_1008317c @ 0x1008317c — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_1008317c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 0xc
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
    mov dword ptr [edx], 0x10110050
    mov eax, edx
    pop ebp
    ret 0x14
FUN_1008317c ENDP
END