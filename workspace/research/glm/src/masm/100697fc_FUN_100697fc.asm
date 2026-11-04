.686
.MODEL FLAT, C
.CODE
FUN_100697fc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    push edi
    mov edi, dword ptr [esi + 8]
    test edi, edi
    je L1
    mov edx, dword ptr [esi + 100]
    mov ecx, dword ptr [esi + 92]
    cmp edx, ecx
    jae L1
    mov eax, dword ptr [ebp + 8]
    push ebx
    sub ecx, edx
    push ecx
    mov ecx, dword ptr [esi + 88]
    lea ecx, [ecx + edx*4]
    push ecx
    mov dword ptr [esi + 48], eax
    push dword ptr [eax + 20]
    mov ebx, dword ptr [edi]
    push dword ptr [eax + 16]
    push edi
    call dword ptr [ebx + 0x10]
    test eax, eax
    pop ebx
    jge L0
    xor ecx, ecx
    inc ecx
    mov dword ptr [esi + 76], ecx
    mov dword ptr [esi + 80], ecx
L0:
    mov ecx, dword ptr [esi + 92]
    mov dword ptr [esi + 100], ecx
    jmp L2
L1:
    xor eax, eax
L2:
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_100697fc ENDP
END
