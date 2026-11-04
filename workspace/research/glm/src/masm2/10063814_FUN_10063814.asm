.686
.MODEL FLAT, C
EXTRN sub_1006386A:PROC
EXTRN sub_10063892:PROC
EXTRN sub_10063899:PROC
.CODE
FUN_10063814 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push 44
    pop pop ecx
    mov mov eax, 01010C438h
    mov mov edx, dword ptr [eax - 16]
    sub sub eax, 12
    dec dec ecx
    cmp cmp edx, dword ptr [ebp + 8]
    jne L1
    mov mov edx, dword ptr [eax]
    and and edx, dword ptr [ebp + 12]
    cmp cmp edx, dword ptr [ebp + 12]
    je sub_1006386A
    cmp cmp eax, 01010C228h
    ja L0
    mov mov eax, 080004005h
    pop pop ebp
    ret ret 12
    push push edi
    mov mov edi, dword ptr [ebp + 16]
L0:
    test test edi, edi
    je sub_10063899
    push push esi
L1:
    lea lea esi, [ecx + ecx*2]
    lea lea esi, [esi*4 + 01010C220h]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    pop pop esi
    xor xor eax, eax
    pop pop edi
    jmp sub_10063892
FUN_10063814 ENDP
END
