; FUN_10081b2b @ 0x10081b2b — auto-synthesized
    sub_10081a29 PROTO C
.CODE
FUN_10081b2b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    mov dword ptr [esi + 8], eax
    add eax, 0x10
    push eax
    call sub_10081a29
    test eax, eax
    jl L0
    mov dl, byte ptr [esi + 0xc]
    and dl, 0xf
    mov cl, 0x10
    sub cl, dl
    movzx edx, cl
    add dword ptr [esi + 0xc], edx
    mov esi, dword ptr [esi + 0xc]
    mov byte ptr [esi - 1], cl
    pop esi
    pop ebp
    ret 4
FUN_10081b2b ENDP
END