.686
.MODEL FLAT, C
EXTRN sub_10016ABC:PROC
EXTRN sub_10016AF0:PROC
EXTRN sub_10018D89:PROC
EXTRN sub_10018EE8:PROC
EXTRN sub_10018EF3:PROC
.CODE
FUN_10018e80 PROC
    push push ecx
    push push ebx
    push push edi
    lea lea ebx, [esp + 8]
    call sub_10016ABC
    add add esp, 4
    test test al, al
    je L0
    mov mov eax, dword ptr [esp + 4]
    mov mov eax, dword ptr [eax*4 + 0101DA3DCh]
    test test eax, eax
    jne sub_10018EF3
    push push esi
    push push edi
    call sub_10018D89
    mov mov esi, eax
    add add esp, 4
    test test esi, esi
    jne sub_10018EE8
    pop pop esi
    pop pop ebx
    pop pop ecx
L0:
    ret ret
    push push edi
    lea lea ebx, [esp + 12]
    call sub_10016AF0
    mov mov ecx, dword ptr [esp + 12]
    add add esp, 4
    mov mov dword ptr [ecx*4 + 0101DA3DCh], esi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10018e80 ENDP
END
