.686
.MODEL FLAT, C
.CODE
FUN_100c4cc4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, ecx
    push edi
    mov edi, dword ptr [esi + 0000001B0h]
    xor ebx, ebx
    cmp edi, ebx
    je L1
    mov edx, dword ptr [esi + 00000011Ch]
    mov eax, dword ptr [esi + 000000110h]
    cmp edx, eax
    jae L1
    cmp dword ptr [esi + 0000000D4h], ebx
    jne L1
    mov ecx, dword ptr [esi + 000000100h]
    cmp ecx, ebx
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ebx
    je L0
    mov ebx, dword ptr [ecx + 60]
    test ebx, ebx
    je L0
    cmp dword ptr [ebx + 4], 13
    jne L0
    mov ecx, ebx
    mov ebx, dword ptr [ecx + 64]
    mov ecx, dword ptr [ecx + 68]
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ecx
L0:
    mov ecx, dword ptr [edi]
    sub eax, edx
    push eax
    mov eax, dword ptr [esi + 00000010Ch]
    lea eax, [eax + edx*4]
    push eax
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 8]
    push edi
    call dword ptr [ecx + 0x10]
    mov ecx, dword ptr [esi + 000000110h]
    mov dword ptr [esi + 00000011Ch], ecx
    jmp L2
L1:
    xor eax, eax
L2:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100c4cc4 ENDP
END
