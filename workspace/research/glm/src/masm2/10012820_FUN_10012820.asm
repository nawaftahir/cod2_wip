.686
.MODEL FLAT, C
EXTRN sub_1001194D:PROC
EXTRN sub_10012427:PROC
EXTRN sub_10012811:PROC
EXTRN sub_10012884:PROC
EXTRN sub_1006223A:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
EXTRN EXTRN g_101D1BFC:DWORD:DWORD
.CODE
FUN_10012820 PROC
    mov mov eax, dword ptr [g_101D1BF4]
    test test eax, eax
    jne L0
    push push 010193C1Ch
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    push push 32
    call sub_1006223A
    test test eax, eax
    mov mov dword ptr [g_101D1BF4], eax
    jne sub_10012884
    push push 010193BF8h
    push push eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    xor xor al, al
    ret ret
    push push esi
    call sub_10012811
    mov mov esi, eax
    mov mov dword ptr [g_101D1BFC], eax
    call sub_1001194D
    mov mov eax, dword ptr [g_101D1BFC]
    call sub_10012427
    mov mov al, 1
    pop pop esi
    ret ret
FUN_10012820 ENDP
END
