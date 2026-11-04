; _StringCchCopyW@12 @ 0x100f582b — auto-synthesized
    sub_100cc6eb PROTO C
.CODE
_StringCchCopyW@12 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0xc], 0x7fffffff
    jbe L0
    mov eax, 0x80070057
    pop ebp
    ret 0xc
    pop ebp
    jmp sub_100cc6eb
_StringCchCopyW@12 ENDP
END