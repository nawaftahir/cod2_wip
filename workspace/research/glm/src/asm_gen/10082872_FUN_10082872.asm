; FUN_10082872 @ 0x10082872 — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10082872 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 1
    mov edx, ecx
    call sub_100827c9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0xc], eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [edx + 0x10], eax
    mov dword ptr [edx], 0x1010ffcc
    mov eax, edx
    pop ebp
    ret 0xc
FUN_10082872 ENDP
END