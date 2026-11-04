; FUN_10082e36 @ 0x10082e36 — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10082e36 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 9
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
    mov dword ptr [edx], 0x1011002c
    mov eax, edx
    pop ebp
    ret 0x14
FUN_10082e36 ENDP
END