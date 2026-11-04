.686
.MODEL FLAT, C
EXTRN sub_10067CC2:PROC
EXTRN sub_10069802:PROC
EXTRN sub_10069811:PROC
EXTRN sub_10069813:PROC
EXTRN sub_10069816:PROC
EXTRN sub_10069818:PROC
EXTRN sub_1006981A:PROC
EXTRN sub_1006982B:PROC
EXTRN sub_1006982C:PROC
EXTRN sub_1006982F:PROC
EXTRN sub_10069834:PROC
EXTRN sub_10069840:PROC
EXTRN sub_10069851:PROC
EXTRN sub_1006985A:PROC
EXTRN sub_1006987A:PROC
EXTRN sub_10069885:PROC
EXTRN sub_10069887:PROC
EXTRN sub_100698A5:PROC
.CODE
FUN_10069740 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    mov mov esi, dword ptr [eax + 8]
    push push edi
    xor xor edi, edi
    cmp cmp esi, edi
    mov mov ebx, ecx
    mov mov dword ptr [ebp - 8], edi
    mov mov eax, esi
    je sub_10069811
    cmp cmp byte ptr [esi], 0
    je sub_1006981A
    mov mov dword ptr [ebp - 4], 16
    mov mov dl, byte ptr [eax]
    test test dl, dl
    je L0
    movsx movsx edx, dl
    cmp cmp edx, 119
    jg sub_10069816
    je sub_10069813
    sub sub edx, 97
    je sub_10069818
    dec dec edx
    je sub_1006982B
    sub sub edx, 5
    je sub_10069834
    sub sub edx, 11
    jne sub_10069802
    xor xor edi, edi
    inc inc eax
    mov mov ecx, dword ptr [ebp - 4]
    add add dword ptr [ebp - 4], 2
    mov mov edx, edi
    shl shl edx, cl
    or or dword ptr [ebp - 8], edx
    cmp cmp dword ptr [ebp - 4], 24
    jb L1
    cmp cmp byte ptr [eax], 0
    je sub_1006985A
    push push esi
    push push 01010ED10h
    push push 07D4h
    push push dword ptr [ebp + 8]
    push push dword ptr [ebx]
    call sub_10067CC2
    add add esp, 20
    mov mov dword ptr [ebx + 76], 1
    xor xor eax, eax
    jmp sub_10069887
    push push 3
    pop pop edi
    jmp sub_1006982C
    sub sub edx, 120
    je sub_1006982F
    dec dec edx
    je sub_10069885
    dec dec edx
    jne sub_10069851
    push push 2
    jmp sub_1006987A
    xor xor edi, edi
    inc inc edi
    jmp sub_10069840
    mov mov eax, dword ptr [ebp - 8]
    jmp sub_100698A5
    mov mov eax, 0E40000h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10069740 ENDP
END
