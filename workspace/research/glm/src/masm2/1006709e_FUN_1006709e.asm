.686
.MODEL FLAT, C
EXTRN sub_10063E05:PROC
EXTRN sub_100651AD:PROC
EXTRN sub_1006560F:PROC
EXTRN sub_10066AE2:PROC
EXTRN sub_100673E9:PROC
EXTRN sub_1006745A:PROC
EXTRN sub_10067461:PROC
EXTRN sub_10067474:PROC
EXTRN sub_1006748B:PROC
EXTRN sub_100674D9:PROC
EXTRN sub_100674DF:PROC
EXTRN sub_100674EB:PROC
EXTRN sub_100674F9:PROC
EXTRN sub_10067501:PROC
EXTRN sub_10067512:PROC
EXTRN sub_1006751B:PROC
EXTRN sub_1006752C:PROC
EXTRN sub_10067547:PROC
EXTRN sub_1006758E:PROC
EXTRN sub_10067598:PROC
EXTRN sub_10067602:PROC
EXTRN sub_10067607:PROC
EXTRN sub_1006767A:PROC
EXTRN sub_100676A7:PROC
EXTRN sub_100676D7:PROC
EXTRN sub_100676D9:PROC
EXTRN sub_100676DC:PROC
EXTRN sub_100676E0:PROC
EXTRN sub_100676E2:PROC
EXTRN sub_100676E5:PROC
EXTRN sub_100676F1:PROC
EXTRN sub_100676F9:PROC
EXTRN sub_10067712:PROC
EXTRN sub_100678CF:PROC
EXTRN sub_10067D68:PROC
EXTRN sub_10067EFB:PROC
EXTRN sub_10068735:PROC
EXTRN sub_100687BA:PROC
EXTRN sub_10068822:PROC
EXTRN EXTRN g_101ABD78:DWORD:DWORD
.CODE
FUN_1006709e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov ebx, ecx
    jmp L13
    mov mov eax, dword ptr [ebx + 104]
    test test eax, eax
    je L0
    cmp cmp dword ptr [eax + 8], 0
    je L15
    mov mov edx, dword ptr [ebx + 100]
    test test edx, edx
    je L1
    mov mov eax, dword ptr [ebp + 8]
    push push 8
    lea lea esi, [edx + 16]
    pop pop ecx
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebx + 100]
    mov mov ecx, dword ptr [ecx + 12]
    mov mov dword ptr [ebx + 100], ecx
    and and dword ptr [edx + 12], 0
    mov mov ecx, dword ptr [ebx + 026Ch]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 16], ecx
    mov mov ecx, dword ptr [ebx + 026Ch]
    mov mov ecx, dword ptr [ecx + 28]
    mov mov dword ptr [eax + 20], ecx
    and and dword ptr [ebx + 64], 0
    jmp L2
    push push dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebx + 026Ch]
    push push dword ptr [ebx + 0298h]
    call sub_10068735
    test test eax, eax
    jl sub_1006745A
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, 1
    jne L9
    push push 2
    lea lea edi, [eax + 8]
    mov mov esi, 01010C870h
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L10
    xor xor ecx, ecx
    cmp cmp dword ptr [ebx + 64], ecx
    je L11
    mov mov dword ptr [g_101ABD78], ebx
    mov mov eax, dword ptr [ebx + 80]
    mov mov dword ptr [ebx + 64], ecx
    mov mov dword ptr [ebx + 68], ecx
    mov mov dword ptr [ebx + 76], 1
    mov mov dword ptr [ebx + 84], eax
    call sub_10066AE2
    xor xor edi, edi
    inc inc edi
    test test eax, eax
    je L3
    mov mov dword ptr [ebx + 68], edi
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 64], eax
    mov mov dword ptr [ebx + 92], eax
    jne L4
    cmp cmp dword ptr [ebx + 68], eax
    jne L5
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_100687BA
    test test eax, eax
    jl sub_100674DF
    mov mov esi, dword ptr [esi]
    cmp cmp esi, 12
    je L6
    cmp cmp esi, 13
    je L7
    cmp cmp dword ptr [ebx + 80], 0
    je L8
    push push 01010C9D4h
    push push 05DDh
    push push dword ptr [ebp + 8]
    lea lea eax, [ebx + 24]
    push push eax
    call sub_10067D68
    add add esp, 16
    mov mov dword ptr [ebx + 68], edi
    jmp L12
    mov mov dword ptr [ebx + 64], edi
    cmp cmp dword ptr [ebx + 64], 0
    jne L16
    mov mov ecx, dword ptr [ebx + 026Ch]
    call sub_100678CF
    mov mov ecx, dword ptr [ebx + 026Ch]
    and and dword ptr [ebx + 100], 0
    lea lea eax, [ebx + 0278h]
    push push eax
    push push dword ptr [ebx + 0298h]
    call sub_10068822
    test test eax, eax
    jl sub_10067547
    mov mov dword ptr [ebx + 64], edi
    mov mov eax, dword ptr [ebx + 0268h]
    mov mov dword ptr [ebx + 026Ch], eax
    mov mov eax, dword ptr [ebx + 84]
    test test eax, eax
    mov mov dword ptr [ebx + 80], eax
    je sub_1006748B
    mov mov edi, dword ptr [ebp + 8]
    push push 8
    lea lea esi, [ebx + 0278h]
    pop pop ecx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov eax, dword ptr [ebx + 0268h]
    cmp cmp dword ptr [eax + 108], 0
    je sub_100673E9
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [eax], 12
    mov mov eax, dword ptr [ebx + 72]
    neg neg eax
    sbb sbb eax, eax
    and and eax, 080004005h
    jmp sub_10067598
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, 13
    je sub_10067501
    cmp cmp ecx, 9
    jne sub_10067461
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    push push dword ptr [eax + 8]
    mov mov ecx, ebx
    call sub_100651AD
    test test eax, eax
    je sub_10067474
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call sub_1006560F
    test test eax, eax
    jne sub_100674F9
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [eax], 9
    jne sub_100674EB
    mov mov esi, dword ptr [eax + 8]
    push push 9
    mov mov edi, 01010C9C8h
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100674D9
    mov mov dword ptr [eax], 10
    mov mov ecx, dword ptr [ebx + 026Ch]
    mov mov ecx, dword ptr [ecx + 24]
    test test ecx, ecx
    mov mov dword ptr [eax + 8], ecx
    jne sub_10067512
    mov mov dword ptr [eax + 8], 01019166Eh
    jmp sub_1006751B
    mov mov esi, dword ptr [eax + 8]
    push push 9
    mov mov edi, 01010C804h
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006752C
    mov mov dword ptr [eax], 2
    mov mov ecx, dword ptr [ebx + 026Ch]
    mov mov ecx, dword ptr [ecx + 28]
    mov mov dword ptr [eax + 8], ecx
    xor xor ecx, ecx
    cmp cmp dword ptr [eax], 12
    sete sete cl
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 80], edx
    mov mov dword ptr [ebx + 64], ecx
    jne sub_10067602
L11:
    cmp cmp dword ptr [ebx + 72], 0
    je L14
    mov mov eax, 080004005h
    jmp sub_1006758E
L13:
    xor xor eax, eax
    add add ebx, 026Ch
    mov mov ecx, dword ptr [ebx]
L14:
    mov mov edx, dword ptr [ecx + 24]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + 16], edx
    mov mov edx, dword ptr [ebx]
    mov mov edx, dword ptr [edx + 28]
    mov mov dword ptr [ecx + 20], edx
    mov mov dword ptr [ecx], 13
    jmp sub_1006767A
    mov mov ecx, dword ptr [ebx + 0268h]
    cmp cmp dword ptr [ecx + 56], 0
    je sub_10067607
    push push 01010C9B0h
    push push 05DEh
    push push eax
    lea lea eax, [ebx + 24]
    push push eax
    call sub_10067EFB
    add add esp, 16
    mov mov ecx, dword ptr [ebx + 0268h]
    cmp cmp dword ptr [ecx + 108], 0
    je sub_100676A7
    mov mov eax, dword ptr [ecx + 108]
    mov mov dword ptr [ebx + 0268h], eax
    and and dword ptr [ecx + 108], 0
    push push 1
    call sub_10063E05
    mov mov eax, dword ptr [ebx + 0268h]
    mov mov dword ptr [ebx + 026Ch], eax
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [eax], 12
    mov mov dword ptr [ebx + 64], 1
    jmp sub_100676D9
    mov mov ecx, dword ptr [ebx + 104]
    cmp cmp ecx, edx
    je sub_100676E0
    cmp cmp dword ptr [ecx + 4], edx
    je sub_100676E5
    cmp cmp dword ptr [eax], 1
    jne sub_100676DC
    cmp cmp byte ptr [eax + 9], 0
    jne sub_100676E2
    cmp cmp byte ptr [eax + 8], 123
    jne sub_100676D7
    inc inc dword ptr [ecx + 8]
    cmp cmp byte ptr [eax + 8], 125
    jne sub_100676F1
    mov mov ecx, dword ptr [ebx + 104]
    cmp cmp dword ptr [ecx + 8], edx
    je sub_100676F9
    dec dec dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ebx + 104]
    cmp cmp dword ptr [ecx + 8], edx
    jne sub_10067712
    mov mov dword ptr [eax], 13
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_1006709e ENDP
END
