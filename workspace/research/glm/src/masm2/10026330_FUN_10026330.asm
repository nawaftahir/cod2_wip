.686
.MODEL FLAT, C
EXTRN sub_100146C0:PROC
EXTRN sub_10026140:PROC
EXTRN sub_100263C6:PROC
EXTRN sub_100F5F2B:PROC
EXTRN EXTRN fp_101D49E0:DWORD:DWORD
.CODE
FUN_10026330 PROC
    sub sub esp, 0108h
    push push esi
    push push eax
    lea lea ecx, [esp + 12]
    push push 010196F0Ch
    push push ecx
    call sub_100F5F2B
    add add esp, 12
    push push 0
    push push 0200h
    mov mov eax, 3
    mov mov ecx, 0200h
    call sub_10026140
    mov mov esi, eax
    add add esp, 8
    test test esi, esi
    je sub_100263C6
    push push esi
    push push 0200h
    push push 0200h
    lea lea edx, [esp + 20]
    push push 90
    push push edx
    call sub_100146C0
    add add esp, 20
    push push esi
    call dword ptr [fp_101D49E0]
    add add esp, 4
    pop pop esi
    add add esp, 0108h
    ret ret
FUN_10026330 ENDP
END
