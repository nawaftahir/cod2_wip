.686
.MODEL FLAT, C
EXTRN sub_100F5EF1:PROC
EXTRN sub_100F7E29:PROC
EXTRN sub_100F7EA3:PROC
EXTRN sub_100F7F0D:PROC
EXTRN sub_100F7F38:PROC
EXTRN sub_100F801D:PROC
EXTRN sub_100F8099:PROC
EXTRN sub_100F8377:PROC
EXTRN sub_100F8380:PROC
EXTRN sub_100F83AC:PROC
EXTRN sub_100F83CC:PROC
EXTRN sub_100F83D5:PROC
EXTRN sub_100F83E7:PROC
EXTRN sub_100F8406:PROC
EXTRN sub_100F8425:PROC
EXTRN sub_100F8439:PROC
EXTRN sub_100F849E:PROC
EXTRN sub_100F84A0:PROC
EXTRN sub_100F84A6:PROC
EXTRN sub_100F84AE:PROC
EXTRN sub_100F84B4:PROC
EXTRN sub_100F84C2:PROC
EXTRN sub_100F84CA:PROC
EXTRN sub_100F8511:PROC
EXTRN sub_100F868D:PROC
EXTRN sub_100FA2C1:PROC
EXTRN sub_101003D1:PROC
EXTRN sub_1010051C:PROC
EXTRN sub_10100E92:PROC
EXTRN sub_10101093:PROC
EXTRN sub_10101099:PROC
EXTRN EXTRN g_101A47C4:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
__setlocale_lk PROC
    push push ebp
    lea lea ebp, [esp - 120]
    sub sub esp, 094h
    mov mov eax, dword ptr [g_101A50D0]
    push push ebx
    push push esi
    mov mov esi, edx
    xor xor ebx, ebx
    cmp cmp esi, ebx
    push push edi
    mov mov dword ptr [ebp + 116], eax
    mov mov edi, ecx
    je L1
    cmp cmp edi, ebx
    je L0
    push push edi
    call sub_100F7F38
    pop pop ecx
    jmp L3
    lea lea eax, [esi + esi*2]
    mov mov esi, dword ptr [eax*4 + 0101A47C4h]
    jmp L4
    cmp cmp edi, ebx
    mov mov dword ptr [ebp - 24], 1
    mov mov dword ptr [ebp - 20], ebx
    je L7
    cmp cmp byte ptr [edi], 76
L0:
    jne L10
    cmp cmp byte ptr [edi + 1], 67
    jne L11
    cmp cmp byte ptr [edi + 2], 95
    jne L12
    push push 01017C68Ch
    push push edi
    call sub_10101099
    mov mov ebx, eax
    test test ebx, ebx
    pop pop ecx
    pop pop ecx
    je L13
    sub sub eax, edi
    mov mov dword ptr [ebp - 24], eax
    je sub_100F8377
    cmp cmp byte ptr [ebx], 59
    je sub_100F8380
    mov mov dword ptr [ebp - 28], 1
    mov mov esi, 0101A47CCh
    jmp L2
    mov mov eax, dword ptr [ebp - 24]
    push push eax
    push push edi
    push push dword ptr [esi]
    call sub_10101093
    add add esp, 12
    test test eax, eax
    jne L6
    push push dword ptr [esi]
    call sub_100FA2C1
    cmp cmp dword ptr [ebp - 24], eax
    pop pop ecx
    je L9
    inc inc dword ptr [ebp - 28]
    add add esi, 12
    cmp cmp esi, 0101A47FCh
    jle L5
    inc inc ebx
    push push 010195820h
    push push ebx
    call sub_101003D1
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    pop pop ecx
    jne L14
    cmp cmp byte ptr [ebx], 59
    jne sub_100F83D5
    mov mov esi, dword ptr [ebp - 28]
    cmp cmp esi, 5
    jg sub_100F83AC
    push push edi
    lea lea eax, [ebp - 16]
    push push ebx
    push push eax
    call sub_100F5EF1
    lea lea eax, [ebp - 16]
    push push eax
    mov mov byte ptr [ebp + edi - 16], 0
    call sub_100F801D
    add add esp, 16
    test test eax, eax
    je sub_100F83CC
    inc inc dword ptr [ebp - 20]
    add add edi, ebx
    cmp cmp byte ptr [edi], 0
    je sub_100F83E7
    inc inc edi
    cmp cmp byte ptr [edi], 0
    jne L8
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 20], esi
    je sub_100F8406
    call sub_100F7E29
    mov mov esi, eax
    mov mov eax, esi
    mov mov ecx, dword ptr [ebp + 116]
    pop pop edi
    pop pop esi
    pop pop ebx
    call sub_10100E92
    add add ebp, 120
    leave leave
    ret ret
    xor xor eax, eax
    jmp sub_100F8425
    push push ebx
    push push ebx
    push push ebx
L2:
    lea lea eax, [ebp - 16]
    push push eax
    push push edi
    call sub_100F7F0D
    mov mov esi, eax
    add add esp, 20
    cmp cmp esi, ebx
    je sub_100F8439
    mov mov edi, 0101A47C4h
    xor xor esi, esi
    mov mov ebx, edi
    cmp cmp ebx, edi
    je sub_100F84A6
    push push dword ptr [ebx]
    lea lea eax, [ebp - 16]
    push push eax
L4:
    call sub_1010051C
L5:
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je sub_100F84B4
L7:
    lea lea eax, [ebp - 16]
    push push eax
    call sub_100F8099
    test test eax, eax
    pop pop ecx
    jne sub_100F84C2
    and and dword ptr [ebp - 24], eax
    jmp sub_100F84CA
    inc inc dword ptr [ebp - 20]
L8:
    add add ebx, 12
    inc inc esi
L9:
    cmp cmp ebx, 0101A4800h
    jle sub_100F84AE
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 24], edi
    je sub_100F8511
    call sub_100F7EA3
    push push dword ptr [g_101A47C4]
    mov mov esi, eax
    call sub_100F868D
    pop pop ecx
    mov mov dword ptr [g_101A47C4], edi
    jmp sub_100F849E
    cmp cmp dword ptr [ebp - 20], edi
    jne sub_100F84A0
    xor xor esi, esi
    jmp sub_100F84AE
__setlocale_lk ENDP
END
