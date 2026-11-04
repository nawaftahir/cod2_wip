; FUN_100cac16 @ 0x100cac16 — auto-synthesized
    sub_100c4ce6 PROTO C
    sub_100c98bd PROTO C
.CODE
FUN_100cac16 PROC
    mov edi, edi
    push esi
    push 0x2b
    mov esi, ecx
    call sub_100c98bd
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L0
    mov ecx, esi
    call sub_100c4ce6
    test eax, eax
    jl L0
    xor eax, eax
    pop esi
    ret
FUN_100cac16 ENDP
END