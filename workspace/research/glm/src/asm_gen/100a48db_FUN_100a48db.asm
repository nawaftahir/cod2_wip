; FUN_100a48db @ 0x100a48db — auto-synthesized
    sub_100c5133 PROTO C
.CODE
FUN_100a48db PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100c5133
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 0x158], eax
    mov dword ptr [esi], 0x10115a68
    mov dword ptr [esi + 0xf0], 0x101a3a28
    mov dword ptr [esi + 0xf4], 0x101a3c68
    mov dword ptr [esi + 0xf8], 0x101a3f18
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100a48db ENDP
END