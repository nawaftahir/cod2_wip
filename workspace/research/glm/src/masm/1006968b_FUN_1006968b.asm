.686
.MODEL FLAT, C
EXTRN sub_10067CDA:PROC
.CODE
FUN_1006968b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    test edx, edx
    je L9
    mov cl, byte ptr [edx]
    test cl, cl
    je L9
    mov esi, edx
L0:
    movsx ecx, cl
    cmp ecx, 119
    jg L5
    je L4
    sub ecx, 97
    je L4
    dec ecx
    je L6
    sub ecx, 5
    je L7
    sub ecx, 11
    jne L8
L1:
    xor ecx, ecx
    or eax, 000010000h
L2:
    cmp esi, edx
    je L3
    cmp ecx, dword ptr [ebp - 4]
    jbe L8
L3:
    inc esi
    mov dword ptr [ebp - 4], ecx
    mov cl, byte ptr [esi]
    test cl, cl
    jne L0
    jmp L10
L4:
    push 3
    pop ecx
    or eax, 000080000h
    jmp L2
L5:
    sub ecx, 120
    je L1
    dec ecx
    je L7
    dec ecx
    jne L8
L6:
    push 2
    pop ecx
    or eax, 000040000h
    jmp L2
L7:
    xor ecx, ecx
    inc ecx
    or eax, 000020000h
    jmp L2
L8:
    push edx
    push 01010ECFCh
    push 0000007D3h
    push dword ptr [ebp + 8]
    push dword ptr [edi]
    call sub_10067CDA
    add esp, 20
    mov dword ptr [edi + 76], 1
    xor eax, eax
    jmp L10
L9:
    mov eax, 0000F0000h
L10:
    pop edi
    pop esi
    leave
    ret 4
FUN_1006968b ENDP
END
