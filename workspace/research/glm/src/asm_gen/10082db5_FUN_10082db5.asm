; FUN_10082db5 @ 0x10082db5 — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10082db5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 8
    mov edx, ecx
    call sub_100827c9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x14], eax
    mov dword ptr [edx], 0x10110020
    mov eax, edx
    pop ebp
    ret 8
FUN_10082db5 ENDP
END