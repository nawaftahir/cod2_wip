; FUN_10018f90 @ 0x10018f90 — auto-synthesized
    sub_1005f39e PROTO C
    sub_1005fb01 PROTO C
    sub_1005fb3f PROTO C
    sub_1005ff53 PROTO C
.CODE
FUN_10018f90 PROC
    push edi
    push 1
    push 0x101958cc
    mov ecx, esi
    mov edi, eax
    call sub_1005fb01
    add esp, 8
    test eax, eax
    jne L0
    xor al, al
    pop edi
    ret
    mov ecx, esi
    call sub_1005ff53
    test eax, eax
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [ecx], eax
    jl L1
    cmp eax, edi
    jl L2
    dec edi
    push edi
    push eax
    push 0x101956ac
    call sub_1005f39e
    add esp, 0xc
    push 1
    push 0x101958a8
    mov ecx, esi
    call sub_1005fb3f
    add esp, 8
    test eax, eax
    setne al
    pop edi
    ret
FUN_10018f90 ENDP
END