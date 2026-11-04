.686
.MODEL FLAT, C
EXTRN sub_100645A6:PROC
EXTRN sub_100645B2:PROC
EXTRN sub_100645BE:PROC
EXTRN sub_100645F5:PROC
EXTRN sub_1006460D:PROC
EXTRN sub_10064613:PROC
EXTRN sub_1006461D:PROC
EXTRN sub_10064625:PROC
EXTRN sub_10064627:PROC
EXTRN sub_1006464F:PROC
EXTRN sub_1006465A:PROC
EXTRN sub_10064670:PROC
EXTRN sub_10064683:PROC
EXTRN sub_10064687:PROC
EXTRN sub_100646A1:PROC
EXTRN sub_100646A6:PROC
EXTRN sub_100646AB:PROC
EXTRN sub_100678BA:PROC
EXTRN sub_100686E2:PROC
EXTRN sub_10068726:PROC
EXTRN sub_1006874E:PROC
EXTRN sub_1006878F:PROC
.CODE
FUN_10064454 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx + 026Ch]
    push push esi
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_100686E2
    test test eax, eax
    jl sub_100645B2
    mov mov eax, dword ptr [esi]
    cmp cmp eax, 1
    push push edi
    jne sub_100645A6
    push push 2
    lea lea esi, [ebx + 0280h]
    mov mov edi, 010195544h
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100645BE
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_10068726
    test test eax, eax
    jl sub_100645F5
    cmp cmp dword ptr [esi], 9
    jne L0
    mov mov eax, dword ptr [ebx + 0280h]
    mov mov ecx, dword ptr [ebx + 026Ch]
    push push esi
    push push dword ptr [ebx + 0298h]
    mov mov dword ptr [ebp - 4], eax
    call sub_1006874E
    test test eax, eax
    jl sub_1006461D
    jmp L1
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [esi]
    cmp cmp eax, 1
    jne sub_10064613
    push push 2
    mov mov edi, 010195540h
    lea lea esi, [ebx + 0280h]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064627
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_1006878F
    test test eax, eax
    jl sub_1006465A
    mov mov eax, dword ptr [esi]
    cmp cmp eax, 12
    je sub_1006460D
    cmp cmp eax, 13
    jne sub_1006464F
    mov mov esi, dword ptr [ebp - 4]
    test test esi, esi
    jne sub_10064625
    and and dword ptr [ebx + 56], esi
    jmp sub_10064670
    push push 10
    mov mov edi, 01010C700h
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006464F
    mov mov dword ptr [ebx + 56], 0400h
    jmp sub_10064687
    mov mov esi, dword ptr [ebp - 4]
    push push 13
    mov mov edi, 01010C6F0h
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10064683
    mov mov dword ptr [ebx + 56], 0800h
    jmp sub_100646A1
    cmp cmp eax, 12
    je sub_100646A6
    cmp cmp eax, 13
    je sub_100646AB
    mov mov ecx, dword ptr [ebx + 026Ch]
    call sub_100678BA
    xor xor eax, eax
    pop pop edi
L1:
    pop pop esi
    mov mov dword ptr [ebx + 64], 1
    pop pop ebx
    leave leave
    ret ret
FUN_10064454 ENDP
END
