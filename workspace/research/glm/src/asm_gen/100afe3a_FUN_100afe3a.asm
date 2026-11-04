; FUN_100afe3a @ 0x100afe3a — auto-synthesized
.CODE
FUN_100afe3a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x100]
    cmp dword ptr [eax + 0x24], 1
    mov eax, dword ptr [ebp + 8]
    jne L0
    or eax, 0x40000000
    pop ebp
    ret 4
FUN_100afe3a ENDP
END