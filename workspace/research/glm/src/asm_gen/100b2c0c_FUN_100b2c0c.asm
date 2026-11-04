; FUN_100b2c0c @ 0x100b2c0c — auto-synthesized
    sub_100c5133 PROTO C
.CODE
FUN_100b2c0c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100c5133
    mov eax, dword ptr [ebp + 8]
    and dword ptr [esi + 0x228], 0
    mov dword ptr [esi + 0x158], eax
    mov dword ptr [esi], 0x10117af0
    mov dword ptr [esi + 0xf4], 0x101a4088
    mov dword ptr [esi + 0xf8], 0x101a41a8
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100b2c0c ENDP
END