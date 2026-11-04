.686
.MODEL FLAT, C
EXTRN sub_1001194D:PROC
EXTRN sub_10012427:PROC
EXTRN sub_10012811:PROC
EXTRN sub_1006223A:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_101D1BF4:DWORD
EXTRN g_101D1BFC:DWORD
.CODE
FUN_10012820 PROC
    mov eax, dword ptr [g_101D1BF4]
    test eax, eax
    jne L0
    push 010193C1Ch
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    push 32
    call sub_1006223A
    test eax, eax
    mov dword ptr [g_101D1BF4], eax
    jne L0
    push 010193BF8h
    push eax
    call dword ptr [fp_101D49C8]
    add esp, 8
    xor al, al
    ret
L0:
    push esi
    call sub_10012811
    mov esi, eax
    mov dword ptr [g_101D1BFC], eax
    call sub_1001194D
    mov eax, dword ptr [g_101D1BFC]
    call sub_10012427
    mov al, 1
    pop esi
    ret
FUN_10012820 ENDP
END
