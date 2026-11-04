; FUN_100835be @ 0x100835be — auto-synthesized
    sub_100827cb PROTO C
.CODE
FUN_100835be PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0xf
    mov edx, ecx
    call sub_100827cb
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0xc]
    push 8
    pop ecx
    lea edi, [edx + 0x10]
    mov dword ptr [edx], 0x10110080
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [edx + 0x30], eax
    mov eax, dword ptr [ebp + 0x10]
    pop edi
    mov dword ptr [edx + 0x34], eax
    mov eax, edx
    pop esi
    pop ebp
    ret 0xc
FUN_100835be ENDP
END