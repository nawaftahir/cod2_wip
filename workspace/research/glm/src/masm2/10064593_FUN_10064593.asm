.686
.MODEL FLAT, C
EXTRN sub_100649A8:PROC
EXTRN sub_100649C9:PROC
EXTRN sub_100649D7:PROC
EXTRN sub_100649E4:PROC
EXTRN sub_100649E5:PROC
EXTRN sub_100649EC:PROC
EXTRN sub_100649F4:PROC
EXTRN sub_100649FD:PROC
EXTRN sub_10064A0E:PROC
EXTRN sub_10064A2B:PROC
EXTRN sub_10064A3F:PROC
EXTRN sub_10064A43:PROC
EXTRN sub_10064A7E:PROC
EXTRN sub_10064A82:PROC
EXTRN sub_10064B2F:PROC
EXTRN sub_10064B6B:PROC
EXTRN sub_10064B84:PROC
EXTRN sub_10064BB6:PROC
EXTRN sub_10064BED:PROC
EXTRN sub_10064C17:PROC
EXTRN sub_10064C1C:PROC
EXTRN sub_10064C60:PROC
EXTRN sub_10064C71:PROC
EXTRN sub_10064C85:PROC
EXTRN sub_10064CAA:PROC
EXTRN sub_10064CBB:PROC
EXTRN sub_10064CC7:PROC
EXTRN sub_10064CCA:PROC
EXTRN sub_10064D00:PROC
EXTRN sub_10064D21:PROC
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
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    and and dword ptr [ebp - 8], 0
    and and dword ptr [ebp - 12], 0
    push push ebx
    push push esi
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx + 026Ch]
    push push edi
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
    call sub_100686ED
    mov mov esi, eax
    test test esi, esi
    jl L14
    cmp cmp dword ptr [edi], 1
    jne L13
    push push 2
    lea lea esi, [ebx + 0280h]
    mov mov edi, 010195544h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L15
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea eax, [ebx + 0278h]
    push push eax
    push push dword ptr [ebx + 0298h]
    call sub_10068730
    mov mov esi, eax
    test test esi, esi
    jl L20
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ebx + 0278h]
    cmp cmp eax, 1
    jne L0
    push push 2
    mov mov edi, 010195540h
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100649A8
    cmp cmp eax, 9
    jne L3
    mov mov eax, dword ptr [ebx + 0280h]
    push push 5
    mov mov edi, 01010C71Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    mov mov dword ptr [ebp - 16], 16
    jmp L5
    push push 6
    mov mov edi, 01010C714h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    mov mov dword ptr [ebp - 16], 15
    jmp L6
    push push 8
    mov mov edi, 01010C70Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    and and dword ptr [ebp - 16], edx
    jmp L7
    mov mov esi, eax
    push push 8
    mov mov edi, 010192F58h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100649C9
    mov mov dword ptr [ebp - 16], 0FFh
    jmp L10
    cmp cmp eax, 2
    je L8
    cmp cmp eax, 3
    je L9
    cmp cmp eax, 4
    jne sub_100649E5
    mov mov eax, dword ptr [ebx + 0280h]
    cmp cmp eax, 1
    jb sub_100649F4
    cmp cmp eax, 4
    ja sub_100649FD
    mov mov dword ptr [ebp - 16], eax
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
    call sub_10068816
    mov mov esi, eax
    test test esi, esi
    jl sub_10064A3F
    cmp cmp dword ptr [edi], 1
    jne sub_10064A2B
    push push 2
    mov mov edi, 010195880h
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064A43
L1:
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea eax, [ebx + 0278h]
    push push eax
    push push dword ptr [ebx + 0298h]
    call sub_10068859
    mov mov esi, eax
    test test esi, esi
    jl sub_10064A82
    mov mov eax, dword ptr [ebx + 0278h]
    cmp cmp eax, 2
    je L11
    cmp cmp eax, 3
    je L13
L2:
    cmp cmp eax, 4
L3:
    jne sub_10064A7E
    mov mov eax, dword ptr [ebx + 0280h]
    mov mov esi, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, esi
    not not eax
    inc inc eax
    and and eax, esi
    cmp cmp esi, eax
    jne sub_100649D7
    test test esi, esi
    je L18
    lea lea eax, [esi + esi]
    jmp L19
    xor xor eax, eax
    inc inc eax
    shl shl eax, 2
    push push eax
    call sub_100F7A56
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 20], edi
    je sub_10064B6B
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    mov mov esi, dword ptr [ebp - 8]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100F7A7D
    mov mov esi, dword ptr [ebp - 4]
    test test esi, esi
    mov mov eax, dword ptr [ebp - 20]
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    je sub_100649E4
    lea lea eax, [esi + esi]
    jmp sub_100649EC
    xor xor eax, eax
    inc inc eax
    shl shl eax, 2
L7:
    push push eax
    call sub_100F7AA1
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 20], edi
    je sub_10064BB6
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    mov mov esi, dword ptr [ebp - 12]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100F7AC8
    mov mov eax, dword ptr [ebp - 20]
    mov mov esi, dword ptr [ebp - 4]
    pop pop ecx
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + esi*4], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + esi*4], eax
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
    inc inc esi
    mov mov dword ptr [ebp - 4], esi
    call sub_1006895B
    mov mov esi, eax
    test test esi, esi
    jl sub_10064B84
    cmp cmp dword ptr [edi], 1
    jne sub_100649E4
    lea lea eax, [ebx + 0280h]
    push push 2
    mov mov edi, 010195820h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10064B2F
    mov mov esi, eax
    push push 2
    mov mov edi, 010195540h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064A0E
    push push 2
    mov mov edi, 010195820h
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L12
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
    call sub_100689C8
    mov mov esi, eax
    test test esi, esi
    jl sub_10064BED
    cmp cmp dword ptr [edi], 1
    jne L16
    push push 2
    mov mov edi, 010195540h
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L17
    mov mov eax, dword ptr [ebx + 0278h]
    cmp cmp eax, 12
    je sub_10064C17
    cmp cmp eax, 13
    je sub_10064C1C
    mov mov ecx, dword ptr [ebx + 026Ch]
    call sub_10067AD3
    xor xor esi, esi
    push push dword ptr [ebp - 8]
    call sub_100F7BB9
    push push dword ptr [ebp - 12]
    call sub_100F7BC1
    push push 0
    call sub_100F7BC8
    add add esp, 12
    pop pop edi
    mov mov eax, esi
    pop pop esi
L11:
    mov mov dword ptr [ebx + 64], 1
    pop pop ebx
    leave leave
    ret ret
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea edi, [ebx + 0278h]
    push push edi
    push push dword ptr [ebx + 0298h]
L15:
    call sub_10068A4C
    mov mov esi, eax
    test test esi, esi
    jl sub_10064C71
    mov mov edi, dword ptr [edi]
    cmp cmp edi, 12
    je sub_10064CCA
    cmp cmp edi, 13
    jne sub_10064C60
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [ebp - 4], 0
    jbe sub_10064C85
    mov mov edi, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 8]
    sub sub eax, edi
    mov mov dword ptr [ebp - 24], eax
    jmp sub_10064D00
    mov mov eax, dword ptr [ebp - 24]
    push push dword ptr [eax + edi]
L18:
    lea lea ecx, [ebx + 24]
    push push dword ptr [edi]
    call sub_10067F99
    mov mov esi, eax
    test test esi, esi
    jl sub_10064CAA
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    add add edi, 4
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_10064D21
    jmp sub_10064CBB
    mov mov esi, 08007000Eh
    jmp sub_10064CC7
FUN_10064593 ENDP
END
