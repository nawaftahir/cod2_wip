.686
.MODEL FLAT, C
EXTRN sub_10002EF3:PROC
EXTRN sub_100138F6:PROC
EXTRN sub_10013951:PROC
EXTRN sub_1001D8DE:PROC
EXTRN sub_1001D92D:PROC
EXTRN sub_1002AA0A:PROC
EXTRN sub_10061D73:PROC
EXTRN sub_100F7922:PROC
EXTRN sub_101086EC:PROC
EXTRN fp_101D4B40:DWORD
.CODE
FUN_10003030 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 16
    mov eax, dword ptr [ebp + 8]
    push esi
    push edi
    push eax
    push ebx
    push 0101918E8h
    push 0101918E0h
    lea edi, [esp + 28]
    call sub_10002EF3
    add esp, 16
    test al, al
    jne L0
    push 0101918B8h
    push 1
    call sub_100138F6
    add esp, 8
L0:
    mov edi, dword ptr [ebp + 8]
    mov esi, 1
    cmp edi, esi
    jle L2
L1:
    mov ecx, dword ptr [ebx + esi*8]
    push 0101918B0h
    push ecx
    call sub_100F7922
    add esp, 8
    test eax, eax
    je L3
    inc esi
    cmp esi, edi
    jl L1
L2:
    xor esi, esi
    jmp L4
L3:
    mov esi, dword ptr [ebx + esi*8 + 4]
    test esi, esi
    jne L5
L4:
    fld dword ptr [esp + 20]
    sub esp, 24
    fstp qword ptr [esp + 16]
    fld dword ptr [esp + 40]
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 36]
    fstp qword ptr [esp]
    push 010191868h
    push 1
    call sub_10013951
    add esp, 32
L5:
    push 14
    push 010191858h
    push esi
    call sub_101086EC
    add esp, 12
    test eax, eax
    je L8
    push esi
    call sub_1001D8DE
    mov edi, eax
    add esp, 4
    test edi, edi
    je L6
    push edi
    call dword ptr [fp_101D4B40]
    add esp, 4
    test eax, eax
    jne L6
    call sub_1002AA0A
    test al, al
    jne L7
L6:
    fld dword ptr [esp + 20]
    sub esp, 24
    fstp qword ptr [esp + 16]
    fld dword ptr [esp + 40]
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 36]
    fstp qword ptr [esp]
    push esi
    push 010191828h
    call sub_10061D73
    push 01019180Ch
    call sub_1001D92D
    add esp, 36
    mov edi, eax
L7:
    test edi, edi
    je L8
    push edi
    call dword ptr [fp_101D4B40]
    add esp, 4
    test eax, eax
    je L9
L8:
    xor al, al
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
L9:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L10
    mov dword ptr [eax], edi
L10:
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L11
    mov edx, dword ptr [esp + 12]
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [eax], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], edx
L11:
    pop edi
    mov al, 1
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_10003030 ENDP
END
