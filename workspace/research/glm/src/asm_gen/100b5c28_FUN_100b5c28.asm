; FUN_100b5c28 @ 0x100b5c28 — auto-synthesized
    sub_100c5133 PROTO C
.CODE
FUN_100b5c28 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100c5133
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 0x158], eax
    mov dword ptr [esi], 0x10117c68
    mov dword ptr [esi + 0xf0], 0x101a4298
    mov dword ptr [esi + 0xf4], 0x101a44d8
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_100b5c28 ENDP
END