.686
.MODEL FLAT, C
EXTRN sub_10016ABC:PROC
EXTRN sub_10016AF0:PROC
EXTRN sub_10018D89:PROC
.CODE
FUN_10018e80 PROC
    push ecx
    push ebx
    push edi
    lea ebx, [esp + 8]
    call sub_10016ABC
    add esp, 4
    test al, al
    je L0
    mov eax, dword ptr [esp + 4]
    mov eax, dword ptr [eax*4 + 0101DA3DCh]
    test eax, eax
    jne L2
L0:
    push esi
    push edi
    call sub_10018D89
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L1
    pop esi
    pop ebx
    pop ecx
    ret
L1:
    push edi
    lea ebx, [esp + 12]
    call sub_10016AF0
    mov ecx, dword ptr [esp + 12]
    add esp, 4
    mov dword ptr [ecx*4 + 0101DA3DCh], esi
    mov eax, esi
    pop esi
L2:
    pop ebx
    pop ecx
    ret
FUN_10018e80 ENDP
END
