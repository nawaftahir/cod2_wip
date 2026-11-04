.686
.MODEL FLAT, C
EXTRN sub_100678BA:PROC
EXTRN sub_100686E2:PROC
EXTRN sub_10068726:PROC
EXTRN sub_1006874E:PROC
EXTRN sub_1006878F:PROC
.CODE
FUN_10064454 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 00000026Ch]
    push esi
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_100686E2
    test eax, eax
    jl L8
    mov eax, dword ptr [esi]
    cmp eax, 1
    push edi
    jne L5
    push 2
    lea esi, [ebx + 000000280h]
    mov edi, 010195544h
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_10068726
    test eax, eax
    jl L7
    cmp dword ptr [esi], 9
    jne L0
    mov eax, dword ptr [ebx + 000000280h]
    mov ecx, dword ptr [ebx + 00000026Ch]
    push esi
    push dword ptr [ebx + 000000298h]
    mov dword ptr [ebp - 4], eax
    call sub_1006874E
    test eax, eax
    jl L7
    jmp L1
L0:
    and dword ptr [ebp - 4], 0
L1:
    mov eax, dword ptr [esi]
    cmp eax, 1
    jne L5
    push 2
    mov edi, 010195540h
    lea esi, [ebx + 000000280h]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_1006878F
    test eax, eax
    jl L7
    mov eax, dword ptr [esi]
    cmp eax, 12
    je L2
    cmp eax, 13
    jne L5
L2:
    mov esi, dword ptr [ebp - 4]
    test esi, esi
    jne L3
    and dword ptr [ebx + 56], esi
    jmp L6
L3:
    push 10
    mov edi, 01010C700h
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    mov dword ptr [ebx + 56], 000000400h
    jmp L6
L4:
    mov esi, dword ptr [ebp - 4]
    push 13
    mov edi, 01010C6F0h
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov dword ptr [ebx + 56], 000000800h
    jmp L6
L5:
    cmp eax, 12
    je L6
    cmp eax, 13
    je L6
    mov ecx, dword ptr [ebx + 00000026Ch]
    call sub_100678BA
L6:
    xor eax, eax
L7:
    pop edi
L8:
    pop esi
    mov dword ptr [ebx + 64], 1
    pop ebx
    leave
    ret
FUN_10064454 ENDP
END
