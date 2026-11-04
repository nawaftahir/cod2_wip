.686
.MODEL FLAT, C
EXTRN sub_100F8CB0:PROC
EXTRN sub_100FA6F9:PROC
EXTRN sub_100FC8DB:PROC
EXTRN sub_10101555:PROC
EXTRN sub_10105D47:PROC
EXTRN sub_10105D5E:PROC
EXTRN sub_10105D60:PROC
EXTRN sub_10105D65:PROC
EXTRN sub_10105D6C:PROC
EXTRN sub_10105D6F:PROC
EXTRN sub_10105D76:PROC
EXTRN sub_10105D9C:PROC
EXTRN sub_10105DC0:PROC
EXTRN sub_10105DC1:PROC
EXTRN sub_10105DDE:PROC
EXTRN sub_10105DE0:PROC
EXTRN sub_10105DE7:PROC
EXTRN sub_10105DF0:PROC
EXTRN sub_10105DF9:PROC
EXTRN sub_10105DFE:PROC
EXTRN sub_10105E02:PROC
EXTRN sub_10105E07:PROC
EXTRN sub_10105E08:PROC
EXTRN sub_10105E0A:PROC
EXTRN sub_10105E1E:PROC
EXTRN sub_10105E2B:PROC
EXTRN sub_10105E31:PROC
EXTRN sub_10105E37:PROC
EXTRN sub_10105E3B:PROC
EXTRN sub_10105E4C:PROC
EXTRN sub_10105E55:PROC
EXTRN sub_10105E61:PROC
EXTRN sub_10105E6B:PROC
EXTRN sub_10105E76:PROC
EXTRN sub_10105E7F:PROC
EXTRN sub_10105E83:PROC
EXTRN sub_10105E94:PROC
EXTRN sub_10105E9D:PROC
EXTRN sub_10105EA2:PROC
EXTRN sub_10105EAF:PROC
EXTRN sub_10105EB8:PROC
EXTRN sub_10105EC1:PROC
EXTRN sub_10105EC6:PROC
EXTRN sub_10105EC9:PROC
EXTRN sub_10105ECC:PROC
EXTRN sub_10105EDD:PROC
EXTRN sub_10105EEC:PROC
EXTRN sub_10105EF0:PROC
EXTRN sub_10105EF2:PROC
EXTRN sub_10105EF5:PROC
EXTRN sub_10105EFC:PROC
EXTRN sub_10105F0A:PROC
EXTRN sub_10105F18:PROC
EXTRN sub_10105F1B:PROC
EXTRN sub_10105F22:PROC
EXTRN sub_10105F24:PROC
EXTRN sub_10105F2C:PROC
EXTRN sub_10105F36:PROC
EXTRN sub_10105F40:PROC
EXTRN sub_10105F4A:PROC
EXTRN sub_10105F54:PROC
EXTRN sub_10105F72:PROC
EXTRN sub_10105FA6:PROC
EXTRN sub_10105FB4:PROC
EXTRN sub_10105FB8:PROC
EXTRN sub_10105FE1:PROC
EXTRN sub_10105FE4:PROC
EXTRN sub_10105FE5:PROC
EXTRN sub_10105FEC:PROC
EXTRN sub_10105FF7:PROC
EXTRN sub_10106021:PROC
EXTRN sub_1010602A:PROC
EXTRN sub_101060D5:PROC
EXTRN sub_101060E3:PROC
EXTRN sub_101060F6:PROC
EXTRN sub_1010612F:PROC
EXTRN sub_10106135:PROC
EXTRN sub_10106136:PROC
EXTRN sub_1010613F:PROC
EXTRN sub_10106147:PROC
EXTRN sub_1010614C:PROC
EXTRN sub_10106164:PROC
EXTRN sub_10106176:PROC
EXTRN sub_1010617B:PROC
EXTRN sub_1010617F:PROC
EXTRN sub_10106185:PROC
EXTRN sub_101061A4:PROC
EXTRN sub_101061BB:PROC
EXTRN sub_101061D5:PROC
EXTRN sub_101061E3:PROC
EXTRN sub_101061F6:PROC
EXTRN sub_10106220:PROC
EXTRN sub_1010623A:PROC
EXTRN sub_1010624A:PROC
EXTRN sub_10106261:PROC
EXTRN sub_101062AA:PROC
EXTRN sub_101062B0:PROC
EXTRN sub_101062BB:PROC
EXTRN sub_101062E8:PROC
EXTRN sub_101062FC:PROC
EXTRN sub_10106314:PROC
EXTRN sub_1010631A:PROC
EXTRN sub_10106326:PROC
EXTRN sub_10106331:PROC
EXTRN sub_1010633D:PROC
EXTRN sub_10106370:PROC
EXTRN sub_101063CF:PROC
EXTRN sub_101063D5:PROC
EXTRN sub_101063D6:PROC
EXTRN sub_10106437:PROC
EXTRN sub_1010643E:PROC
EXTRN sub_10106442:PROC
EXTRN sub_10106470:PROC
EXTRN sub_1010648D:PROC
EXTRN sub_101064BC:PROC
EXTRN sub_101064E9:PROC
EXTRN sub_10106730:PROC
EXTRN sub_1010724A:PROC
EXTRN EXTRN fp_101A4FB0:DWORD:DWORD
EXTRN EXTRN fp_101A4FB4:DWORD:DWORD
EXTRN EXTRN fp_101A4FBC:DWORD:DWORD
EXTRN EXTRN g_101A4890:DWORD:DWORD
EXTRN EXTRN g_101A4894:DWORD:DWORD
EXTRN EXTRN g_101A5090:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101A50E0:DWORD:DWORD
.CODE
__woutput PROC
    push push ebp
    lea lea ebp, [esp - 03D8h]
    sub sub esp, 0458h
    mov mov eax, dword ptr [g_101A50D0]
    mov mov edx, dword ptr [ebp + 03E4h]
    mov mov dword ptr [ebp + 03D4h], eax
    xor xor eax, eax
    push push ebx
    mov mov bx, word ptr [edx]
    xor xor ecx, ecx
    cmp cmp bx, ax
    mov mov dword ptr [ebp - 56], eax
    mov mov dword ptr [ebp - 64], eax
    mov mov dword ptr [ebp - 88], eax
    je sub_10105D5E
    push push esi
    push push edi
    jmp L0
    mov mov ecx, dword ptr [ebp - 104]
    push push 2
    pop pop edi
    add add dword ptr [ebp + 03E4h], edi
    cmp cmp dword ptr [ebp - 64], 0
    jl sub_10105D76
    push push 32
    pop pop esi
    cmp cmp bx, si
    jb L1
    cmp cmp bx, 120
    ja L2
    movzx movzx eax, bx
    movsx movsx eax, byte ptr [eax + 01017C6E8h]
    and and eax, 15
    jmp L3
    xor xor eax, eax
    movsx movsx eax, byte ptr [ecx + eax*8 + 01017C708h]
    push push 7
    sar sar eax, 4
    pop pop ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 104], eax
    ja sub_10105D9C
    jmp jmp dword ptr [eax*4 + 010105D3Ch]
    xor xor eax, eax
    or or dword ptr [ebp - 52], -1
    mov mov dword ptr [ebp - 108], eax
    mov mov dword ptr [ebp - 92], eax
    mov mov dword ptr [ebp - 72], eax
    mov mov dword ptr [ebp - 68], eax
    mov mov dword ptr [ebp - 48], eax
    mov mov dword ptr [ebp - 76], eax
    jmp sub_10105DC0
    movzx movzx eax, bx
    sub sub eax, esi
    je L7
    sub sub eax, 3
    je L6
    sub sub eax, 8
    je L5
    sub sub eax, edi
    je L4
    sub sub eax, 3
    jne sub_10105DDE
    or or dword ptr [ebp - 48], 8
L2:
    jmp sub_10105DE7
    or or dword ptr [ebp - 48], 4
    jmp sub_10105DF0
    or or dword ptr [ebp - 48], 1
    jmp sub_10105DF9
    or or byte ptr [ebp - 48], 080h
    jmp sub_10105E02
    or or dword ptr [ebp - 48], edi
    jmp sub_10105E0A
    cmp cmp bx, 42
    jne L9
    add add dword ptr [ebp + 03E8h], 4
    mov mov eax, dword ptr [ebp + 03E8h]
    mov mov eax, dword ptr [eax - 4]
    test test eax, eax
    mov mov dword ptr [ebp - 72], eax
    jge sub_10105E2B
    or or dword ptr [ebp - 48], 4
    neg neg dword ptr [ebp - 72]
    jmp sub_10105E37
    mov mov eax, dword ptr [ebp - 72]
    movzx movzx ecx, bx
    lea lea eax, [eax + eax*4]
    lea lea eax, [ecx + eax*2 - 48]
    mov mov dword ptr [ebp - 72], eax
    jmp sub_10105E4C
    and and dword ptr [ebp - 52], 0
    jmp sub_10105E55
    cmp cmp bx, 42
    jne L10
    add add dword ptr [ebp + 03E8h], 4
    mov mov eax, dword ptr [ebp + 03E8h]
    mov mov eax, dword ptr [eax - 4]
    test test eax, eax
    mov mov dword ptr [ebp - 52], eax
    jge sub_10105E76
    or or dword ptr [ebp - 52], -1
    jmp sub_10105E7F
    mov mov eax, dword ptr [ebp - 52]
    movzx movzx ecx, bx
    lea lea eax, [eax + eax*4]
    lea lea eax, [ecx + eax*2 - 48]
    mov mov dword ptr [ebp - 52], eax
    jmp sub_10105E94
    movzx movzx eax, bx
    cmp cmp eax, 73
    je L13
    cmp cmp eax, 104
    je L12
    cmp cmp eax, 108
    je L11
    cmp cmp eax, 119
    jne sub_10105EAF
    or or byte ptr [ebp - 47], 8
    jmp sub_10105EB8
L7:
    or or dword ptr [ebp - 48], 16
    jmp sub_10105EC1
    or or dword ptr [ebp - 48], esi
    jmp sub_10105EC9
    mov mov eax, dword ptr [ebp + 03E4h]
    mov mov ax, word ptr [eax]
L8:
    cmp cmp ax, 54
    jne L14
    mov mov ecx, dword ptr [ebp + 03E4h]
    cmp cmp word ptr [ecx + 2], 52
    jne L15
    add add dword ptr [ebp + 03E4h], 4
    or or byte ptr [ebp - 47], 080h
    jmp sub_10105EF5
    cmp cmp ax, 51
    jne L16
    mov mov ecx, dword ptr [ebp + 03E4h]
    cmp cmp word ptr [ecx + 2], 50
    jne L17
    add add dword ptr [ebp + 03E4h], 4
    and and byte ptr [ebp - 47], 127
    jmp sub_10105F18
    cmp cmp ax, 100
    je sub_10105F22
    cmp cmp ax, 105
    je sub_10105F2C
    cmp cmp ax, 111
    je sub_10105F36
L9:
    cmp cmp ax, 117
    je sub_10105F40
    cmp cmp ax, 120
    je sub_10105F4A
    cmp cmp ax, 88
    je sub_10105F54
    and and dword ptr [ebp - 104], 0
    mov mov eax, dword ptr [ebp + 03E0h]
    push push ebx
    lea lea esi, [ebp - 64]
    mov mov dword ptr [ebp - 76], 1
    call L8
    jmp sub_10105F72
    movzx movzx eax, bx
    cmp cmp eax, 103
    jg L37
    cmp cmp eax, 101
    jge L20
    cmp cmp eax, 88
    jg L26
    je L43
    sub sub eax, 67
    je L24
    sub sub eax, edi
    je L21
    sub sub eax, edi
    je L22
    sub sub eax, 12
    jne sub_10105EA2
    test test word ptr [ebp - 48], 0830h
    jne L18
    or or dword ptr [ebp - 48], esi
    mov mov edx, dword ptr [ebp - 52]
    cmp cmp edx, -1
    jne L19
    mov mov edx, 07FFFFFFFh
    add add dword ptr [ebp + 03E8h], 4
    test test byte ptr [ebp - 48], 32
    mov mov eax, dword ptr [ebp + 03E8h]
    mov mov eax, dword ptr [eax - 4]
    mov mov dword ptr [ebp - 60], eax
    je sub_10105D47
    test test eax, eax
    jne L23
    mov mov eax, dword ptr [g_101A4890]
    mov mov dword ptr [ebp - 60], eax
    and and dword ptr [ebp - 56], 0
    test test edx, edx
    mov mov eax, dword ptr [ebp - 60]
    jle sub_10105EF2
    mov mov cl, byte ptr [eax]
    test test cl, cl
    je sub_10105EFC
    mov mov esi, dword ptr [g_101A5090]
    movzx movzx ecx, cl
    test test byte ptr [esi + ecx*2 + 1], 080h
    je L27
    inc inc eax
    inc inc eax
    inc inc dword ptr [ebp - 56]
    cmp cmp dword ptr [ebp - 56], edx
    jl L25
    jmp sub_10105F1B
    mov mov dword ptr [ebp - 108], 1
    add add ebx, esi
    or or dword ptr [ebp - 48], 64
    cmp cmp dword ptr [ebp - 52], 0
    lea lea esi, [ebp - 44]
    mov mov dword ptr [ebp - 60], esi
    jge L39
    mov mov dword ptr [ebp - 52], 6
    jmp L41
    test test word ptr [ebp - 48], 0830h
    jne L28
    or or dword ptr [ebp - 48], esi
    add add dword ptr [ebp + 03E8h], 4
    mov mov eax, dword ptr [ebp + 03E8h]
    movzx movzx eax, word ptr [eax - 4]
    xor xor esi, esi
    inc inc esi
    test test byte ptr [ebp - 48], 32
    mov mov dword ptr [ebp - 76], esi
    mov mov dword ptr [ebp - 112], eax
    je L34
    push push dword ptr [g_101A50E0]
    mov mov byte ptr [ebp - 84], al
    lea lea eax, [ebp - 84]
    push push eax
    lea lea eax, [ebp - 44]
    push push eax
    mov mov byte ptr [ebp - 83], 0
    call sub_1010633D
    add add esp, 12
    test test eax, eax
    jge L38
    mov mov dword ptr [ebp - 92], esi
    jmp L39
    sub sub eax, 90
    je L40
    sub sub eax, 9
    je L32
    dec dec eax
    jne sub_10105FA6
    or or dword ptr [ebp - 48], 64
    mov mov dword ptr [ebp - 56], 10
    mov mov ebx, dword ptr [ebp - 48]
    mov mov esi, 08000h
    test test esi, ebx
    je sub_10105EDD
    mov mov ecx, dword ptr [ebp + 03E8h]
    mov mov eax, dword ptr [ecx]
    mov mov edx, dword ptr [ecx + 4]
    add add ecx, 8
    mov mov dword ptr [ebp + 03E8h], ecx
    jmp sub_10105F24
    mov mov word ptr [ebp - 44], ax
    lea lea eax, [ebp - 44]
    mov mov dword ptr [ebp - 60], eax
    mov mov dword ptr [ebp - 56], esi
    jmp sub_10105FEC
    add add dword ptr [ebp + 03E8h], 4
    mov mov eax, dword ptr [ebp + 03E8h]
    mov mov eax, dword ptr [eax - 4]
    test test eax, eax
    je sub_10105D65
    mov mov ecx, dword ptr [eax + 4]
    test test ecx, ecx
    je sub_10105D6C
    test test byte ptr [ebp - 47], 8
    movsx movsx eax, word ptr [eax]
    mov mov dword ptr [ebp - 60], ecx
    je sub_10105D6F
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov dword ptr [ebp - 76], 1
    jmp sub_10106021
    and and dword ptr [ebp - 76], 0
    jmp sub_1010602A
    mov mov eax, dword ptr [g_101A4890]
    mov mov dword ptr [ebp - 60], eax
    push push eax
    jmp sub_10105E61
    jne sub_10105DC1
    cmp cmp bx, 103
    jne sub_10105DFE
    mov mov dword ptr [ebp - 52], 1
    jmp sub_10105E07
    mov mov eax, 0200h
    cmp cmp dword ptr [ebp - 52], eax
    jle sub_10105DE7
    mov mov dword ptr [ebp - 52], eax
    mov mov edi, 0A3h
    cmp cmp dword ptr [ebp - 52], edi
    jle sub_10105E1E
    mov mov eax, dword ptr [ebp - 52]
    add add eax, 015Dh
    push push eax
    call sub_100FC8DB
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 88], eax
    je sub_10105E31
    mov mov dword ptr [ebp - 60], eax
    mov mov esi, eax
    jmp sub_10105E3B
    mov mov dword ptr [ebp - 52], edi
    mov mov eax, dword ptr [ebp + 03E8h]
    mov mov ecx, dword ptr [eax]
    push push dword ptr [ebp - 108]
    add add eax, 8
    push push dword ptr [ebp - 52]
    mov mov dword ptr [ebp + 03E8h], eax
    mov mov eax, dword ptr [eax - 4]
    mov mov dword ptr [ebp - 124], eax
    movsx movsx eax, bl
    push push eax
    lea lea eax, [ebp - 080h]
    push push esi
    push push eax
    mov mov dword ptr [ebp - 080h], ecx
    call dword ptr [fp_101A4FB0]
    mov mov edi, dword ptr [ebp - 48]
    add add esp, 20
    and and edi, 080h
    je sub_10105EC6
    cmp cmp dword ptr [ebp - 52], 0
    jne sub_10105ECC
    push push esi
    call dword ptr [fp_101A4FBC]
    pop pop ecx
    cmp cmp bx, 103
    jne sub_10105EEC
    test test edi, edi
    jne sub_10105EF0
    push push esi
    call dword ptr [fp_101A4FB4]
    pop pop ecx
    cmp cmp byte ptr [esi], 45
    jne sub_10105F0A
    or or byte ptr [ebp - 47], 1
    inc inc esi
    mov mov dword ptr [ebp - 60], esi
    push push esi
    call sub_100FA6F9
    pop pop ecx
    jmp sub_101060F6
    sub sub eax, 105
    je sub_10105DE0
    sub sub eax, 5
    je sub_10105FF7
    dec dec eax
    je sub_10105FE4
    dec dec eax
    je sub_10105FB4
    sub sub eax, 3
    je L42
    sub sub eax, edi
    je sub_10105E08
    sub sub eax, 3
    jne sub_1010612F
    mov mov dword ptr [ebp - 100], 39
    jmp sub_10105FE1
    test test eax, eax
    jne sub_10105FB8
    mov mov eax, dword ptr [g_101A4894]
    mov mov dword ptr [ebp - 60], eax
    mov mov eax, dword ptr [ebp - 60]
    mov mov dword ptr [ebp - 76], 1
    jmp sub_10105FE1
    dec dec edx
    cmp cmp word ptr [eax], 0
    je sub_10105FEC
    add add eax, edi
    test test edx, edx
    jne sub_10105FE5
L18:
    sub sub eax, dword ptr [ebp - 60]
    sar sar eax, 1
    jmp sub_10106164
    mov mov dword ptr [ebp - 52], 8
    mov mov dword ptr [ebp - 100], ecx
    test test byte ptr [ebp - 48], 080h
L19:
    mov mov dword ptr [ebp - 56], 16
    je sub_10105E6B
    mov mov eax, dword ptr [ebp - 100]
    add add eax, 81
    mov mov word ptr [ebp - 80], 48
    mov mov word ptr [ebp - 78], ax
    mov mov dword ptr [ebp - 68], edi
    jmp sub_10105E83
    test test byte ptr [ebp - 48], 080h
    mov mov dword ptr [ebp - 56], 8
    je sub_10105E94
    or or byte ptr [ebp - 47], 2
    jmp sub_10105E9D
    add add dword ptr [ebp + 03E8h], 4
    test test byte ptr [ebp - 48], 32
    mov mov eax, dword ptr [ebp + 03E8h]
    mov mov eax, dword ptr [eax - 4]
    je sub_101060D5
    mov mov cx, word ptr [ebp - 64]
    mov mov word ptr [eax], cx
    jmp sub_101060E3
L24:
    mov mov ecx, dword ptr [ebp - 64]
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [ebp - 92], 1
    jmp sub_101062E8
    add add dword ptr [ebp + 03E8h], 4
    test test bl, 32
    mov mov eax, dword ptr [ebp + 03E8h]
    je sub_10106136
    test test bl, 64
    je sub_10106135
    movsx movsx eax, word ptr [eax - 4]
    cdq cdq
    jmp sub_1010614C
    movzx movzx eax, word ptr [eax - 4]
    jmp sub_1010613F
    test test bl, 64
    mov mov eax, dword ptr [eax - 4]
L25:
    jne sub_10106147
    xor xor edx, edx
    test test bl, 64
L26:
    je sub_1010617B
    test test edx, edx
    jg sub_1010617F
    jl sub_10106176
    test test eax, eax
L27:
    jae sub_10106185
    neg neg eax
    adc adc edx, 0
    neg neg edx
    or or byte ptr [ebp - 47], 1
    test test dword ptr [ebp - 48], esi
    mov mov ebx, eax
    mov mov edi, edx
    jne sub_101061A4
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 52], 0
    jge sub_101061BB
    mov mov dword ptr [ebp - 52], 1
    jmp sub_101061D5
    and and dword ptr [ebp - 48], -9
    mov mov eax, 0200h
    cmp cmp dword ptr [ebp - 52], eax
    jle sub_101061E3
    mov mov dword ptr [ebp - 52], eax
    mov mov eax, ebx
    or or eax, edi
    jne sub_101061F6
    and and dword ptr [ebp - 68], 0
    lea lea esi, [ebp + 01D3h]
    mov mov eax, dword ptr [ebp - 52]
    dec dec dword ptr [ebp - 52]
    test test eax, eax
    jg sub_10106220
    mov mov eax, ebx
    or or eax, edi
    je sub_1010624A
    mov mov eax, dword ptr [ebp - 56]
    cdq cdq
    push push edx
    push push eax
    push push edi
    push push ebx
    call sub_1010724A
    add add ecx, 48
    cmp cmp ecx, 57
    mov mov dword ptr [ebp - 116], ebx
    mov mov ebx, eax
    mov mov edi, edx
    jle sub_10106261
    add add ecx, dword ptr [ebp - 100]
    mov mov byte ptr [esi], cl
    dec dec esi
    jmp sub_1010623A
    lea lea eax, [ebp + 01D3h]
L28:
    sub sub eax, esi
    inc inc esi
    test test byte ptr [ebp - 47], 2
    mov mov dword ptr [ebp - 56], eax
    mov mov dword ptr [ebp - 60], esi
    je sub_101062B0
    mov mov ecx, esi
    cmp cmp byte ptr [ecx], 48
    jne sub_101062AA
    test test eax, eax
    jne sub_101062BB
    dec dec dword ptr [ebp - 60]
    mov mov ecx, dword ptr [ebp - 60]
    mov mov byte ptr [ecx], 48
    inc inc eax
    mov mov dword ptr [ebp - 56], eax
    cmp cmp dword ptr [ebp - 92], 0
    jne sub_101063D6
    mov mov eax, dword ptr [ebp - 48]
    test test al, 64
    je sub_10106314
    test test ah, 1
L30:
    je sub_101062FC
    mov mov word ptr [ebp - 80], 45
    jmp sub_1010631A
    test test al, 1
L31:
    je sub_10106314
    mov mov word ptr [ebp - 80], 43
    jmp sub_10106326
    test test al, 2
L32:
    je sub_10106331
    mov mov word ptr [ebp - 80], 32
    mov mov dword ptr [ebp - 68], 1
    mov mov ebx, dword ptr [ebp - 72]
    sub sub ebx, dword ptr [ebp - 68]
    sub sub ebx, dword ptr [ebp - 56]
    test test byte ptr [ebp - 48], 12
    jne sub_10106370
    push push dword ptr [ebp + 03E0h]
    lea lea eax, [ebp - 64]
    push push ebx
    push push 32
    call L29
    add add esp, 12
    push push dword ptr [ebp - 68]
    mov mov edi, dword ptr [ebp + 03E0h]
    lea lea eax, [ebp - 64]
    lea lea ecx, [ebp - 80]
    call L31
    test test byte ptr [ebp - 48], 8
    pop pop ecx
    je sub_101063CF
    test test byte ptr [ebp - 48], 4
    jne sub_101063D5
    push push edi
    push push ebx
    push push 48
    lea lea eax, [ebp - 64]
    call L30
    add add esp, 12
    cmp cmp dword ptr [ebp - 76], 0
    jne sub_10106437
    mov mov eax, dword ptr [ebp - 56]
L36:
    test test eax, eax
    jle sub_1010643E
    mov mov edi, dword ptr [ebp - 60]
    mov mov dword ptr [ebp - 96], eax
    push push dword ptr [g_101A50E0]
    dec dec dword ptr [ebp - 96]
    lea lea eax, [ebp - 112]
    push push edi
    push push eax
    call sub_10106730
    add add esp, 12
    test test eax, eax
    mov mov dword ptr [ebp - 116], eax
    jle sub_10106470
    push push dword ptr [ebp - 112]
    mov mov eax, dword ptr [ebp + 03E0h]
    lea lea esi, [ebp - 64]
    call L33
    add add edi, dword ptr [ebp - 116]
    cmp cmp dword ptr [ebp - 96], 0
    pop pop ecx
    jg sub_10106442
    jmp sub_1010648D
    push push dword ptr [ebp - 56]
    mov mov ecx, dword ptr [ebp - 60]
    lea lea eax, [ebp - 64]
    call L36
    pop pop ecx
    test test byte ptr [ebp - 48], 4
    je sub_101064BC
    push push dword ptr [ebp + 03E0h]
    lea lea eax, [ebp - 64]
    push push ebx
    push push 32
    call L35
    add add esp, 12
    cmp cmp dword ptr [ebp - 88], 0
    je sub_101064E9
    push push dword ptr [ebp - 88]
    call sub_100F8CB0
    and and dword ptr [ebp - 88], 0
    pop pop ecx
    mov mov eax, dword ptr [ebp + 03E4h]
    mov mov bx, word ptr [eax]
    test test bx, bx
    jne sub_10105D60
    pop pop edi
    pop pop esi
    mov mov ecx, dword ptr [ebp + 03D4h]
    mov mov eax, dword ptr [ebp - 64]
    pop pop ebx
    call sub_10101555
    add add ebp, 03D8h
    leave leave
    ret ret
__woutput ENDP
END
