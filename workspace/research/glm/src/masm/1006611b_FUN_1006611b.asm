.686
.MODEL FLAT, C
EXTRN sub_10063A3E:PROC
EXTRN sub_10065186:PROC
EXTRN sub_100652B1:PROC
EXTRN sub_100653E2:PROC
EXTRN sub_10065542:PROC
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
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 20
    mov ebx, ecx
    call sub_100F787B
    xor edi, edi
    cmp eax, edi
    pop ecx
    je L0
    push edi
    push edi
    push dword ptr [ebp + 8]
    mov ecx, eax
    call sub_10063A3E
    mov dword ptr [ebp + 8], eax
    jmp L1
L0:
    mov dword ptr [ebp + 8], edi
L1:
    mov edx, dword ptr [ebp + 8]
    cmp edx, edi
    je L22
    cmp dword ptr [ebp + 12], edi
    je L16
    mov ecx, dword ptr [ebx + 00000026Ch]
    mov eax, dword ptr [ecx]
    cmp eax, dword ptr [ecx + 4]
    jae L16
    cmp byte ptr [eax], 40
    jne L16
    lea eax, [edx + 4]
    mov dword ptr [ebp + 12], eax
    lea eax, [ebx + 000000278h]
    push eax
    push dword ptr [ebx + 000000298h]
    call sub_10068732
    mov esi, eax
    cmp esi, edi
    jl L24
L2:
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    call sub_10068754
    mov esi, eax
    test esi, esi
    jl L24
    cmp dword ptr [edi], 9
    jne L13
    mov eax, dword ptr [ebp + 8]
    add eax, 4
    mov eax, dword ptr [eax]
    jmp L8
L3:
    mov esi, dword ptr [eax + 24]
    mov edi, dword ptr [ebx + 000000280h]
L4:
    mov dl, byte ptr [edi]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L6
    test cl, cl
    je L5
    mov dl, byte ptr [edi + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L6
    inc edi
    inc edi
    inc esi
    inc esi
    test cl, cl
    jne L4
L5:
    xor ecx, ecx
    jmp L7
L6:
    sbb ecx, ecx
    sbb ecx, -1
L7:
    test ecx, ecx
    je L9
    mov eax, dword ptr [eax + 12]
L8:
    test eax, eax
    jne L3
    jmp L10
L9:
    push dword ptr [ebx + 000000280h]
    lea eax, [ebx + 000000278h]
    push 01010C8D0h
    push 0000005E7h
    push eax
    lea eax, [ebx + 24]
    push eax
    call sub_10067D4C
    add esp, 20
L10:
    push 48
    call sub_10065186
    test eax, eax
    je L11
    lea edx, [ebx + 000000278h]
    push edx
    mov ecx, eax
    call sub_10082BA5
    jmp L12
L11:
    xor eax, eax
L12:
    test eax, eax
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    je L22
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    add eax, 12
    mov dword ptr [ebp + 12], eax
    call sub_10068819
    mov esi, eax
    test esi, esi
    jl L24
    cmp dword ptr [edi], 1
    jne L13
    push 2
    lea edi, [ebx + 000000280h]
    mov esi, 01019581Ch
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L2
    push 2
    lea edi, [ebx + 000000280h]
    mov esi, 010195540h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L16
L13:
    lea eax, [ebx + 000000278h]
    mov ecx, dword ptr [eax]
    cmp ecx, 12
    je L14
    cmp ecx, 13
    jne L15
L14:
    mov dword ptr [ebx + 64], 1
L15:
    push eax
    push 0000005DCh
    lea ecx, [ebx + 24]
    call sub_1006801D
    mov dword ptr [ebx + 68], 1
    mov esi, 080004005h
    jmp L24
L16:
    mov eax, dword ptr [ebp + 8]
    add eax, 8
L17:
    mov dword ptr [ebp + 12], eax
    mov eax, dword ptr [ebx + 100]
    test eax, eax
    je L18
    lea esi, [eax + 16]
    push 8
    lea edi, [ebx + 000000278h]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [ebx + 100], ecx
    and dword ptr [eax + 12], 0
    mov eax, dword ptr [ebx + 00000026Ch]
    mov ecx, dword ptr [eax + 24]
    mov dword ptr [ebx + 000000288h], ecx
    mov eax, dword ptr [eax + 28]
    mov dword ptr [ebx + 00000028Ch], eax
    jmp L19
L18:
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea eax, [ebx + 000000278h]
    push eax
    push dword ptr [ebx + 000000298h]
    call sub_100688E6
    mov esi, eax
    test esi, esi
    jl L24
L19:
    mov eax, dword ptr [ebx + 000000278h]
    cmp eax, 12
    je L23
    cmp eax, 13
    je L23
    push 48
    call sub_100652B1
    test eax, eax
    je L20
    lea edx, [ebx + 000000278h]
    push edx
    mov ecx, eax
    call sub_10082CD0
    jmp L21
L20:
    xor eax, eax
L21:
    test eax, eax
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    je L22
    add eax, 12
    jmp L17
L22:
    mov esi, 08007000Eh
    jmp L24
L23:
    push dword ptr [ebp + 8]
    mov ecx, ebx
    mov dword ptr [ebx + 64], 1
    call sub_10065542
    mov esi, eax
    test esi, esi
    jl L24
    and dword ptr [ebp + 8], 0
    xor esi, esi
L24:
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L25
    push 1
    call sub_100653E2
L25:
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_1006611b ENDP
END
