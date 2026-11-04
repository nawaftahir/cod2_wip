; FUN_100f589a @ 0x100f589a — auto-synthesized
    sub_100cc7c5 PROTO C
.CODE
FUN_100f589a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 8], 0
    je L0
    cmp dword ptr [ebp + 0xc], 0x7fffffff
    ja L0
    pop ebp
    jmp sub_100cc7c5
    mov eax, 0x80070057
    pop ebp
    ret 0xc
FUN_100f589a ENDP
END