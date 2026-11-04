.686
.MODEL FLAT, C
EXTRN sub_100F8678:PROC
EXTRN sub_100F868A:PROC
EXTRN sub_100F8690:PROC
EXTRN sub_100FC4B8:PROC
EXTRN sub_100FC4C9:PROC
EXTRN sub_100FC4D7:PROC
EXTRN sub_100FCF77:PROC
EXTRN sub_10100F34:PROC
EXTRN sub_10100F35:PROC
EXTRN sub_10108566:PROC
EXTRN fp_1010C188:DWORD
EXTRN g_101A5090:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101A50E0:DWORD
EXTRN g_101AE198:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE1C0:DWORD
EXTRN g_1076AC80:DWORD
EXTRN g_1076AC84:DWORD
.CODE
___init_ctype PROC
    push ebp
    mov ebp, esp
    sub esp, 36
    mov eax, dword ptr [g_101A50D0]
    push edi
    xor edi, edi
    cmp dword ptr [g_101AE198], edi
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 28], edi
    je L13
    cmp dword ptr [g_101AE1A8], edi
    push ebx
    push esi
    jne L0
    movzx eax, word ptr [g_101AE1C0]
    push 0101AE1A8h
    push 000001004h
    push eax
    push edi
    call sub_10108566
    add esp, 16
    test eax, eax
    jne L11
L0:
    push 4
    call sub_100FC4B8
    mov ebx, eax
    mov dword ptr [ebp - 32], ebx
    mov dword ptr [esp], 000000300h
    call sub_100FC4C9
    mov esi, eax
    mov dword ptr [esp], 000000101h
    call sub_100FC4D7
    cmp ebx, edi
    pop ecx
    mov dword ptr [ebp - 28], eax
    je L12
    cmp esi, edi
    je L12
    cmp eax, edi
    je L12
    mov dword ptr [ebx], edi
    xor eax, eax
    mov edi, 000000100h
L1:
    mov ecx, dword ptr [ebp - 28]
    mov byte ptr [eax + ecx], al
    inc eax
    cmp eax, edi
    jl L1
    lea eax, [ebp - 24]
    push eax
    push dword ptr [g_101AE1A8]
    call dword ptr [fp_1010C188]
    test eax, eax
    je L12
    cmp dword ptr [ebp - 24], 5
    ja L12
    movzx eax, word ptr [ebp - 24]
    cmp eax, 1
    mov dword ptr [g_101A50E0], eax
    jle L5
    cmp byte ptr [ebp - 18], 0
    je L5
    lea eax, [ebp - 17]
L2:
    mov dl, byte ptr [eax]
    test dl, dl
    je L5
    movzx ecx, byte ptr [eax - 1]
    movzx edx, dl
    jmp L4
L3:
    mov edx, dword ptr [ebp - 28]
    mov byte ptr [ecx + edx], 0
    movzx edx, byte ptr [eax]
    inc ecx
L4:
    cmp ecx, edx
    jle L3
    inc eax
    inc eax
    cmp byte ptr [eax - 1], 0
    jne L2
L5:
    xor eax, eax
    push eax
    push eax
    push eax
    lea ebx, [esi + 000000100h]
    push ebx
    push edi
    push dword ptr [ebp - 28]
    mov dword ptr [ebp - 36], ebx
    push 1
    call sub_10100F34
    add esp, 28
    test eax, eax
    je L12
    lea edi, [esi + 0000000FEh]
    and word ptr [edi], 0
    cmp dword ptr [g_101A50E0], 1
    jle L9
    cmp byte ptr [ebp - 18], 0
    je L9
    lea eax, [ebp - 17]
L6:
    mov dl, byte ptr [eax]
    test dl, dl
    je L9
    movzx ecx, byte ptr [eax - 1]
    movzx edx, dl
    cmp ecx, edx
    jg L8
    lea edx, [esi + ecx*2 + 000000100h]
L7:
    mov word ptr [edx], 000008000h
    movzx ebx, byte ptr [eax]
    inc ecx
    inc edx
    inc edx
    cmp ecx, ebx
    jle L7
    mov ebx, dword ptr [ebp - 36]
L8:
    inc eax
    inc eax
    cmp byte ptr [eax - 1], 0
    jne L6
L9:
    push 0000000FEh
    lea eax, [esi + 000000200h]
    push eax
    push esi
    call sub_100FCF77
    mov eax, dword ptr [ebp - 32]
    add esp, 12
    mov dword ptr [g_101A5090], ebx
    mov dword ptr [g_1076AC84], eax
    mov dword ptr [g_1076AC80], edi
    xor esi, esi
L10:
    push dword ptr [ebp - 28]
    call sub_100F8678
    pop ecx
    mov eax, esi
    pop esi
    pop ebx
    jmp L14
L11:
    mov esi, dword ptr [ebp - 36]
L12:
    push dword ptr [ebp - 32]
    call sub_100F868A
    push esi
    call sub_100F8690
    pop ecx
    xor esi, esi
    pop ecx
    inc esi
    jmp L10
L13:
    mov dword ptr [g_101A5090], 01017D080h
    mov dword ptr [g_1076AC84], edi
    mov dword ptr [g_1076AC80], edi
    xor eax, eax
L14:
    mov ecx, dword ptr [ebp - 4]
    pop edi
    call sub_10100F35
    leave
    ret
___init_ctype ENDP
END
