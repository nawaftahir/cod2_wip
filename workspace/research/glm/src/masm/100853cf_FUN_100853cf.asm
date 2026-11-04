.686
.MODEL FLAT, C
.CODE
FUN_100853cf PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx]
    and eax, 0000FFFFFh
    mov edx, eax
    imul edx, dword ptr [ebp + 8]
    push esi
    lea esi, [edx + eax]
    cmp esi, dword ptr [ecx + 4]
    jbe L1
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L0
    and dword ptr [eax], 0
L0:
    xor eax, eax
    jmp L2
L1:
    mov esi, dword ptr [ebp + 12]
    test esi, esi
    je L2
    mov ecx, dword ptr [ecx + 8]
    lea ecx, [ecx + edx*4]
    mov dword ptr [esi], ecx
L2:
    pop esi
    pop ebp
    ret 8
FUN_100853cf ENDP
END
