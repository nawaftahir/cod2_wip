.686
.MODEL FLAT, C
EXTRN sub_100FE96D:PROC
EXTRN sub_100FE98A:PROC
EXTRN sub_10100FB3:PROC
EXTRN sub_101090C7:PROC
EXTRN sub_101090CC:PROC
EXTRN sub_1010910F:PROC
EXTRN sub_10109117:PROC
EXTRN sub_10109118:PROC
EXTRN sub_1010912E:PROC
EXTRN sub_101091BE:PROC
EXTRN sub_101093D7:PROC
EXTRN sub_10109AA2:PROC
EXTRN sub_10109ADC:PROC
EXTRN sub_10109AE5:PROC
EXTRN sub_10109AFB:PROC
EXTRN sub_10109B34:PROC
EXTRN sub_10109B39:PROC
EXTRN sub_10109B67:PROC
EXTRN sub_10109B71:PROC
EXTRN sub_10109BE8:PROC
EXTRN sub_10109C5D:PROC
EXTRN sub_10109C61:PROC
EXTRN sub_10109C66:PROC
EXTRN sub_10109C7A:PROC
EXTRN sub_10109C8E:PROC
EXTRN sub_10109CAF:PROC
EXTRN sub_10109CCA:PROC
EXTRN sub_10109CCF:PROC
EXTRN sub_10109CD9:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
$I10_OUTPUT PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp + 16]
    push push ebx
    mov mov ebx, dword ptr [ebp + 28]
    push push esi
    mov mov ecx, eax
    mov mov esi, 07FFFh
    and and ecx, 08000h
    and and eax, esi
    test test cx, cx
    push push edi
    mov mov byte ptr [ebp - 28], 0CCh
    mov mov byte ptr [ebp - 27], 0CCh
    mov mov byte ptr [ebp - 26], 0CCh
    mov mov byte ptr [ebp - 25], 0CCh
    mov mov byte ptr [ebp - 24], 0CCh
    mov mov byte ptr [ebp - 23], 0CCh
    mov mov byte ptr [ebp - 22], 0CCh
    mov mov byte ptr [ebp - 21], 0CCh
    mov mov byte ptr [ebp - 20], 0CCh
    mov mov byte ptr [ebp - 19], 0CCh
    mov mov byte ptr [ebp - 18], 0FBh
    mov mov byte ptr [ebp - 17], 63
    mov mov dword ptr [ebp - 44], 1
    mov mov edx, eax
    je L0
    mov mov byte ptr [ebx + 2], 45
    jmp L1
    mov mov byte ptr [ebx + 2], 32
    test test dx, dx
    mov mov edi, dword ptr [ebp + 12]
    jne L2
    test test edi, edi
    jne L3
    cmp cmp dword ptr [ebp + 8], edi
    je L16
    cmp cmp dx, si
    jne L9
    mov mov eax, 080000000h
    cmp cmp edi, eax
    mov mov word ptr [ebx], 1
    jne L4
    cmp cmp dword ptr [ebp + 8], 0
    je L5
    test test edi, 040000000h
    jne L6
    push push 010182554h
    jmp L11
    test test cx, cx
    je L7
    cmp cmp edi, 0C0000000h
    jne L8
    cmp cmp dword ptr [ebp + 8], 0
    jne L12
    push push 01018254Ch
    jmp L10
    cmp cmp edi, eax
    jne L13
    cmp cmp dword ptr [ebp + 8], 0
    jne L14
    push push 010182544h
    lea lea eax, [ebx + 4]
    push push eax
L1:
    call sub_100FE96D
    mov mov byte ptr [ebx + 3], 5
    and and dword ptr [ebp - 44], 0
    pop pop ecx
    pop pop ecx
    jmp sub_10109B34
    push push 01018253Ch
    lea lea eax, [ebx + 4]
    push push eax
    call sub_100FE98A
    mov mov byte ptr [ebx + 3], 6
    jmp L15
    movzx movzx eax, dx
    mov mov esi, eax
    imul imul eax, eax, 04D10h
    and and word ptr [ebp - 16], 0
    mov mov ecx, edi
    shr shr ecx, 24
    shr shr esi, 8
    lea lea ecx, [esi + ecx*2]
    imul imul ecx, ecx, 77
    lea lea esi, [ecx + eax - 0134312F4h]
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 14], eax
    sar sar esi, 16
    movsx movsx eax, si
    neg neg eax
    push push 1
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    mov mov word ptr [ebp - 6], dx
    mov mov dword ptr [ebp - 10], edi
    call sub_101093D7
    add add esp, 12
    cmp cmp word ptr [ebp - 6], 03FFFh
L6:
    jb sub_10109AA2
    lea lea eax, [ebp - 28]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    inc inc esi
    call sub_101091BE
    pop pop ecx
    pop pop ecx
    test test byte ptr [ebp + 24], 1
    mov mov edi, dword ptr [ebp + 20]
    mov mov word ptr [ebx], si
    je sub_10109ADC
    movsx movsx eax, si
    add add edi, eax
    test test edi, edi
    jg sub_10109AE5
    mov mov byte ptr [ebx + 4], 48
    jmp sub_10109BE8
    cmp cmp edi, 21
    jle sub_10109AFB
    push push 21
    pop pop edi
    movzx movzx esi, word ptr [ebp - 6]
    sub sub esi, 03FFEh
    and and word ptr [ebp - 6], 0
    mov mov dword ptr [ebp + 16], 8
    lea lea eax, [ebp - 16]
    push push eax
    call sub_101090CC
    dec dec dword ptr [ebp + 16]
    pop pop ecx
L12:
    jne sub_10109B39
    test test esi, esi
    jge sub_10109B67
    neg neg esi
    and and esi, 0FFh
    jle sub_10109B71
    lea lea eax, [ebp - 16]
    push push eax
    call sub_10109117
    dec dec esi
    pop pop ecx
    jne sub_10109B71
    lea lea ecx, [edi + 1]
    test test ecx, ecx
    lea lea eax, [ebx + 4]
    mov mov dword ptr [ebp - 48], eax
    jle sub_10109BE8
    mov mov dword ptr [ebp + 16], ecx
    lea lea esi, [ebp - 16]
    lea lea edi, [ebp - 40]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    lea lea eax, [ebp - 16]
    push push eax
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1010910F
    lea lea eax, [ebp - 16]
    push push eax
    call sub_10109118
    lea lea eax, [ebp - 40]
    push push eax
    lea lea eax, [ebp - 16]
L16:
    push push eax
    call sub_101090C7
    lea lea eax, [ebp - 16]
    push push eax
    call sub_1010912E
    mov mov al, byte ptr [ebp - 5]
    mov mov ecx, dword ptr [ebp - 48]
    add add al, 48
    add add esp, 20
    inc inc dword ptr [ebp - 48]
    dec dec dword ptr [ebp + 16]
    mov mov byte ptr [ecx], al
    mov mov byte ptr [ebp - 5], 0
    jne sub_10109BE8
    mov mov eax, dword ptr [ebp - 48]
    dec dec eax
    mov mov cl, byte ptr [eax]
    dec dec eax
    cmp cmp cl, 53
    lea lea ecx, [ebx + 4]
    jl sub_10109C8E
    jmp sub_10109C5D
    cmp cmp byte ptr [eax], 57
    jne sub_10109C66
    mov mov byte ptr [eax], 48
    dec dec eax
    cmp cmp eax, ecx
    jae sub_10109C61
    cmp cmp eax, ecx
    jae sub_10109C7A
    inc inc eax
    inc inc word ptr [ebx]
    inc inc byte ptr [eax]
    sub sub al, bl
    sub sub al, 3
    mov mov byte ptr [ebx + 3], al
    movsx movsx eax, al
    mov mov byte ptr [eax + ebx + 4], 0
    mov mov eax, dword ptr [ebp - 44]
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    call sub_10100FB3
    leave leave
    ret ret
    cmp cmp byte ptr [eax], 48
    jne sub_10109CCF
    dec dec eax
    cmp cmp eax, ecx
    jae sub_10109CCA
    cmp cmp eax, ecx
    jae sub_10109CAF
    mov mov byte ptr [ecx], 48
    and and word ptr [ebx], 0
    xor xor eax, eax
    mov mov byte ptr [ebx + 2], 32
    mov mov byte ptr [ebx + 3], 1
    mov mov byte ptr [ebx + 5], 0
    inc inc eax
    jmp sub_10109CD9
$I10_OUTPUT ENDP
END
