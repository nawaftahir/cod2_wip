; FUN_10083650 @ 0x10083650 — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10083650 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 0x11
    mov edx, ecx
    call sub_100827c9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x14], eax
    mov dword ptr [edx], 0x1011008c
    mov eax, edx
    pop ebp
    ret 8
FUN_10083650 ENDP
END