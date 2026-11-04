.686
.MODEL FLAT, C
EXTRN sub_100194FD:PROC
EXTRN sub_10019501:PROC
EXTRN sub_10019525:PROC
EXTRN sub_1005F3BF:PROC
EXTRN sub_1005FB01:PROC
EXTRN sub_1005FB2C:PROC
EXTRN sub_1005FF54:PROC
.CODE
FUN_10019480 PROC
    push push ebx
    push push 1
    push push 0101958CCh
    mov mov ecx, edi
    mov mov ebx, eax
    call sub_1005FB01
    add add esp, 8
    test test eax, eax
    jne L0
    xor xor al, al
    pop pop ebx
    ret ret
    push push esi
    mov mov ecx, edi
    call sub_1005FF54
    mov mov esi, eax
    test test esi, esi
    jl sub_100194FD
    cmp cmp esi, ebx
    jge sub_10019501
    push push 1
    push push 0101958A8h
    mov mov ecx, edi
    call sub_1005FB2C
    add add esp, 8
    test test eax, eax
    je sub_10019525
    imul imul esi, dword ptr [esp + 12]
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [eax], esi
    pop pop esi
    mov mov al, 1
    pop pop ebx
    ret ret
    dec dec ebx
    push push ebx
    push push 0101955B4h
    call sub_1005F3BF
    add add esp, 8
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
FUN_10019480 ENDP
END
