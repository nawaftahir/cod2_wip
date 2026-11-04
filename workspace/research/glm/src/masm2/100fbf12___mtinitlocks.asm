.686
.MODEL FLAT, C
EXTRN sub_100FBF80:PROC
EXTRN sub_100FBF95:PROC
EXTRN sub_10107A91:PROC
.CODE
__mtinitlocks PROC
    push push esi
    push push edi
    xor xor esi, esi
    mov mov edi, 0101ADDD8h
    cmp cmp dword ptr [esi*8 + 0101A4B2Ch], 1
    jne L1
    lea lea eax, [esi*8 + 0101A4B28h]
    mov mov dword ptr [eax], edi
    push push 0FA0h
    push push dword ptr [eax]
    add add edi, 24
    call sub_10107A91
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je sub_100FBF80
    inc inc esi
    cmp cmp esi, 36
    jl L0
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    ret ret
    and and dword ptr [esi*8 + 0101A4B28h], 0
    xor xor eax, eax
    jmp sub_100FBF95
__mtinitlocks ENDP
END
