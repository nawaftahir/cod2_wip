.686
.MODEL FLAT, C
EXTRN sub_100F8508:PROC
EXTRN sub_100F8513:PROC
EXTRN sub_100F8566:PROC
EXTRN sub_100F85E1:PROC
EXTRN sub_100F85E9:PROC
EXTRN sub_100F8662:PROC
EXTRN sub_100F866D:PROC
EXTRN sub_100FC4EA:PROC
EXTRN sub_100FC518:PROC
EXTRN sub_100FD833:PROC
EXTRN sub_100FFC42:PROC
EXTRN sub_101085FB:PROC
EXTRN sub_1010860C:PROC
EXTRN sub_1010861D:PROC
EXTRN g_101A4684:DWORD
EXTRN g_101A509C:DWORD
EXTRN g_101A50A0:DWORD
EXTRN g_101A50A4:DWORD
EXTRN g_101A50CC:DWORD
EXTRN g_101A50E4:DWORD
EXTRN g_101A50E8:DWORD
EXTRN g_101AE168:DWORD
EXTRN g_101AE19C:DWORD
EXTRN g_101AE1A0:DWORD
EXTRN g_101AE1CE:DWORD
EXTRN g_1076AC8C:DWORD
EXTRN g_1076AC90:DWORD
.CODE
___init_numeric PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    xor esi, esi
    cmp dword ptr [g_101AE1A0], esi
    push edi
    jne L1
    cmp dword ptr [g_101AE19C], esi
    jne L1
    mov eax, dword ptr [g_1076AC8C]
    cmp eax, esi
    je L0
    cmp dword ptr [eax], esi
    jne L0
    mov ecx, dword ptr [g_101A4684]
    cmp eax, dword ptr [ecx + 44]
    je L0
    push eax
    call sub_100F8508
    push dword ptr [g_101AE168]
    call sub_100F8513
    pop ecx
    pop ecx
L0:
    mov dword ptr [g_1076AC90], esi
    mov dword ptr [g_1076AC8C], esi
    mov ebx, 0101A509Ch
    mov dword ptr [g_101AE168], esi
    jmp L15
L1:
    push 48
    push 1
    call sub_100FD833
    mov ebx, eax
    cmp ebx, esi
    pop ecx
    pop ecx
    je L2
    mov esi, dword ptr [g_101A50CC]
    push 12
    pop ecx
    mov edi, ebx
    push 4
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_100FC4EA
    xor esi, esi
    cmp eax, esi
    pop ecx
    mov dword ptr [ebp - 8], eax
    jne L3
    push ebx
    call sub_100F8566
    pop ecx
L2:
    xor eax, eax
    inc eax
    jmp L16
L3:
    mov dword ptr [eax], esi
    cmp dword ptr [g_101AE1A0], esi
    je L12
    push 4
    call sub_100FC518
    cmp eax, esi
    pop ecx
    mov dword ptr [g_1076AC90], eax
    jne L4
    xor esi, esi
    inc esi
    jmp L5
L4:
    mov dword ptr [eax], esi
    movzx esi, word ptr [g_101AE1CE]
    push ebx
    push 14
    push esi
    push 1
    call sub_101085FB
    mov dword ptr [ebp - 4], eax
    lea eax, [ebx + 4]
    push eax
    push 15
    push esi
    push 1
    call sub_1010860C
    or dword ptr [ebp - 4], eax
    lea edi, [ebx + 8]
    push edi
    push 16
    push esi
    push 1
    call sub_1010861D
    add esp, 48
    or eax, dword ptr [ebp - 4]
    je L6
    push ebx
    call sub_100FFC42
    pop ecx
    or esi, 0FFFFFFFFh
L5:
    push ebx
    call sub_100F85E1
    push dword ptr [ebp - 8]
    call sub_100F85E9
    pop ecx
    pop ecx
    mov eax, esi
    jmp L16
L6:
    mov eax, dword ptr [edi]
    jmp L9
L7:
    mov cl, byte ptr [eax]
    cmp cl, 48
    jl L10
    cmp cl, 57
    jg L10
    sub cl, 48
    mov byte ptr [eax], cl
L8:
    inc eax
L9:
    cmp byte ptr [eax], 0
    jne L7
    jmp L13
L10:
    cmp cl, 59
    jne L8
    mov esi, eax
L11:
    lea edi, [esi + 1]
    mov cl, byte ptr [edi]
    mov byte ptr [esi], cl
    mov esi, edi
    cmp byte ptr [esi], 0
    jne L11
    jmp L9
L12:
    mov eax, dword ptr [g_101A509C]
    mov dword ptr [g_1076AC90], esi
    mov dword ptr [ebx], eax
    mov eax, dword ptr [g_101A50A0]
    mov dword ptr [ebx + 4], eax
    mov eax, dword ptr [g_101A50A4]
    mov dword ptr [ebx + 8], eax
L13:
    mov eax, dword ptr [g_1076AC8C]
    test eax, eax
    je L14
    cmp dword ptr [eax], 0
    jne L14
    mov ecx, dword ptr [g_101A4684]
    cmp eax, dword ptr [ecx + 44]
    je L14
    push eax
    call sub_100F8662
    push dword ptr [g_101AE168]
    call sub_100F866D
    pop ecx
    pop ecx
L14:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [g_1076AC8C], eax
    mov dword ptr [g_101AE168], ebx
L15:
    mov dword ptr [g_101A50CC], ebx
    mov eax, dword ptr [ebx]
    mov al, byte ptr [eax]
    mov byte ptr [g_101A50E4], al
    mov dword ptr [g_101A50E8], 1
    xor eax, eax
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret
___init_numeric ENDP
END
