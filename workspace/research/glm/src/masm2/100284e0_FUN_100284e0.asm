.686
.MODEL FLAT, C
EXTRN sub_1002856D:PROC
EXTRN sub_10028574:PROC
EXTRN sub_10028579:PROC
EXTRN sub_1002857D:PROC
EXTRN sub_10028582:PROC
EXTRN sub_10028586:PROC
EXTRN sub_10028597:PROC
EXTRN sub_100285AD:PROC
EXTRN sub_100285B1:PROC
EXTRN sub_1002899C:PROC
.CODE
FUN_100284e0 PROC
    mov mov eax, dword ptr [esp + 8]
    push push edi
    mov mov edi, dword ptr [esp + 8]
    cmp cmp edi, eax
    je sub_1002856D
    push push esi
    lea lea esi, [edi + 8]
    cmp cmp esi, eax
    je sub_10028574
    push push ebx
    push push ebp
    lea lea ebp, [esi + 8]
    jmp L0
    mov mov edi, dword ptr [esp + 20]
    mov mov ebx, dword ptr [esp + 28]
    push push edi
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    je L1
    cmp cmp edi, esi
    je sub_10028582
    cmp cmp esi, ebp
    je sub_10028586
    push push edi
    jmp sub_1002857D
    lea lea edi, [ebp - 16]
    push push edi
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    je sub_10028597
    mov mov ebx, edi
    sub sub edi, 8
    push push edi
    push push esi
    call call dword ptr [esp + 36]
    add add esp, 8
    test test al, al
    jne sub_10028582
    cmp cmp ebx, esi
    je sub_100285AD
    cmp cmp esi, ebp
    je sub_100285B1
    push push ebx
    mov mov eax, esi
    mov mov ebx, ebp
    call sub_1002899C
    add add esp, 4
    mov mov eax, dword ptr [esp + 24]
    add add esi, 8
    add add ebp, 8
    cmp cmp esi, eax
    jne sub_10028579
    pop pop ebp
    pop pop ebx
    pop pop esi
    pop pop edi
    ret ret
FUN_100284e0 ENDP
END
