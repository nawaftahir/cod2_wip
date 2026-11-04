; FUN_100c5108 @ 0x100c5108 — auto-synthesized
.CODE
FUN_100c5108 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    jmp L0
    cmp ecx, dword ptr [ebp + 0xc]
    je L1
    add eax, 0x24
    mov ecx, dword ptr [eax + 0x10]
    cmp ecx, -1
    jne L2
    pop ebp
    ret 8
FUN_100c5108 ENDP
END