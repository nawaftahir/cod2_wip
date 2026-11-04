; FUN_100c9a14 @ 0x100c9a14 — auto-synthesized
    sub_100c99cc PROTO C
    sub_100c9a1a PROTO C
.CODE
FUN_100c9a14 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    or esi, dword ptr [ebp + 0xc]
    push edi
    push esi
    mov edi, ecx
    call sub_100c99cc
    test eax, eax
    jl L0
    test esi, 0x2000
    je L1
    mov eax, dword ptr [edi + 0x14]
    mov ecx, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ecx + 0x10]
    and eax, 0x7ff
    or eax, 0xb0000000
    sub ecx, 0
    je L2
    dec ecx
    je L3
    dec ecx
    je L4
    dec ecx
    jne L2
    or eax, 0xff0000
    jmp L2
    or eax, 0xaa0000
    jmp L2
    or eax, 0x550000
    push eax
    mov ecx, edi
    call sub_100c9a1a
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 0xc
FUN_100c9a14 ENDP
END