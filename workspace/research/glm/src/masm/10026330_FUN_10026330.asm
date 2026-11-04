.686
.MODEL FLAT, C
EXTRN sub_100146C0:PROC
EXTRN sub_10026140:PROC
EXTRN sub_100F5F2B:PROC
EXTRN fp_101D49E0:DWORD
.CODE
FUN_10026330 PROC
    sub esp, 000000108h
    push esi
    push eax
    lea ecx, [esp + 12]
    push 010196F0Ch
    push ecx
    call sub_100F5F2B
    add esp, 12
    push 0
    push 000000200h
    mov eax, 3
    mov ecx, 000000200h
    call sub_10026140
    mov esi, eax
    add esp, 8
    test esi, esi
    je L0
    push esi
    push 000000200h
    push 000000200h
    lea edx, [esp + 20]
    push 90
    push edx
    call sub_100146C0
    add esp, 20
    push esi
    call dword ptr [fp_101D49E0]
    add esp, 4
L0:
    pop esi
    add esp, 000000108h
    ret
FUN_10026330 ENDP
END
