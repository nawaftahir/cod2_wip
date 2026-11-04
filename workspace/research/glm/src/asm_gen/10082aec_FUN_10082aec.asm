; FUN_10082aec @ 0x10082aec — auto-synthesized
    sub_100827c9 PROTO C
.CODE
FUN_10082aec PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 4
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
    mov dword ptr [edx], 0x1010fff0
    mov eax, edx
    pop ebp
    ret 0x10
FUN_10082aec ENDP
END