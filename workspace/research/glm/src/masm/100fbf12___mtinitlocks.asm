.686
.MODEL FLAT, C
EXTRN sub_10107A91:PROC
.CODE
__mtinitlocks PROC
    push esi
    push edi
    xor esi, esi
    mov edi, 0101ADDD8h
L0:
    cmp dword ptr [esi*8 + 0101A4B2Ch], 1
    jne L1
    lea eax, [esi*8 + 0101A4B28h]
    mov dword ptr [eax], edi
    push 000000FA0h
    push dword ptr [eax]
    add edi, 24
    call sub_10107A91
    test eax, eax
    pop ecx
    pop ecx
    je L3
L1:
    inc esi
    cmp esi, 36
    jl L0
    xor eax, eax
    inc eax
L2:
    pop edi
    pop esi
    ret
L3:
    and dword ptr [esi*8 + 0101A4B28h], 0
    xor eax, eax
    jmp L2
__mtinitlocks ENDP
END
