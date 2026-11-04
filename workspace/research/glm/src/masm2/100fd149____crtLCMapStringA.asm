.686
.MODEL FLAT, C
EXTRN sub_100F8712:PROC
EXTRN sub_100F8720:PROC
EXTRN sub_100F8918:PROC
EXTRN sub_100F89E6:PROC
EXTRN sub_100F8B14:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC583:PROC
EXTRN sub_100FC651:PROC
EXTRN sub_100FC77D:PROC
EXTRN sub_100FD4CD:PROC
EXTRN sub_100FD4EC:PROC
EXTRN sub_100FD4FB:PROC
EXTRN sub_100FD4FF:PROC
EXTRN sub_100FD504:PROC
EXTRN sub_100FD51F:PROC
EXTRN sub_100FD529:PROC
EXTRN sub_100FD573:PROC
EXTRN sub_100FD583:PROC
EXTRN sub_100FD58D:PROC
EXTRN sub_100FD592:PROC
EXTRN sub_100FD5C6:PROC
EXTRN sub_100FD5E2:PROC
EXTRN sub_100FD61B:PROC
EXTRN sub_100FD635:PROC
EXTRN sub_100FD666:PROC
EXTRN sub_100FD68B:PROC
EXTRN sub_100FD74B:PROC
EXTRN sub_100FD754:PROC
EXTRN sub_100FD76D:PROC
EXTRN sub_100FD78E:PROC
EXTRN sub_100FD797:PROC
EXTRN sub_100FD7BA:PROC
EXTRN sub_100FD7EF:PROC
EXTRN sub_100FD819:PROC
EXTRN sub_10100634:PROC
EXTRN sub_1010066A:PROC
EXTRN sub_101060DB:PROC
EXTRN sub_101061A9:PROC
EXTRN sub_101062DE:PROC
EXTRN sub_10108209:PROC
EXTRN sub_10108277:PROC
EXTRN sub_10108335:PROC
EXTRN EXTRN fp_1010C044:DWORD:DWORD
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C138:DWORD:DWORD
EXTRN EXTRN fp_1010C13C:DWORD:DWORD
EXTRN EXTRN fp_1010C140:DWORD:DWORD
EXTRN EXTRN g_101AE004:DWORD:DWORD
EXTRN EXTRN g_101AE198:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
.CODE
___crtLCMapStringA PROC
    push push 56
    push push 01017C970h
    call sub_100FB61C
    xor xor ebx, ebx
    cmp cmp dword ptr [g_101AE004], ebx
    jne L0
    push push ebx
    push push ebx
    xor xor esi, esi
    inc inc esi
    push push esi
    push push 01017C96Ch
    push push 0100h
    push push ebx
    call dword ptr [fp_1010C140]
    test test eax, eax
    je L1
    mov mov dword ptr [g_101AE004], esi
    jmp L2
    call dword ptr [fp_1010C054]
    cmp cmp eax, 120
    jne L3
    mov mov dword ptr [g_101AE004], 2
    cmp cmp dword ptr [ebp + 20], ebx
    jle L5
    mov mov ecx, dword ptr [ebp + 20]
    mov mov eax, dword ptr [ebp + 16]
    dec dec ecx
    cmp cmp byte ptr [eax], bl
    je L6
    inc inc eax
    cmp cmp ecx, ebx
    jne L4
    or or ecx, -1
    or or eax, -1
    sub sub eax, ecx
    add add dword ptr [ebp + 20], eax
    mov mov eax, dword ptr [g_101AE004]
    cmp cmp eax, 2
    je L10
    cmp cmp eax, ebx
    je L11
    cmp cmp eax, 1
L2:
    jne L13
    xor xor edi, edi
    mov mov dword ptr [ebp - 44], edi
L3:
    mov mov dword ptr [ebp - 56], ebx
    mov mov dword ptr [ebp - 52], ebx
    cmp cmp dword ptr [ebp + 32], ebx
    jne L7
    mov mov eax, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp + 32], eax
    push push ebx
    push push ebx
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 36], ebx
    setne setne al
    lea lea eax, [eax*8 + 1]
L4:
    push push eax
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    mov mov esi, eax
    mov mov dword ptr [ebp - 48], esi
    cmp cmp esi, ebx
    je L14
    mov mov dword ptr [ebp - 4], 1
    lea lea eax, [esi + esi]
    add add eax, 3
    and and eax, -4
    call sub_100F8918
    mov mov dword ptr [ebp - 24], esp
    mov mov eax, esp
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    jmp L8
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_101060DB
    xor xor ebx, ebx
    mov mov dword ptr [ebp - 28], ebx
    or or dword ptr [ebp - 4], -1
    mov mov edi, dword ptr [ebp - 44]
    mov mov esi, dword ptr [ebp - 48]
    cmp cmp dword ptr [ebp - 28], ebx
    jne L9
    lea lea eax, [esi + esi]
    push push eax
    call sub_100FC583
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, ebx
    je sub_100FD4FF
    mov mov dword ptr [ebp - 56], 1
    push push esi
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push 1
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C13C]
    test test eax, eax
    je sub_100FD4CD
    push push ebx
    push push ebx
    push push esi
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C140]
    mov mov edi, eax
    mov mov dword ptr [ebp - 44], edi
    cmp cmp edi, ebx
    je sub_100FD4EC
    test test byte ptr [ebp + 13], 4
    je L12
    cmp cmp dword ptr [ebp + 28], ebx
    je sub_100FD4FB
    cmp cmp edi, dword ptr [ebp + 28]
    jg sub_100FD504
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push esi
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C140]
    jmp sub_100FD51F
    mov mov dword ptr [ebp - 4], 2
    lea lea eax, [edi + edi]
    add add eax, 3
    and and eax, -4
    call sub_100F89E6
    mov mov dword ptr [ebp - 24], esp
    mov mov eax, esp
    mov mov dword ptr [ebp - 32], eax
    or or dword ptr [ebp - 4], -1
    jmp sub_100FD4EC
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_101061A9
    xor xor ebx, ebx
    mov mov dword ptr [ebp - 32], ebx
    or or dword ptr [ebp - 4], -1
    mov mov edi, dword ptr [ebp - 44]
    mov mov esi, dword ptr [ebp - 48]
    cmp cmp dword ptr [ebp - 32], ebx
    jne sub_100FD529
    lea lea eax, [edi + edi]
    push push eax
    call sub_100FC651
    pop pop ecx
    mov mov dword ptr [ebp - 32], eax
    cmp cmp eax, ebx
    je sub_100FD573
    mov mov dword ptr [ebp - 52], 1
    push push edi
    push push dword ptr [ebp - 32]
    push push esi
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp + 12]
L8:
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C140]
    test test eax, eax
    je sub_100FD592
    push push ebx
    push push ebx
    cmp cmp dword ptr [ebp + 28], ebx
    jne sub_100FD583
    push push ebx
    push push ebx
    jmp sub_100FD58D
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push edi
    push push dword ptr [ebp - 32]
    push push ebx
    push push dword ptr [ebp + 32]
    call dword ptr [fp_1010C044]
    mov mov edi, eax
    cmp cmp dword ptr [ebp - 52], ebx
    je sub_100FD5C6
    push push dword ptr [ebp - 32]
    call sub_100F8712
    pop pop ecx
    cmp cmp dword ptr [ebp - 56], ebx
    je sub_100FD5E2
L9:
    push push dword ptr [ebp - 28]
    call sub_100F8720
    pop pop ecx
    mov mov eax, edi
    jmp sub_100FD754
    mov mov dword ptr [ebp - 40], ebx
    xor xor edi, edi
    mov mov dword ptr [ebp - 60], ebx
    cmp cmp dword ptr [ebp + 8], ebx
    jne sub_100FD61B
    mov mov eax, dword ptr [g_101AE198]
    mov mov dword ptr [ebp + 8], eax
    cmp cmp dword ptr [ebp + 32], ebx
    jne sub_100FD635
    mov mov eax, dword ptr [g_101AE1A8]
    mov mov dword ptr [ebp + 32], eax
    push push dword ptr [ebp + 8]
    call sub_10108209
    pop pop ecx
    mov mov dword ptr [ebp - 64], eax
    cmp cmp eax, -1
    jne sub_100FD666
    xor xor eax, eax
    jmp sub_100FD78E
    cmp cmp eax, dword ptr [ebp + 32]
    je sub_100FD76D
    push push ebx
    push push ebx
    lea lea ecx, [ebp + 20]
    push push ecx
    push push dword ptr [ebp + 16]
    push push eax
    push push dword ptr [ebp + 32]
    call sub_10108277
    add add esp, 24
    mov mov dword ptr [ebp - 40], eax
    cmp cmp eax, ebx
    je sub_100FD68B
    push push ebx
    push push ebx
    push push dword ptr [ebp + 20]
    push push eax
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C138]
    mov mov esi, eax
    mov mov dword ptr [ebp - 36], esi
    cmp cmp esi, ebx
    je sub_100FD797
    mov mov dword ptr [ebp - 4], ebx
    add add eax, 3
L11:
    and and eax, -4
    call sub_100F8B14
    mov mov dword ptr [ebp - 24], esp
    mov mov edi, esp
    mov mov dword ptr [ebp - 68], edi
    push push esi
    push push ebx
    push push edi
    call sub_10100634
    add add esp, 12
    jmp sub_100FD74B
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_101062DE
    xor xor ebx, ebx
    xor xor edi, edi
    or or dword ptr [ebp - 4], -1
    cmp cmp edi, ebx
    jne sub_100FD78E
    push push dword ptr [ebp - 36]
    call sub_100FC77D
    pop pop ecx
    mov mov edi, eax
    cmp cmp edi, ebx
    je sub_100FD7BA
    push push dword ptr [ebp - 36]
    push push ebx
    push push edi
    call sub_1010066A
    add add esp, 12
    mov mov dword ptr [ebp - 60], 1
    push push dword ptr [ebp - 36]
    push push edi
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp - 40]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C138]
    mov mov dword ptr [ebp - 36], eax
    cmp cmp eax, ebx
    jne sub_100FD7EF
    xor xor esi, esi
    jmp sub_100FD819
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    lea lea eax, [ebp - 36]
L14:
    push push eax
    push push edi
    push push dword ptr [ebp + 32]
    push push dword ptr [ebp - 64]
    call sub_10108335
    add add esp, 24
    mov mov esi, eax
    neg neg esi
    sbb sbb esi, esi
    neg neg esi
___crtLCMapStringA ENDP
END
