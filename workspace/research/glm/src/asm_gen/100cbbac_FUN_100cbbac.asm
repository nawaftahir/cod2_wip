; FUN_100cbbac @ 0x100cbbac — auto-synthesized
.CODE
FUN_100cbbac PROC
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
FUN_100cbbac ENDP
END