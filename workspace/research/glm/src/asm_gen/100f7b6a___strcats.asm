; __strcats @ 0x100f7b6a — auto-synthesized
    sub_100fe8bc PROTO C
.CODE
__strcats PROC
    push edi
    mov edi, dword ptr [esp + 0xc]
    test edi, edi
    jle L0
    push esi
    lea esi, [esp + 0x10]
    add esi, 4
    push dword ptr [esi]
    push dword ptr [esp + 0x10]
    call sub_100fe8bc
    dec edi
    pop ecx
    pop ecx
    jne L1
    pop esi
    pop edi
    ret
__strcats ENDP
END