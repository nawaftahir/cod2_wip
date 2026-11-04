; FUN_100865c6 @ 0x100865c6 — auto-synthesized
.CODE
FUN_100865c6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp + 0xc], eax
    jbe L0
    or eax, 0xffffffff
    jmp L1
    sbb eax, eax
    neg eax
    pop ebp
    ret 0xc
FUN_100865c6 ENDP
END