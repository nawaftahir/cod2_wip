.686
.MODEL FLAT, C
EXTRN sub_100F850A:PROC
EXTRN fp_1010C038:DWORD
.CODE
__ioterm PROC
    push esi
    push edi
    mov esi, 01076ACA0h
L0:
    mov edi, dword ptr [esi]
    test edi, edi
    je L4
    lea eax, [edi + 000000480h]
    jmp L3
L1:
    cmp dword ptr [edi + 8], 0
    je L2
    lea eax, [edi + 12]
    push eax
    call dword ptr [fp_1010C038]
L2:
    mov eax, dword ptr [esi]
    add edi, 36
    add eax, 000000480h
L3:
    cmp edi, eax
    jb L1
    push dword ptr [esi]
    call sub_100F850A
    and dword ptr [esi], 0
    pop ecx
L4:
    add esi, 4
    cmp esi, 01076ADA0h
    jl L0
    pop edi
    pop esi
    ret
__ioterm ENDP
END
