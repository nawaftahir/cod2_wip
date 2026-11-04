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
EXTRN sub_10100D20:PROC
EXTRN sub_10100D3C:PROC
EXTRN sub_10100DED:PROC
EXTRN sub_10100E07:PROC
EXTRN sub_10100E1A:PROC
EXTRN sub_10100E2C:PROC
EXTRN sub_10100E42:PROC
EXTRN sub_10100E4E:PROC
EXTRN sub_10100E65:PROC
EXTRN sub_10100E93:PROC
EXTRN sub_10100EAE:PROC
EXTRN sub_10100EC7:PROC
EXTRN sub_101088AF:PROC
EXTRN EXTRN fp_1010C198:DWORD:DWORD
EXTRN EXTRN fp_1010C19C:DWORD:DWORD
EXTRN EXTRN fp_101AE18C:DWORD:DWORD
EXTRN EXTRN g_1010C190:DWORD:DWORD
EXTRN EXTRN g_101AE00C:DWORD:DWORD
EXTRN EXTRN g_101AE16C:DWORD:DWORD
EXTRN EXTRN g_101AE170:DWORD:DWORD
EXTRN EXTRN g_101AE174:DWORD:DWORD
EXTRN EXTRN g_101AE180:DWORD:DWORD
EXTRN EXTRN g_101AE188:DWORD:DWORD
EXTRN EXTRN g_101AE18C:DWORD:DWORD
.CODE
___get_qualified_locale PROC
    push push ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [g_101AE18C], ebx
    push push esi
    jne L1
    cmp cmp dword ptr [g_101AE00C], 2
    jne L0
    mov mov eax, dword ptr [g_1010C190]
    mov mov dword ptr [g_101AE18C], eax
    jmp L3
    mov mov dword ptr [g_101AE18C], 010100536h
    mov mov esi, dword ptr [esp + 12]
    cmp cmp esi, ebx
    je L9
L1:
    lea lea eax, [esi + 64]
    cmp cmp eax, ebx
    mov mov ecx, esi
    mov mov dword ptr [g_101AE188], ecx
    mov mov dword ptr [g_101AE180], eax
    je L5
    cmp cmp byte ptr [eax], bl
    je L6
    push push 0101AE180h
    push push 22
    push push 01017DAB8h
    call sub_10100488
    mov mov ecx, dword ptr [g_101AE188]
    mov mov eax, dword ptr [g_101AE180]
    add add esp, 12
    cmp cmp ecx, ebx
    mov mov dword ptr [g_101AE16C], ebx
    je L11
    cmp cmp byte ptr [ecx], bl
    je L12
    cmp cmp eax, ebx
    je L7
    cmp cmp byte ptr [eax], bl
    je L8
    call sub_10100B15
    jmp L10
    call L2
    cmp cmp dword ptr [g_101AE16C], ebx
    jne L15
    push push 0101AE188h
    push push 64
    push push 01017DC68h
    call sub_101004D1
    add add esp, 12
    test test eax, eax
    je L16
    mov mov eax, dword ptr [g_101AE180]
    cmp cmp eax, ebx
    je L13
L5:
    cmp cmp byte ptr [eax], bl
    je L14
L6:
    call sub_10100B4E
    jmp L17
    call L4
    jmp L19
    cmp cmp eax, ebx
    je L18
    cmp cmp byte ptr [eax], bl
    je L20
    call sub_10100B2D
    jmp sub_10100D20
    call sub_10100567
    cmp cmp dword ptr [g_101AE16C], ebx
    jne sub_10100D3C
    xor xor eax, eax
    jmp sub_10100E07
    push push edi
    lea lea ecx, [esi + 080h]
    call sub_1010059C
    mov mov edi, eax
    cmp cmp edi, ebx
    je sub_10100E1A
    movzx movzx eax, di
    push push eax
    call dword ptr [fp_1010C19C]
    test test eax, eax
    je sub_10100E2C
    push push 1
    push push dword ptr [g_101AE170]
    call dword ptr [fp_1010C198]
    test test eax, eax
    je sub_10100E42
    mov mov eax, dword ptr [esp + 20]
    cmp cmp eax, ebx
    mov mov ecx, dword ptr [g_101AE170]
    je sub_10100DED
    mov mov dx, word ptr [g_101AE174]
    mov mov word ptr [eax], cx
    mov mov word ptr [eax + 2], dx
    mov mov word ptr [eax + 4], di
    mov mov esi, dword ptr [esp + 24]
    cmp cmp esi, ebx
    je sub_10100E65
    cmp cmp word ptr [eax], 0814h
    jne sub_10100E2C
    push push 01017E28Ch
    push push esi
    call sub_100FE9F6
    pop pop ecx
    pop pop ecx
    jmp sub_10100E4E
    push push 64
    push push esi
    push push 01001h
    push push ecx
    call dword ptr [fp_101AE18C]
    test test eax, eax
    je sub_10100E93
L13:
    push push 64
    lea lea eax, [esi + 64]
    push push eax
    push push 01002h
    push push dword ptr [g_101AE174]
    call dword ptr [fp_101AE18C]
    test test eax, eax
    je sub_10100EAE
    push push 10
    add add esi, 080h
    push push esi
    push push edi
    call sub_101088AF
    add add esp, 12
L19:
    xor xor eax, eax
    inc inc eax
L20:
    jmp sub_10100EC7
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
___get_qualified_locale ENDP
END
