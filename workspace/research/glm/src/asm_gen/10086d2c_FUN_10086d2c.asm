; FUN_10086d2c @ 0x10086d2c — auto-synthesized
    sub_100f787f PROTO C
.CODE
FUN_10086d2c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    test byte ptr [ebp + 8], 1
    push esi
    mov esi, ecx
    mov dword ptr [esi], 0x10110440
    je L0
    push esi
    call sub_100f787f
    pop ecx
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_10086d2c ENDP
END