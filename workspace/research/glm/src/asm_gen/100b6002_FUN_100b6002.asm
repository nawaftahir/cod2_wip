; FUN_100b6002 @ 0x100b6002 — auto-synthesized
    sub_100c8d17 PROTO C
.CODE
FUN_100b6002 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0xc8]
    and eax, 0xffff
    mov edx, 0x100
    cmp edx, eax
    sbb eax, eax
    neg eax
    mov dword ptr [ecx + 0x154], eax
    pop ebp
    jmp sub_100c8d17
FUN_100b6002 ENDP
END