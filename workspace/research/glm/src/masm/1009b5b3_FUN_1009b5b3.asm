.686
.MODEL FLAT, C
EXTRN sub_10099586:PROC
EXTRN sub_10099942:PROC
.CODE
FUN_1009b5b3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, dword ptr [eax + 16]
    test esi, 000000200h
    push edi
    mov edi, dword ptr [ebp + 12]
    mov ebx, ecx
    je L0
    push 1
    push edi
    call sub_10099942
L0:
    test edi, edi
    je L7
    cmp dword ptr [edi + 4], 9
    jne L7
    cmp dword ptr [edi + 16], 2
    jne L7
    mov eax, 000000C00h
    test eax, esi
    jne L1
    mov ecx, dword ptr [ebx + 4]
    or esi, dword ptr [ecx + 56]
L1:
    test eax, esi
    mov ecx, 000000400h
    mov edx, 000000800h
    jne L3
    mov ebx, dword ptr [ebx]
    test bl, 8
    je L2
    or esi, ecx
    jmp L3
L2:
    test bl, 16
    je L3
    or esi, edx
L3:
    test ecx, esi
    je L4
    mov eax, dword ptr [edi + 32]
    and eax, 0FFFFF7FFh
    or eax, ecx
    mov dword ptr [edi + 32], eax
L4:
    test edx, esi
    je L5
    mov eax, dword ptr [edi + 32]
    and eax, 0FFFFFBFFh
    or eax, edx
    mov dword ptr [edi + 32], eax
L5:
    xor eax, eax
L6:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
L7:
    test esi, 000000C00h
    je L5
    push 010114A48h
    push 000000C05h
    lea eax, [ebx + 32]
    push eax
    push ebx
    call sub_10099586
    add esp, 16
    mov eax, 080004005h
    jmp L6
FUN_1009b5b3 ENDP
END
