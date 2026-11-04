; __mtdeletelocks @ 0x100fbf5b — auto-synthesized
    EXTRN g_1010c038:DWORD
    sub_100f84f3 PROTO C
.CODE
__mtdeletelocks PROC
    push ebx
    mov ebx, dword ptr [g_1010c038]
    push esi
    mov esi, 0x101a4b28
    push edi
    mov edi, dword ptr [esi]
    test edi, edi
    je L0
    cmp dword ptr [esi + 4], 1
    je L0
    push edi
    call ebx
    push edi
    call sub_100f84f3
    and dword ptr [esi], 0
    pop ecx
    add esi, 8
    cmp esi, 0x101a4c48
    jl L1
    mov esi, 0x101a4b28
    pop edi
    mov eax, dword ptr [esi]
    test eax, eax
    je L2
    cmp dword ptr [esi + 4], 1
    jne L2
    push eax
    call ebx
    add esi, 8
    cmp esi, 0x101a4c48
    jl L3
    pop esi
    pop ebx
    ret
__mtdeletelocks ENDP
END