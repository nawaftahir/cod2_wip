; FUN_10016740 @ 0x10016740 — auto-synthesized
    sub_100165df PROTO C
.CODE
FUN_10016740 PROC
    push esi
    push edi
    mov esi, 8
    mov edi, 0x1018eac8
    lea esp, [esp]
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [eax]
    push edi
    push ecx
    push edx
    call sub_100165df
    mov ecx, dword ptr [ebx]
    mov dword ptr [esi + ecx], eax
    add esi, 4
    add esp, 0xc
    add edi, 0x15
    cmp esi, 0x18
    jl L0
    pop edi
    pop esi
    ret
FUN_10016740 ENDP
END