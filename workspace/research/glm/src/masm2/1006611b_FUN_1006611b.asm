.686
.MODEL FLAT, C
EXTRN sub_10063A3E:PROC
EXTRN sub_10065186:PROC
EXTRN sub_100652B1:PROC
EXTRN sub_100653E2:PROC
EXTRN sub_10065542:PROC
EXTRN sub_10066417:PROC
EXTRN sub_10066425:PROC
EXTRN sub_10066447:PROC
EXTRN sub_10066462:PROC
EXTRN sub_1006646E:PROC
EXTRN sub_1006647B:PROC
EXTRN sub_100664C0:PROC
EXTRN sub_10066505:PROC
EXTRN sub_1006650C:PROC
EXTRN sub_10066555:PROC
EXTRN sub_10066557:PROC
EXTRN sub_10066575:PROC
EXTRN sub_100665B9:PROC
EXTRN sub_100665C3:PROC
EXTRN sub_100665C8:PROC
EXTRN sub_100665CB:PROC
EXTRN sub_100665D5:PROC
EXTRN sub_100665E7:PROC
EXTRN sub_1006661A:PROC
EXTRN sub_10066631:PROC
EXTRN sub_1006664C:PROC
EXTRN sub_10067D4C:PROC
EXTRN sub_1006801D:PROC
EXTRN sub_10068732:PROC
EXTRN sub_10068754:PROC
EXTRN sub_10068819:PROC
EXTRN sub_100688E6:PROC
EXTRN sub_10082BA5:PROC
EXTRN sub_10082CD0:PROC
EXTRN sub_100F787B:PROC
.CODE
FUN_1006611b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    push push edi
    push push 20
    mov mov ebx, ecx
    call sub_100F787B
    xor xor edi, edi
    cmp cmp eax, edi
    pop pop ecx
    je L0
    push push edi
    push push edi
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
    call sub_10063A3E
    mov mov dword ptr [ebp + 8], eax
    jmp L1
    mov mov dword ptr [ebp + 8], edi
    mov mov edx, dword ptr [ebp + 8]
    cmp cmp edx, edi
    je L17
    cmp cmp dword ptr [ebp + 12], edi
    je L11
    mov mov ecx, dword ptr [ebx + 026Ch]
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, dword ptr [ecx + 4]
    jae L12
    cmp cmp byte ptr [eax], 40
    jne L13
    lea lea eax, [edx + 4]
    mov mov dword ptr [ebp + 12], eax
    lea lea eax, [ebx + 0278h]
    push push eax
    push push dword ptr [ebx + 0298h]
    call sub_10068732
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_10066425
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
    call sub_10068754
    mov mov esi, eax
    test test esi, esi
    jl sub_10066447
    cmp cmp dword ptr [edi], 9
    jne L14
    mov mov eax, dword ptr [ebp + 8]
    add add eax, 4
    mov mov eax, dword ptr [eax]
    jmp L3
    mov mov esi, dword ptr [eax + 24]
    mov mov edi, dword ptr [ebx + 0280h]
    mov mov dl, byte ptr [edi]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne L5
    test test cl, cl
    je L5
    mov mov dl, byte ptr [edi + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne L6
    inc inc edi
    inc inc edi
    inc inc esi
    inc inc esi
    test test cl, cl
    jne L2
    xor xor ecx, ecx
    jmp L7
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je L8
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    jne L4
    jmp L10
    push push dword ptr [ebx + 0280h]
    lea lea eax, [ebx + 0278h]
    push push 01010C8D0h
    push push 05E7h
    push push eax
    lea lea eax, [ebx + 24]
    push push eax
    call sub_10067D4C
    add add esp, 20
    push push 48
    call sub_10065186
    test test eax, eax
    je L15
    lea lea edx, [ebx + 0278h]
    push push edx
    mov mov ecx, eax
    call sub_10082BA5
    jmp L16
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ecx], eax
    je sub_100664C0
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
    add add eax, 12
    mov mov dword ptr [ebp + 12], eax
    call sub_10068819
    mov mov esi, eax
    test test esi, esi
    jl sub_1006650C
    cmp cmp dword ptr [edi], 1
    jne sub_10066417
    push push 2
    lea lea edi, [ebx + 0280h]
    mov mov esi, 01019581Ch
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L9
    push push 2
    lea lea edi, [ebx + 0280h]
    mov mov esi, 010195540h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L2:
    je sub_1006647B
    lea lea eax, [ebx + 0278h]
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, 12
    je sub_10066462
    cmp cmp ecx, 13
    jne sub_1006646E
    mov mov dword ptr [ebx + 64], 1
    push push eax
    push push 05DCh
    lea lea ecx, [ebx + 24]
    call sub_1006801D
    mov mov dword ptr [ebx + 68], 1
    mov mov esi, 080004005h
    jmp sub_10066575
    mov mov eax, dword ptr [ebp + 8]
    add add eax, 8
    mov mov dword ptr [ebp + 12], eax
    mov mov eax, dword ptr [ebx + 100]
    test test eax, eax
    je sub_10066505
    lea lea esi, [eax + 16]
    push push 8
    lea lea edi, [ebx + 0278h]
    pop pop ecx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [eax + 12]
    mov mov dword ptr [ebx + 100], ecx
    and and dword ptr [eax + 12], 0
    mov mov eax, dword ptr [ebx + 026Ch]
    mov mov ecx, dword ptr [eax + 24]
    mov mov dword ptr [ebx + 0288h], ecx
    mov mov eax, dword ptr [eax + 28]
    mov mov dword ptr [ebx + 028Ch], eax
L11:
    jmp sub_10066555
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea eax, [ebx + 0278h]
    push push eax
    push push dword ptr [ebx + 0298h]
    call sub_100688E6
L13:
    mov mov esi, eax
    test test esi, esi
    jl sub_100665D5
    mov mov eax, dword ptr [ebx + 0278h]
    cmp cmp eax, 12
    je sub_100665C3
    cmp cmp eax, 13
    je sub_100665C8
    push push 48
    call sub_100652B1
    test test eax, eax
    je sub_100665B9
    lea lea edx, [ebx + 0278h]
    push push edx
    mov mov ecx, eax
    call sub_10082CD0
    jmp sub_100665CB
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ecx], eax
    je sub_100665E7
    add add eax, 12
    jmp sub_10066557
    mov mov esi, 08007000Eh
    jmp sub_1006661A
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    mov mov dword ptr [ebx + 64], 1
    call sub_10065542
    mov mov esi, eax
    test test esi, esi
    jl sub_10066631
    and and dword ptr [ebp + 8], 0
    xor xor esi, esi
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    je sub_1006664C
    push push 1
    call sub_100653E2
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
L17:
    pop pop ebp
    ret ret 8
FUN_1006611b ENDP
END
