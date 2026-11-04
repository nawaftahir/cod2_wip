.686
.MODEL FLAT, C
EXTRN sub_100F850A:PROC
EXTRN sub_100FDAD2:PROC
EXTRN EXTRN fp_1010C038:DWORD:DWORD
.CODE
__ioterm PROC
    push push esi
    push push edi
    mov mov esi, 01076ACA0h
    mov mov edi, dword ptr [esi]
    test test edi, edi
    je L3
    lea lea eax, [edi + 0480h]
    jmp L1
    cmp cmp dword ptr [edi + 8], 0
    je L0
    lea lea eax, [edi + 12]
    push push eax
    call dword ptr [fp_1010C038]
    mov mov eax, dword ptr [esi]
    add add edi, 36
    add add eax, 0480h
    cmp cmp edi, eax
    jb L2
    push push dword ptr [esi]
    call sub_100F850A
    and and dword ptr [esi], 0
    pop pop ecx
    add add esi, 4
    cmp cmp esi, 01076ADA0h
    jl sub_100FDAD2
    pop pop edi
    pop pop esi
L3:
    ret ret
__ioterm ENDP
END
