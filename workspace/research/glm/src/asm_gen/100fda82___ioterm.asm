; __ioterm @ 0x100fda82 — auto-synthesized
    EXTRN fp_1010c038:DWORD
    sub_100f850a PROTO C
.CODE
__ioterm PROC
    push esi
    push edi
    mov esi, 0x1076aca0
    mov edi, dword ptr [esi]
    test edi, edi
    je L0
    lea eax, [edi + 0x480]
    jmp L1
    cmp dword ptr [edi + 8], 0
    je L2
    lea eax, [edi + 0xc]
    push eax
    call dword ptr [fp_1010c038]
    mov eax, dword ptr [esi]
    add edi, 0x24
    add eax, 0x480
    cmp edi, eax
    jb L3
    push dword ptr [esi]
    call sub_100f850a
    and dword ptr [esi], 0
    pop ecx
    add esi, 4
    cmp esi, 0x1076ada0
    jl L4
    pop edi
    pop esi
    ret
__ioterm ENDP
END