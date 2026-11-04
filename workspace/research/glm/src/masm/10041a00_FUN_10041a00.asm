.686
.MODEL FLAT, C
.CODE
FUN_10041a00 PROC
    push ebx
    mov ebx, eax
    mov eax, dword ptr [esi + 0000000D8h]
    test eax, eax
    push ebp
    mov ebp, dword ptr [esp + 16]
    push edi
    jne L0
    mov eax, dword ptr [esi + 20]
    cmp eax, 101
    je L1
    cmp eax, 102
    je L1
    cmp eax, 103
    je L1
L0:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L1:
    mov edx, dword ptr [esp + 16]
    mov ecx, dword ptr [esi + 000000154h]
    push ebp
    push edx
    push esi
    call dword ptr [ecx + 0x14]
    mov eax, dword ptr [esi + 000000154h]
    mov edi, dword ptr [eax + 24]
    add esp, 12
    test ebp, ebp
    je L3
    mov edi, edi
L2:
    movzx ecx, byte ptr [ebx]
    push ecx
    push esi
    call edi
    add esp, 8
    inc ebx
    dec ebp
    jne L2
L3:
    pop edi
    pop ebp
    pop ebx
    ret
FUN_10041a00 ENDP
END
