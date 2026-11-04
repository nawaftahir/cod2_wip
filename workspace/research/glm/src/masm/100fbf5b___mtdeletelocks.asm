.686
.MODEL FLAT, C
EXTRN sub_100F84F3:PROC
EXTRN g_1010C038:DWORD
.CODE
__mtdeletelocks PROC
    push ebx
    mov ebx, dword ptr [g_1010C038]
    push esi
    mov esi, 0101A4B28h
    push edi
L0:
    mov edi, dword ptr [esi]
    test edi, edi
    je L1
    cmp dword ptr [esi + 4], 1
    je L1
    push edi
    call ebx
    push edi
    call sub_100F84F3
    and dword ptr [esi], 0
    pop ecx
L1:
    add esi, 8
    cmp esi, 0101A4C48h
    jl L0
    mov esi, 0101A4B28h
    pop edi
L2:
    mov eax, dword ptr [esi]
    test eax, eax
    je L3
    cmp dword ptr [esi + 4], 1
    jne L3
    push eax
    call ebx
L3:
    add esi, 8
    cmp esi, 0101A4C48h
    jl L2
    pop esi
    pop ebx
    ret
__mtdeletelocks ENDP
END
