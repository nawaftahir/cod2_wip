; FUN_100f58bd @ 0x100f58bd — auto-synthesized
    sub_100cc7fc PROTO C
.CODE
FUN_100f58bd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 8], 0
    je L0
    cmp dword ptr [ebp + 0xc], 0x7fffffff
    ja L0
    pop ebp
    jmp sub_100cc7fc
    mov eax, 0x80070057
    pop ebp
    ret 0xc
FUN_100f58bd ENDP
END