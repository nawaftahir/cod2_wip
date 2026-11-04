.686
.MODEL FLAT, C
EXTRN sub_100FE9F6:PROC
EXTRN sub_10100488:PROC
EXTRN sub_101004D1:PROC
EXTRN sub_10100567:PROC
EXTRN sub_1010059C:PROC
EXTRN sub_10100B15:PROC
EXTRN sub_10100B2D:PROC
EXTRN sub_10100B4E:PROC
EXTRN sub_10100BA2:PROC
EXTRN sub_10100BDB:PROC
EXTRN sub_101088AF:PROC
EXTRN fp_1010C198:DWORD
EXTRN fp_1010C19C:DWORD
EXTRN fp_101AE18C:DWORD
EXTRN g_1010C190:DWORD
EXTRN g_101AE00C:DWORD
EXTRN g_101AE16C:DWORD
EXTRN g_101AE170:DWORD
EXTRN g_101AE174:DWORD
EXTRN g_101AE180:DWORD
EXTRN g_101AE188:DWORD
EXTRN g_101AE18C:DWORD
.CODE
___get_qualified_locale PROC
    push ebx
    xor ebx, ebx
    cmp dword ptr [g_101AE18C], ebx
    push esi
    jne L1
    cmp dword ptr [g_101AE00C], 2
    jne L0
    mov eax, dword ptr [g_1010C190]
    mov dword ptr [g_101AE18C], eax
    jmp L1
L0:
    mov dword ptr [g_101AE18C], 010100536h
L1:
    mov esi, dword ptr [esp + 12]
    cmp esi, ebx
    je L7
    lea eax, [esi + 64]
    cmp eax, ebx
    mov ecx, esi
    mov dword ptr [g_101AE188], ecx
    mov dword ptr [g_101AE180], eax
    je L2
    cmp byte ptr [eax], bl
    je L2
    push 0101AE180h
    push 22
    push 01017DAB8h
    call sub_10100488
    mov ecx, dword ptr [g_101AE188]
    mov eax, dword ptr [g_101AE180]
    add esp, 12
L2:
    cmp ecx, ebx
    mov dword ptr [g_101AE16C], ebx
    je L6
    cmp byte ptr [ecx], bl
    je L6
    cmp eax, ebx
    je L3
    cmp byte ptr [eax], bl
    je L3
    call sub_10100B15
    jmp L4
L3:
    call sub_10100BA2
L4:
    cmp dword ptr [g_101AE16C], ebx
    jne L9
    push 0101AE188h
    push 64
    push 01017DC68h
    call sub_101004D1
    add esp, 12
    test eax, eax
    je L8
    mov eax, dword ptr [g_101AE180]
    cmp eax, ebx
    je L5
    cmp byte ptr [eax], bl
    je L5
    call sub_10100B4E
    jmp L8
L5:
    call sub_10100BDB
    jmp L8
L6:
    cmp eax, ebx
    je L7
    cmp byte ptr [eax], bl
    je L7
    call sub_10100B2D
    jmp L8
L7:
    call sub_10100567
L8:
    cmp dword ptr [g_101AE16C], ebx
    jne L9
    xor eax, eax
    jmp L16
L9:
    push edi
    lea ecx, [esi + 000000080h]
    call sub_1010059C
    mov edi, eax
    cmp edi, ebx
    je L14
    movzx eax, di
    push eax
    call dword ptr [fp_1010C19C]
    test eax, eax
    je L14
    push 1
    push dword ptr [g_101AE170]
    call dword ptr [fp_1010C198]
    test eax, eax
    je L14
    mov eax, dword ptr [esp + 20]
    cmp eax, ebx
    mov ecx, dword ptr [g_101AE170]
    je L10
    mov dx, word ptr [g_101AE174]
    mov word ptr [eax], cx
    mov word ptr [eax + 2], dx
    mov word ptr [eax + 4], di
L10:
    mov esi, dword ptr [esp + 24]
    cmp esi, ebx
    je L13
    cmp word ptr [eax], 000000814h
    jne L11
    push 01017E28Ch
    push esi
    call sub_100FE9F6
    pop ecx
    pop ecx
    jmp L12
L11:
    push 64
    push esi
    push 000001001h
    push ecx
    call dword ptr [fp_101AE18C]
    test eax, eax
    je L14
L12:
    push 64
    lea eax, [esi + 64]
    push eax
    push 000001002h
    push dword ptr [g_101AE174]
    call dword ptr [fp_101AE18C]
    test eax, eax
    je L14
    push 10
    add esi, 000000080h
    push esi
    push edi
    call sub_101088AF
    add esp, 12
L13:
    xor eax, eax
    inc eax
    jmp L15
L14:
    xor eax, eax
L15:
    pop edi
L16:
    pop esi
    pop ebx
    ret
___get_qualified_locale ENDP
END
