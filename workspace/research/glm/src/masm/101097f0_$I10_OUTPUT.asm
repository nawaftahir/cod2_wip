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
EXTRN g_101A50D0:DWORD
.CODE
$I10_OUTPUT PROC
    push ebp
    mov ebp, esp
    sub esp, 48
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp + 16]
    push ebx
    mov ebx, dword ptr [ebp + 28]
    push esi
    mov ecx, eax
    mov esi, 000007FFFh
    and ecx, 000008000h
    and eax, esi
    test cx, cx
    push edi
    mov byte ptr [ebp - 28], 0000000CCh
    mov byte ptr [ebp - 27], 0000000CCh
    mov byte ptr [ebp - 26], 0000000CCh
    mov byte ptr [ebp - 25], 0000000CCh
    mov byte ptr [ebp - 24], 0000000CCh
    mov byte ptr [ebp - 23], 0000000CCh
    mov byte ptr [ebp - 22], 0000000CCh
    mov byte ptr [ebp - 21], 0000000CCh
    mov byte ptr [ebp - 20], 0000000CCh
    mov byte ptr [ebp - 19], 0000000CCh
    mov byte ptr [ebp - 18], 0000000FBh
    mov byte ptr [ebp - 17], 63
    mov dword ptr [ebp - 44], 1
    mov edx, eax
    je L0
    mov byte ptr [ebx + 2], 45
    jmp L1
L0:
    mov byte ptr [ebx + 2], 32
L1:
    test dx, dx
    mov edi, dword ptr [ebp + 12]
    jne L2
    test edi, edi
    jne L2
    cmp dword ptr [ebp + 8], edi
    je L12
L2:
    cmp dx, si
    jne L10
    mov eax, 080000000h
    cmp edi, eax
    mov word ptr [ebx], 1
    jne L3
    cmp dword ptr [ebp + 8], 0
    je L4
L3:
    test edi, 040000000h
    jne L4
    push 010182554h
    jmp L9
L4:
    test cx, cx
    je L5
    cmp edi, 0C0000000h
    jne L5
    cmp dword ptr [ebp + 8], 0
    jne L8
    push 01018254Ch
    jmp L6
L5:
    cmp edi, eax
    jne L8
    cmp dword ptr [ebp + 8], 0
    jne L8
    push 010182544h
L6:
    lea eax, [ebx + 4]
    push eax
    call sub_100FE96D
    mov byte ptr [ebx + 3], 5
L7:
    and dword ptr [ebp - 44], 0
    pop ecx
    pop ecx
    jmp L25
L8:
    push 01018253Ch
L9:
    lea eax, [ebx + 4]
    push eax
    call sub_100FE98A
    mov byte ptr [ebx + 3], 6
    jmp L7
L10:
    movzx eax, dx
    mov esi, eax
    imul eax, eax, 000004D10h
    and word ptr [ebp - 16], 0
    mov ecx, edi
    shr ecx, 24
    shr esi, 8
    lea ecx, [esi + ecx*2]
    imul ecx, ecx, 77
    lea esi, [ecx + eax - 0134312F4h]
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 14], eax
    sar esi, 16
    movsx eax, si
    neg eax
    push 1
    push eax
    lea eax, [ebp - 16]
    push eax
    mov word ptr [ebp - 6], dx
    mov dword ptr [ebp - 10], edi
    call sub_101093D7
    add esp, 12
    cmp word ptr [ebp - 6], 000003FFFh
    jb L11
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 16]
    push eax
    inc esi
    call sub_101091BE
    pop ecx
    pop ecx
L11:
    test byte ptr [ebp + 24], 1
    mov edi, dword ptr [ebp + 20]
    mov word ptr [ebx], si
    je L13
    movsx eax, si
    add edi, eax
    test edi, edi
    jg L13
L12:
    mov byte ptr [ebx + 4], 48
    jmp L30
L13:
    cmp edi, 21
    jle L14
    push 21
    pop edi
L14:
    movzx esi, word ptr [ebp - 6]
    sub esi, 000003FFEh
    and word ptr [ebp - 6], 0
    mov dword ptr [ebp + 16], 8
L15:
    lea eax, [ebp - 16]
    push eax
    call sub_101090CC
    dec dword ptr [ebp + 16]
    pop ecx
    jne L15
    test esi, esi
    jge L17
    neg esi
    and esi, 0000000FFh
    jle L17
L16:
    lea eax, [ebp - 16]
    push eax
    call sub_10109117
    dec esi
    pop ecx
    jne L16
L17:
    lea ecx, [edi + 1]
    test ecx, ecx
    lea eax, [ebx + 4]
    mov dword ptr [ebp - 48], eax
    jle L19
    mov dword ptr [ebp + 16], ecx
L18:
    lea esi, [ebp - 16]
    lea edi, [ebp - 40]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    lea eax, [ebp - 16]
    push eax
    movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1010910F
    lea eax, [ebp - 16]
    push eax
    call sub_10109118
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 16]
    push eax
    call sub_101090C7
    lea eax, [ebp - 16]
    push eax
    call sub_1010912E
    mov al, byte ptr [ebp - 5]
    mov ecx, dword ptr [ebp - 48]
    add al, 48
    add esp, 20
    inc dword ptr [ebp - 48]
    dec dword ptr [ebp + 16]
    mov byte ptr [ecx], al
    mov byte ptr [ebp - 5], 0
    jne L18
    mov eax, dword ptr [ebp - 48]
L19:
    dec eax
    mov cl, byte ptr [eax]
    dec eax
    cmp cl, 53
    lea ecx, [ebx + 4]
    jl L28
    jmp L21
L20:
    cmp byte ptr [eax], 57
    jne L22
    mov byte ptr [eax], 48
    dec eax
L21:
    cmp eax, ecx
    jae L20
L22:
    cmp eax, ecx
    jae L23
    inc eax
    inc word ptr [ebx]
L23:
    inc byte ptr [eax]
L24:
    sub al, bl
    sub al, 3
    mov byte ptr [ebx + 3], al
    movsx eax, al
    mov byte ptr [eax + ebx + 4], 0
L25:
    mov eax, dword ptr [ebp - 44]
L26:
    mov ecx, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    call sub_10100FB3
    leave
    ret
L27:
    cmp byte ptr [eax], 48
    jne L29
    dec eax
L28:
    cmp eax, ecx
    jae L27
L29:
    cmp eax, ecx
    jae L24
    mov byte ptr [ecx], 48
L30:
    and word ptr [ebx], 0
    xor eax, eax
    mov byte ptr [ebx + 2], 32
    mov byte ptr [ebx + 3], 1
    mov byte ptr [ebx + 5], 0
    inc eax
    jmp L26
$I10_OUTPUT ENDP
END
