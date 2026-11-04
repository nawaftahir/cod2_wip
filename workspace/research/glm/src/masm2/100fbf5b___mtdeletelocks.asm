.686
.MODEL FLAT, C
EXTRN sub_100F84F3:PROC
EXTRN sub_100FBFE0:PROC
EXTRN sub_100FBFE5:PROC
EXTRN sub_100FBFE6:PROC
EXTRN EXTRN g_1010C038:DWORD:DWORD
.CODE
__mtdeletelocks PROC
    push push ebx
    mov mov ebx, dword ptr [g_1010C038]
    push push esi
    mov mov esi, 0101A4B28h
    push push edi
    mov mov edi, dword ptr [esi]
    test test edi, edi
    je L0
    cmp cmp dword ptr [esi + 4], 1
    je L2
    push push edi
    call call ebx
    push push edi
    call sub_100F84F3
    and and dword ptr [esi], 0
    pop pop ecx
    add add esi, 8
    cmp cmp esi, 0101A4C48h
    jl L1
    mov mov esi, 0101A4B28h
    pop pop edi
    mov mov eax, dword ptr [esi]
    test test eax, eax
    je sub_100FBFE0
    cmp cmp dword ptr [esi + 4], 1
    jne sub_100FBFE6
    push push eax
    call call ebx
    add add esi, 8
    cmp cmp esi, 0101A4C48h
    jl sub_100FBFE5
    pop pop esi
    pop pop ebx
    ret ret
__mtdeletelocks ENDP
END
