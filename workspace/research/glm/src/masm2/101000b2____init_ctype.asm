.686
.MODEL FLAT, C
EXTRN sub_100F8678:PROC
EXTRN sub_100F868A:PROC
EXTRN sub_100F8690:PROC
EXTRN sub_100FC4B8:PROC
EXTRN sub_100FC4C9:PROC
EXTRN sub_100FC4D7:PROC
EXTRN sub_100FCF77:PROC
EXTRN sub_101002AE:PROC
EXTRN sub_101002E3:PROC
EXTRN sub_101002EB:PROC
EXTRN sub_101002F3:PROC
EXTRN sub_1010031F:PROC
EXTRN sub_10100329:PROC
EXTRN sub_10100361:PROC
EXTRN sub_10100367:PROC
EXTRN sub_1010036A:PROC
EXTRN sub_10100370:PROC
EXTRN sub_10100373:PROC
EXTRN sub_10100377:PROC
EXTRN sub_1010038B:PROC
EXTRN sub_10100419:PROC
EXTRN sub_10100440:PROC
EXTRN sub_10100F34:PROC
EXTRN sub_10100F35:PROC
EXTRN sub_10108566:PROC
EXTRN EXTRN fp_1010C188:DWORD:DWORD
EXTRN EXTRN g_101A5090:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101A50E0:DWORD:DWORD
EXTRN EXTRN g_101AE198:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE1C0:DWORD:DWORD
EXTRN EXTRN g_1076AC80:DWORD:DWORD
EXTRN EXTRN g_1076AC84:DWORD:DWORD
.CODE
___init_ctype PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    mov mov eax, dword ptr [g_101A50D0]
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [g_101AE198], edi
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 28], edi
    je L8
    cmp cmp dword ptr [g_101AE1A8], edi
    push push ebx
    push push esi
    jne L0
    movzx movzx eax, word ptr [g_101AE1C0]
    push push 0101AE1A8h
    push push 01004h
    push push eax
    push push edi
    call sub_10108566
    add add esp, 16
    test test eax, eax
    jne sub_101002AE
    push push 4
    call sub_100FC4B8
    mov mov ebx, eax
    mov mov dword ptr [ebp - 32], ebx
    mov mov dword ptr [esp], 0300h
    call sub_100FC4C9
    mov mov esi, eax
    mov mov dword ptr [esp], 0101h
    call sub_100FC4D7
    cmp cmp ebx, edi
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    je sub_101002E3
    cmp cmp esi, edi
    je sub_101002EB
    cmp cmp eax, edi
    je sub_101002F3
    mov mov dword ptr [ebx], edi
    xor xor eax, eax
    mov mov edi, 0100h
    mov mov ecx, dword ptr [ebp - 28]
    mov mov byte ptr [eax + ecx], al
    inc inc eax
    cmp cmp eax, edi
    jl L1
    lea lea eax, [ebp - 24]
    push push eax
    push push dword ptr [g_101AE1A8]
    call dword ptr [fp_1010C188]
    test test eax, eax
    je sub_1010031F
    cmp cmp dword ptr [ebp - 24], 5
    ja sub_10100329
    movzx movzx eax, word ptr [ebp - 24]
    cmp cmp eax, 1
    mov mov dword ptr [g_101A50E0], eax
    jle L2
    cmp cmp byte ptr [ebp - 18], 0
    je L3
    lea lea eax, [ebp - 17]
    mov mov dl, byte ptr [eax]
    test test dl, dl
    je L6
    movzx movzx ecx, byte ptr [eax - 1]
    movzx movzx edx, dl
    jmp L5
    mov mov edx, dword ptr [ebp - 28]
    mov mov byte ptr [ecx + edx], 0
    movzx movzx edx, byte ptr [eax]
    inc inc ecx
    cmp cmp ecx, edx
    jle L7
    inc inc eax
    inc inc eax
    cmp cmp byte ptr [eax - 1], 0
    jne L4
    xor xor eax, eax
    push push eax
    push push eax
    push push eax
    lea lea ebx, [esi + 0100h]
    push push ebx
    push push edi
    push push dword ptr [ebp - 28]
    mov mov dword ptr [ebp - 36], ebx
    push push 1
    call sub_10100F34
    add add esp, 28
    test test eax, eax
    je sub_1010038B
    lea lea edi, [esi + 0FEh]
    and and word ptr [edi], 0
    cmp cmp dword ptr [g_101A50E0], 1
    jle sub_10100361
    cmp cmp byte ptr [ebp - 18], 0
    je sub_10100367
    lea lea eax, [ebp - 17]
    mov mov dl, byte ptr [eax]
    test test dl, dl
    je sub_10100370
    movzx movzx ecx, byte ptr [eax - 1]
    movzx movzx edx, dl
    cmp cmp ecx, edx
    jg sub_10100373
    lea lea edx, [esi + ecx*2 + 0100h]
    mov mov word ptr [edx], 08000h
    movzx movzx ebx, byte ptr [eax]
    inc inc ecx
    inc inc edx
    inc inc edx
    cmp cmp ecx, ebx
    jle sub_10100377
    mov mov ebx, dword ptr [ebp - 36]
    inc inc eax
    inc inc eax
    cmp cmp byte ptr [eax - 1], 0
    jne sub_1010036A
    push push 0FEh
    lea lea eax, [esi + 0200h]
    push push eax
    push push esi
    call sub_100FCF77
    mov mov eax, dword ptr [ebp - 32]
    add add esp, 12
    mov mov dword ptr [g_101A5090], ebx
    mov mov dword ptr [g_1076AC84], eax
    mov mov dword ptr [g_1076AC80], edi
    xor xor esi, esi
    push push dword ptr [ebp - 28]
    call sub_100F8678
    pop pop ecx
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    jmp sub_10100440
    mov mov esi, dword ptr [ebp - 36]
    push push dword ptr [ebp - 32]
    call sub_100F868A
    push push esi
    call sub_100F8690
    pop pop ecx
    xor xor esi, esi
    pop pop ecx
    inc inc esi
    jmp sub_10100419
    mov mov dword ptr [g_101A5090], 01017D080h
    mov mov dword ptr [g_1076AC84], edi
    mov mov dword ptr [g_1076AC80], edi
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    call sub_10100F35
    leave leave
    ret ret
___init_ctype ENDP
END
