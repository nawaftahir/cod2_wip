.686
.MODEL FLAT, C
EXTRN sub_10067CDA:PROC
EXTRN sub_10069745:PROC
EXTRN sub_1006974F:PROC
EXTRN sub_10069751:PROC
EXTRN sub_10069754:PROC
EXTRN sub_10069759:PROC
EXTRN sub_1006975B:PROC
EXTRN sub_10069764:PROC
EXTRN sub_10069778:PROC
EXTRN sub_10069785:PROC
EXTRN sub_10069798:PROC
EXTRN sub_100697E4:PROC
.CODE
FUN_1006968b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edx, dword ptr [ecx + 8]
    xor xor eax, eax
    test test edx, edx
    je sub_1006974F
    mov mov cl, byte ptr [edx]
    test test cl, cl
    je sub_10069759
    mov mov esi, edx
    movsx movsx ecx, cl
    cmp cmp ecx, 119
    jg L3
    je L1
    sub sub ecx, 97
    je L2
    dec dec ecx
    je L5
    sub sub ecx, 5
    je sub_10069745
    sub sub ecx, 11
    jne sub_10069754
    xor xor ecx, ecx
    or or eax, 010000h
    cmp cmp esi, edx
    je L4
    cmp cmp ecx, dword ptr [ebp - 4]
    jbe sub_10069764
    inc inc esi
    mov mov dword ptr [ebp - 4], ecx
    mov mov cl, byte ptr [esi]
    test test cl, cl
    jne L0
    jmp sub_10069798
    push push 3
    pop pop ecx
    or or eax, 080000h
    jmp L7
    sub sub ecx, 120
    je L6
    dec dec ecx
    je sub_10069778
    dec dec ecx
    jne sub_10069785
    push push 2
    pop pop ecx
    or or eax, 040000h
    jmp sub_10069751
    xor xor ecx, ecx
    inc inc ecx
    or or eax, 020000h
    jmp sub_1006975B
    push push edx
    push push 01010ECFCh
    push push 07D3h
    push push dword ptr [ebp + 8]
    push push dword ptr [edi]
    call sub_10067CDA
    add add esp, 20
L4:
    mov mov dword ptr [edi + 76], 1
    xor xor eax, eax
    jmp sub_100697E4
    mov mov eax, 0F0000h
L6:
    pop pop edi
    pop pop esi
L7:
    leave leave
    ret ret 4
FUN_1006968b ENDP
END
