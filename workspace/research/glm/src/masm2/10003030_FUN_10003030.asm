.686
.MODEL FLAT, C
EXTRN sub_10002EF3:PROC
EXTRN sub_100031B5:PROC
EXTRN sub_100031C3:PROC
EXTRN sub_100031EC:PROC
EXTRN sub_10003200:PROC
EXTRN sub_1000324A:PROC
EXTRN sub_10003260:PROC
EXTRN sub_10003278:PROC
EXTRN sub_1000329C:PROC
EXTRN sub_100138F6:PROC
EXTRN sub_10013951:PROC
EXTRN sub_1001D8DE:PROC
EXTRN sub_1001D92D:PROC
EXTRN sub_1002AA0A:PROC
EXTRN sub_10061D73:PROC
EXTRN sub_100F7922:PROC
EXTRN sub_101086EC:PROC
EXTRN EXTRN fp_101D4B40:DWORD:DWORD
.CODE
FUN_10003030 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 16
    mov mov eax, dword ptr [ebp + 8]
    push push esi
    push push edi
    push push eax
    push push ebx
    push push 0101918E8h
    push push 0101918E0h
    lea lea edi, [esp + 28]
    call sub_10002EF3
    add add esp, 16
    test test al, al
    jne L0
    push push 0101918B8h
    push push 1
    call sub_100138F6
    add add esp, 8
    mov mov edi, dword ptr [ebp + 8]
    mov mov esi, 1
    cmp cmp edi, esi
    jle L1
    mov mov ecx, dword ptr [ebx + esi*8]
    push push 0101918B0h
    push push ecx
    call sub_100F7922
    add add esp, 8
    test test eax, eax
    je L2
    inc inc esi
    cmp cmp esi, edi
    jl L1
    xor xor esi, esi
    jmp L3
L0:
    mov mov esi, dword ptr [ebx + esi*8 + 4]
    test test esi, esi
    jne L4
    fld fld dword ptr [esp + 20]
    sub sub esp, 24
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [esp + 40]
    fstp fstp qword ptr [esp + 8]
    fld fld dword ptr [esp + 36]
    fstp fstp qword ptr [esp]
    push push 010191868h
    push push 1
    call sub_10013951
    add add esp, 32
    push push 14
    push push 010191858h
    push push esi
    call sub_101086EC
    add add esp, 12
L1:
    test test eax, eax
    je sub_100031EC
    push push esi
    call sub_1001D8DE
    mov mov edi, eax
    add add esp, 4
    test test edi, edi
    je sub_100031B5
    push push edi
    call dword ptr [fp_101D4B40]
    add add esp, 4
    test test eax, eax
    jne sub_100031C3
    call sub_1002AA0A
    test test al, al
    jne sub_10003200
L3:
    fld fld dword ptr [esp + 20]
    sub sub esp, 24
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [esp + 40]
    fstp fstp qword ptr [esp + 8]
    fld fld dword ptr [esp + 36]
    fstp fstp qword ptr [esp]
    push push esi
    push push 010191828h
    call sub_10061D73
    push push 01019180Ch
    call sub_1001D92D
    add add esp, 36
    mov mov edi, eax
    test test edi, edi
    je sub_1000324A
    push push edi
    call dword ptr [fp_101D4B40]
    add add esp, 4
    test test eax, eax
    je sub_10003260
    xor xor al, al
    pop pop edi
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_10003278
    mov mov dword ptr [eax], edi
    mov mov eax, dword ptr [ebp + 16]
    test test eax, eax
    je sub_1000329C
    mov mov edx, dword ptr [esp + 12]
    mov mov ecx, dword ptr [esp + 16]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [eax + 8], edx
    pop pop edi
    mov mov al, 1
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_10003030 ENDP
END
