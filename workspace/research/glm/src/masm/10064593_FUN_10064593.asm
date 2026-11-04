.686
.MODEL FLAT, C
EXTRN sub_10067AD3:PROC
EXTRN sub_10067F99:PROC
EXTRN sub_100686ED:PROC
EXTRN sub_10068730:PROC
EXTRN sub_10068816:PROC
EXTRN sub_10068859:PROC
EXTRN sub_1006895B:PROC
EXTRN sub_100689C8:PROC
EXTRN sub_10068A4C:PROC
EXTRN sub_100F7A56:PROC
EXTRN sub_100F7A7D:PROC
EXTRN sub_100F7AA1:PROC
EXTRN sub_100F7AC8:PROC
EXTRN sub_100F7BB9:PROC
EXTRN sub_100F7BC1:PROC
EXTRN sub_100F7BC8:PROC
.CODE
FUN_10064593 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp - 12], 0
    push ebx
    push esi
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 00000026Ch]
    push edi
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    call sub_100686ED
    mov esi, eax
    test esi, esi
    jl L18
    cmp dword ptr [edi], 1
    jne L16
    push 2
    lea esi, [ebx + 000000280h]
    mov edi, 010195544h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L16
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea eax, [ebx + 000000278h]
    push eax
    push dword ptr [ebx + 000000298h]
    call sub_10068730
    mov esi, eax
    test esi, esi
    jl L18
    and dword ptr [ebp - 4], 0
L0:
    mov eax, dword ptr [ebx + 000000278h]
    cmp eax, 1
    jne L1
    push 2
    mov edi, 010195540h
    lea esi, [ebx + 000000280h]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L19
L1:
    cmp eax, 9
    jne L5
    mov eax, dword ptr [ebx + 000000280h]
    push 5
    mov edi, 01010C71Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    mov dword ptr [ebp - 16], 16
    jmp L7
L2:
    push 6
    mov edi, 01010C714h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    mov dword ptr [ebp - 16], 15
    jmp L7
L3:
    push 8
    mov edi, 01010C70Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    and dword ptr [ebp - 16], edx
    jmp L7
L4:
    mov esi, eax
    push 8
    mov edi, 010192F58h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L16
    mov dword ptr [ebp - 16], 0000000FFh
    jmp L7
L5:
    cmp eax, 2
    je L6
    cmp eax, 3
    je L6
    cmp eax, 4
    jne L16
L6:
    mov eax, dword ptr [ebx + 000000280h]
    cmp eax, 1
    jb L16
    cmp eax, 4
    ja L16
    mov dword ptr [ebp - 16], eax
L7:
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    call sub_10068816
    mov esi, eax
    test esi, esi
    jl L18
    cmp dword ptr [edi], 1
    jne L16
    push 2
    mov edi, 010195880h
    lea esi, [ebx + 000000280h]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L16
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea eax, [ebx + 000000278h]
    push eax
    push dword ptr [ebx + 000000298h]
    call sub_10068859
    mov esi, eax
    test esi, esi
    jl L18
L8:
    mov eax, dword ptr [ebx + 000000278h]
    cmp eax, 2
    je L9
    cmp eax, 3
    je L9
    cmp eax, 4
    jne L16
L9:
    mov eax, dword ptr [ebx + 000000280h]
    mov esi, dword ptr [ebp - 4]
    mov dword ptr [ebp - 24], eax
    mov eax, esi
    not eax
    inc eax
    and eax, esi
    cmp esi, eax
    jne L14
    test esi, esi
    je L10
    lea eax, [esi + esi]
    jmp L11
L10:
    xor eax, eax
    inc eax
L11:
    shl eax, 2
    push eax
    call sub_100F7A56
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 20], edi
    je L23
    push dword ptr [ebp - 8]
    mov ecx, esi
    mov esi, dword ptr [ebp - 8]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100F7A7D
    mov esi, dword ptr [ebp - 4]
    test esi, esi
    mov eax, dword ptr [ebp - 20]
    pop ecx
    mov dword ptr [ebp - 8], eax
    je L12
    lea eax, [esi + esi]
    jmp L13
L12:
    xor eax, eax
    inc eax
L13:
    shl eax, 2
    push eax
    call sub_100F7AA1
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 20], edi
    je L23
    push dword ptr [ebp - 12]
    mov ecx, esi
    mov esi, dword ptr [ebp - 12]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100F7AC8
    mov eax, dword ptr [ebp - 20]
    mov esi, dword ptr [ebp - 4]
    pop ecx
    mov dword ptr [ebp - 12], eax
L14:
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [ecx + esi*4], eax
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ecx + esi*4], eax
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    inc esi
    mov dword ptr [ebp - 4], esi
    call sub_1006895B
    mov esi, eax
    test esi, esi
    jl L18
    cmp dword ptr [edi], 1
    jne L8
    lea eax, [ebx + 000000280h]
    push 2
    mov edi, 010195820h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L15
    mov esi, eax
    push 2
    mov edi, 010195540h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L8
L15:
    push 2
    mov edi, 010195820h
    lea esi, [ebx + 000000280h]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    call sub_100689C8
    mov esi, eax
    test esi, esi
    jl L18
    cmp dword ptr [edi], 1
    jne L0
    push 2
    mov edi, 010195540h
    lea esi, [ebx + 000000280h]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
L16:
    mov eax, dword ptr [ebx + 000000278h]
    cmp eax, 12
    je L17
    cmp eax, 13
    je L17
    mov ecx, dword ptr [ebx + 00000026Ch]
    call sub_10067AD3
L17:
    xor esi, esi
L18:
    push dword ptr [ebp - 8]
    call sub_100F7BB9
    push dword ptr [ebp - 12]
    call sub_100F7BC1
    push 0
    call sub_100F7BC8
    add esp, 12
    pop edi
    mov eax, esi
    pop esi
    mov dword ptr [ebx + 64], 1
    pop ebx
    leave
    ret
L19:
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea edi, [ebx + 000000278h]
    push edi
    push dword ptr [ebx + 000000298h]
    call sub_10068A4C
    mov esi, eax
    test esi, esi
    jl L18
    mov edi, dword ptr [edi]
    cmp edi, 12
    je L20
    cmp edi, 13
    jne L16
L20:
    and dword ptr [ebp - 20], 0
    cmp dword ptr [ebp - 4], 0
    jbe L17
    mov edi, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 8]
    sub eax, edi
    mov dword ptr [ebp - 24], eax
    jmp L22
L21:
    mov eax, dword ptr [ebp - 24]
L22:
    push dword ptr [eax + edi]
    lea ecx, [ebx + 24]
    push dword ptr [edi]
    call sub_10067F99
    mov esi, eax
    test esi, esi
    jl L18
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    add edi, 4
    cmp eax, dword ptr [ebp - 4]
    jb L21
    jmp L17
L23:
    mov esi, 08007000Eh
    jmp L18
FUN_10064593 ENDP
END
