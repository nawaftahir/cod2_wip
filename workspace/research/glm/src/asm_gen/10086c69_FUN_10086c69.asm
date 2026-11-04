; FUN_10086c69 @ 0x10086c69 — auto-synthesized
.CODE
FUN_10086c69 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, -1
    je L0
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 0x30]
    jmp L1
    or eax, 0xffffffff
    pop ebp
    ret 4
FUN_10086c69 ENDP
END