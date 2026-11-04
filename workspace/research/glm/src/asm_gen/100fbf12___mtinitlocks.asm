; __mtinitlocks @ 0x100fbf12 — auto-synthesized
    sub_10107a91 PROTO C
.CODE
__mtinitlocks PROC
    push esi
    push edi
    xor esi, esi
    mov edi, 0x101addd8
    cmp dword ptr [esi*8 + 0x101a4b2c], 1
    jne L0
    lea eax, [esi*8 + 0x101a4b28]
    mov dword ptr [eax], edi
    push 0xfa0
    push dword ptr [eax]
    add edi, 0x18
    call sub_10107a91
    test eax, eax
    pop ecx
    pop ecx
    je L1
    inc esi
    cmp esi, 0x24
    jl L2
    xor eax, eax
    inc eax
    pop edi
    pop esi
    ret
    and dword ptr [esi*8 + 0x101a4b28], 0
    xor eax, eax
    jmp L3
__mtinitlocks ENDP
END