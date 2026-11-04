.686
.MODEL FLAT, C
EXTRN sub_10099586:PROC
EXTRN sub_10099942:PROC
EXTRN sub_1009B667:PROC
EXTRN sub_1009B66D:PROC
EXTRN sub_1009B670:PROC
EXTRN sub_1009B673:PROC
EXTRN sub_1009B675:PROC
EXTRN sub_1009B68C:PROC
EXTRN sub_1009B6AE:PROC
EXTRN sub_1009B6CC:PROC
EXTRN sub_1009B6EC:PROC
.CODE
FUN_1009b5b3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    mov mov esi, dword ptr [eax + 16]
    test test esi, 0200h
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    mov mov ebx, ecx
    je L0
    push push 1
    push push edi
    call sub_10099942
    test test edi, edi
    je sub_1009B667
    cmp cmp dword ptr [edi + 4], 9
    jne sub_1009B66D
    cmp cmp dword ptr [edi + 16], 2
    jne sub_1009B673
    mov mov eax, 0C00h
    test test eax, esi
    jne L1
    mov mov ecx, dword ptr [ebx + 4]
    or or esi, dword ptr [ecx + 56]
    test test eax, esi
    mov mov ecx, 0400h
    mov mov edx, 0800h
    jne L2
    mov mov ebx, dword ptr [ebx]
    test test bl, 8
    je L2
    or or esi, ecx
    jmp sub_1009B670
    test test bl, 16
    je sub_1009B675
    or or esi, edx
    test test ecx, esi
    je sub_1009B68C
    mov mov eax, dword ptr [edi + 32]
    and and eax, 0FFFFF7FFh
    or or eax, ecx
    mov mov dword ptr [edi + 32], eax
    test test edx, esi
    je sub_1009B6AE
    mov mov eax, dword ptr [edi + 32]
    and and eax, 0FFFFFBFFh
    or or eax, edx
    mov mov dword ptr [edi + 32], eax
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 8
    test test esi, 0C00h
    je sub_1009B6CC
    push push 010114A48h
    push push 0C05h
    lea lea eax, [ebx + 32]
    push push eax
    push push ebx
    call sub_10099586
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_1009B6EC
FUN_1009b5b3 ENDP
END
