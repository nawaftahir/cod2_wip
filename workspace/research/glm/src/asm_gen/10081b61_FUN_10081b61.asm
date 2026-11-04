; FUN_10081b61 @ 0x10081b61 — auto-synthesized
    sub_10081a22 PROTO C
.CODE
FUN_10081b61 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_10081a22
    test eax, eax
    jl L0
    mov eax, dword ptr [esi + 0xc]
    mov ecx, dword ptr [esi + 8]
    add ecx, eax
    mov dword ptr [esi + 0x10], eax
    mov dword ptr [esi + 0x14], ecx
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_10081b61 ENDP
END