; FUN_10083527 @ 0x10083527 — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10083527 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 0x10
    mov edx, ecx
    call sub_100827c9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x14], eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [edx + 0x18], eax
    mov dword ptr [edx], 0x10110074
    mov eax, edx
    pop ebp
    ret 0xc
FUN_10083527 ENDP
END