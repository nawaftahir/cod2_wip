; FUN_1008a646 @ 0x1008a646 — auto-synthesized
    sub_1008a4e5 PROTO C
.CODE
FUN_1008a646 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x14]
    cmp eax, -1
    je L0
    push dword ptr [ebp + 0x10]
    push eax
    push dword ptr [ebp + 8]
    call sub_1008a4e5
    pop ebp
    ret 0xc
FUN_1008a646 ENDP
END