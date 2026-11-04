.686
.MODEL FLAT, C
EXTRN sub_10013F2F:PROC
EXTRN sub_10013F36:PROC
EXTRN sub_10013F3B:PROC
EXTRN sub_10013F40:PROC
EXTRN sub_10013F44:PROC
EXTRN sub_10013F48:PROC
EXTRN sub_10013F52:PROC
EXTRN sub_10013F5C:PROC
EXTRN sub_10013F72:PROC
EXTRN sub_10013F76:PROC
EXTRN sub_100144C0:PROC
EXTRN sub_100144F6:PROC
.CODE
FUN_10013e90 PROC
    mov mov eax, dword ptr [esp + 8]
    push push edi
    mov mov edi, dword ptr [esp + 8]
    cmp cmp edi, eax
    je sub_10013F2F
    push push esi
    lea lea esi, [edi + 16]
    cmp cmp esi, eax
    je sub_10013F36
    push push ebx
    push push ebp
    lea lea ebp, [esi + 16]
    mov mov edi, edi
    mov mov ebx, dword ptr [esp + 28]
    push push edi
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    je L0
    cmp cmp edi, esi
    je sub_10013F40
    cmp cmp esi, ebp
    je sub_10013F44
    push push ebp
    push push edi
    mov mov eax, esi
    call sub_100144C0
    add add esp, 8
    jmp sub_10013F52
    lea lea edi, [ebp - 32]
    push push edi
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    je sub_10013F5C
    mov mov ebx, edi
    sub sub edi, 16
    push push edi
    push push esi
    call call dword ptr [esp + 36]
    add add esp, 8
    test test al, al
    jne sub_10013F48
    cmp cmp ebx, esi
    je sub_10013F72
    cmp cmp esi, ebp
    je sub_10013F76
    push push ebp
    push push ebx
    mov mov eax, esi
    call sub_100144F6
    add add esp, 8
    mov mov edi, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 24]
    add add esi, 16
    add add ebp, 16
    cmp cmp esi, eax
    jne sub_10013F3B
    pop pop ebp
    pop pop ebx
    pop pop esi
    pop pop edi
    ret ret
FUN_10013e90 ENDP
END
