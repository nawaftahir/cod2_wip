; FUN_10082916 @ 0x10082916 — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10082916 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 2
    mov edx, ecx
    call sub_100827c9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [edx + 0xc], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [edx + 0x14], eax
    mov dword ptr [edx], 0x1010ffd8
    mov eax, edx
    pop ebp
    ret 0x10
FUN_10082916 ENDP
END