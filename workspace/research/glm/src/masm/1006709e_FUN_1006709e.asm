.686
.MODEL FLAT, C
EXTRN sub_10063E05:PROC
EXTRN sub_100651AD:PROC
EXTRN sub_1006560F:PROC
EXTRN sub_10066AE2:PROC
EXTRN sub_100678CF:PROC
EXTRN sub_10067D68:PROC
EXTRN sub_10067EFB:PROC
EXTRN sub_10068735:PROC
EXTRN sub_100687BA:PROC
EXTRN sub_10068822:PROC
EXTRN g_101ABD78:DWORD
.CODE
FUN_1006709e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    mov ebx, ecx
    jmp L15
L0:
    mov eax, dword ptr [ebx + 104]
    test eax, eax
    je L1
    cmp dword ptr [eax + 8], 0
    je L16
L1:
    mov edx, dword ptr [ebx + 100]
    test edx, edx
    je L2
    mov eax, dword ptr [ebp + 8]
    push 8
    lea esi, [edx + 16]
    pop ecx
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [ebx + 100]
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [ebx + 100], ecx
    and dword ptr [edx + 12], 0
    mov ecx, dword ptr [ebx + 00000026Ch]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [eax + 16], ecx
    mov ecx, dword ptr [ebx + 00000026Ch]
    mov ecx, dword ptr [ecx + 28]
    mov dword ptr [eax + 20], ecx
    and dword ptr [ebx + 64], 0
    jmp L3
L2:
    push dword ptr [ebp + 8]
    mov ecx, dword ptr [ebx + 00000026Ch]
    push dword ptr [ebx + 000000298h]
    call sub_10068735
    test eax, eax
    jl L24
    mov eax, dword ptr [ebp + 8]
L3:
    mov ecx, dword ptr [eax]
    cmp ecx, 1
    jne L10
    push 2
    lea edi, [eax + 8]
    mov esi, 01010C870h
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L10
    xor ecx, ecx
    cmp dword ptr [ebx + 64], ecx
    je L10
    mov dword ptr [g_101ABD78], ebx
    mov eax, dword ptr [ebx + 80]
    mov dword ptr [ebx + 64], ecx
    mov dword ptr [ebx + 68], ecx
    mov dword ptr [ebx + 76], 1
    mov dword ptr [ebx + 84], eax
    call sub_10066AE2
    xor edi, edi
    inc edi
    test eax, eax
    je L4
    mov dword ptr [ebx + 68], edi
L4:
    xor eax, eax
    cmp dword ptr [ebx + 64], eax
    mov dword ptr [ebx + 92], eax
    jne L7
    cmp dword ptr [ebx + 68], eax
    jne L7
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_100687BA
    test eax, eax
    jl L24
    mov esi, dword ptr [esi]
    cmp esi, 12
    je L6
    cmp esi, 13
    je L6
    cmp dword ptr [ebx + 80], 0
    je L5
    push 01010C9D4h
    push 0000005DDh
    push dword ptr [ebp + 8]
    lea eax, [ebx + 24]
    push eax
    call sub_10067D68
    add esp, 16
L5:
    mov dword ptr [ebx + 68], edi
    jmp L7
L6:
    mov dword ptr [ebx + 64], edi
L7:
    cmp dword ptr [ebx + 64], 0
    jne L8
    mov ecx, dword ptr [ebx + 00000026Ch]
    call sub_100678CF
    mov ecx, dword ptr [ebx + 00000026Ch]
    and dword ptr [ebx + 100], 0
    lea eax, [ebx + 000000278h]
    push eax
    push dword ptr [ebx + 000000298h]
    call sub_10068822
    test eax, eax
    jl L24
    mov dword ptr [ebx + 64], edi
L8:
    mov eax, dword ptr [ebx + 000000268h]
    mov dword ptr [ebx + 00000026Ch], eax
    mov eax, dword ptr [ebx + 84]
    test eax, eax
    mov dword ptr [ebx + 80], eax
    je L15
    mov edi, dword ptr [ebp + 8]
    push 8
    lea esi, [ebx + 000000278h]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov eax, dword ptr [ebx + 000000268h]
    cmp dword ptr [eax + 108], 0
    je L9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [eax], 12
L9:
    mov eax, dword ptr [ebx + 72]
    neg eax
    sbb eax, eax
    and eax, 080004005h
    jmp L24
L10:
    mov ecx, dword ptr [eax]
    cmp ecx, 13
    je L18
    cmp ecx, 9
    jne L12
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    push dword ptr [eax + 8]
    mov ecx, ebx
    call sub_100651AD
    test eax, eax
    je L11
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006560F
    test eax, eax
    jne L15
L11:
    mov eax, dword ptr [ebp + 8]
L12:
    cmp dword ptr [eax], 9
    jne L14
    mov esi, dword ptr [eax + 8]
    push 9
    mov edi, 01010C9C8h
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L13
    mov dword ptr [eax], 10
    mov ecx, dword ptr [ebx + 00000026Ch]
    mov ecx, dword ptr [ecx + 24]
    test ecx, ecx
    mov dword ptr [eax + 8], ecx
    jne L14
    mov dword ptr [eax + 8], 01019166Eh
    jmp L14
L13:
    mov esi, dword ptr [eax + 8]
    push 9
    mov edi, 01010C804h
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L14
    mov dword ptr [eax], 2
    mov ecx, dword ptr [ebx + 00000026Ch]
    mov ecx, dword ptr [ecx + 28]
    mov dword ptr [eax + 8], ecx
L14:
    xor ecx, ecx
    cmp dword ptr [eax], 12
    sete cl
    xor edx, edx
    cmp dword ptr [ebx + 80], edx
    mov dword ptr [ebx + 64], ecx
    jne L20
L15:
    cmp dword ptr [ebx + 72], 0
    je L0
    mov eax, 080004005h
    jmp L17
L16:
    xor eax, eax
L17:
    add ebx, 00000026Ch
    mov ecx, dword ptr [ebx]
    mov edx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx + 16], edx
    mov edx, dword ptr [ebx]
    mov edx, dword ptr [edx + 28]
    mov dword ptr [ecx + 20], edx
    mov dword ptr [ecx], 13
    jmp L24
L18:
    mov ecx, dword ptr [ebx + 000000268h]
    cmp dword ptr [ecx + 56], 0
    je L19
    push 01010C9B0h
    push 0000005DEh
    push eax
    lea eax, [ebx + 24]
    push eax
    call sub_10067EFB
    add esp, 16
L19:
    mov ecx, dword ptr [ebx + 000000268h]
    cmp dword ptr [ecx + 108], 0
    je L23
    mov eax, dword ptr [ecx + 108]
    mov dword ptr [ebx + 000000268h], eax
    and dword ptr [ecx + 108], 0
    push 1
    call sub_10063E05
    mov eax, dword ptr [ebx + 000000268h]
    mov dword ptr [ebx + 00000026Ch], eax
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [eax], 12
    mov dword ptr [ebx + 64], 1
    jmp L23
L20:
    mov ecx, dword ptr [ebx + 104]
    cmp ecx, edx
    je L23
    cmp dword ptr [ecx + 4], edx
    je L23
    cmp dword ptr [eax], 1
    jne L22
    cmp byte ptr [eax + 9], 0
    jne L22
    cmp byte ptr [eax + 8], 123
    jne L21
    inc dword ptr [ecx + 8]
L21:
    cmp byte ptr [eax + 8], 125
    jne L22
    mov ecx, dword ptr [ebx + 104]
    cmp dword ptr [ecx + 8], edx
    je L22
    dec dword ptr [ecx + 8]
L22:
    mov ecx, dword ptr [ebx + 104]
    cmp dword ptr [ecx + 8], edx
    jne L23
    mov dword ptr [eax], 13
L23:
    xor eax, eax
L24:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_1006709e ENDP
END
