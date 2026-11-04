.686
.MODEL FLAT, C
EXTRN sub_100644A2:PROC
EXTRN sub_100645FA:PROC
EXTRN sub_100649FB:PROC
EXTRN sub_10067822:PROC
EXTRN sub_100686E3:PROC
.CODE
FUN_10065219 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 00000026Ch]
    push edi
    lea esi, [ebx + 000000278h]
    push esi
    push dword ptr [ebx + 000000298h]
    call sub_100686E3
    test eax, eax
    jl L4
    mov esi, dword ptr [esi]
    cmp esi, 9
    mov dword ptr [ebp - 4], esi
    jne L2
    mov eax, dword ptr [ebx + 000000280h]
    push 12
    mov edi, 01010C764h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov ecx, ebx
    call sub_100644A2
    jmp L5
L0:
    push 8
    mov edi, 01010C75Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    mov ecx, ebx
    call sub_100645FA
    jmp L5
L1:
    mov esi, eax
    push 4
    mov edi, 01010C758h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    mov ecx, ebx
    call sub_100649FB
    jmp L5
L2:
    cmp dword ptr [ebp - 4], 12
    je L3
    cmp dword ptr [ebp - 4], 13
    je L3
    mov ecx, dword ptr [ebx + 00000026Ch]
    call sub_10067822
L3:
    xor eax, eax
L4:
    mov dword ptr [ebx + 64], 1
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10065219 ENDP
END
