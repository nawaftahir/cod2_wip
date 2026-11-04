.686
.MODEL FLAT, C
EXTRN sub_100571EC:PROC
.CODE
FUN_10057280 PROC
    sub esp, 20
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [eax + 0000001B0h]
    mov edx, dword ptr [ecx + 24]
    push esi
    mov esi, dword ptr [esp + 40]
    test esi, esi
    mov dword ptr [esp + 12], edx
    mov edx, dword ptr [eax + 100]
    mov dword ptr [esp + 16], edx
    jle L4
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 32]
    push ebx
    sub ecx, eax
    push ebp
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esp + 16], esi
    push edi
L0:
    test edx, edx
    mov esi, dword ptr [ecx + eax]
    mov ebx, dword ptr [eax]
    jbe L3
    mov dword ptr [esp + 52], edx
    mov edi, edi
L1:
    movzx ecx, byte ptr [esi]
    movzx eax, byte ptr [esi + 1]
    mov ebp, dword ptr [esp + 24]
    shr ecx, 3
    mov ebp, dword ptr [ebp + ecx*4]
    inc esi
    movzx edx, byte ptr [esi + 1]
    shr eax, 2
    inc esi
    shr edx, 3
    mov edi, eax
    shl edi, 5
    add edi, edx
    lea edi, [ebp + edi*2]
    inc esi
    cmp word ptr [edi], 0
    jne L2
    push edx
    push ecx
    mov ecx, dword ptr [esp + 48]
    push ecx
    call sub_100571EC
    add esp, 12
L2:
    mov dl, byte ptr [edi]
    mov eax, dword ptr [esp + 52]
    dec dl
    mov byte ptr [ebx], dl
    inc ebx
    dec eax
    mov dword ptr [esp + 52], eax
    jne L1
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 32]
L3:
    mov esi, dword ptr [esp + 20]
    add eax, 4
    dec esi
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], esi
    jne L0
    pop edi
    pop ebp
    pop ebx
L4:
    pop esi
    add esp, 20
    ret
FUN_10057280 ENDP
END
