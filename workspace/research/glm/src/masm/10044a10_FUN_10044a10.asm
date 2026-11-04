.686
.MODEL FLAT, C
EXTRN sub_1004483E:PROC
EXTRN sub_10044886:PROC
.CODE
FUN_10044a10 PROC
    sub esp, 16
    push esi
    mov esi, dword ptr [esp + 24]
    mov eax, dword ptr [esi + 000000164h]
    mov ecx, dword ptr [esi + 0000000ECh]
    mov dword ptr [esp + 4], eax
    xor eax, eax
    cmp ecx, eax
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 8], eax
    jle L5
    push ebx
    lea ecx, [esi + 0000000F0h]
    push ebp
    mov dword ptr [esp + 32], ecx
    push edi
    jmp L0
    lea ecx, [ecx]
L0:
    mov edx, dword ptr [esp + 36]
    mov eax, dword ptr [edx]
    mov edi, dword ptr [eax + 20]
    mov ebp, dword ptr [eax + 24]
    mov al, byte ptr [esp + edi + 24]
    test al, al
    lea ebx, [esp + edi + 24]
    jne L2
    mov eax, dword ptr [esi + edi*4 + 96]
    test eax, eax
    jne L1
    mov eax, dword ptr [esi + 4]
    push 000000112h
    push 0
    push esi
    call dword ptr [eax]
    mov byte ptr [eax + 000000111h], 0
    add esp, 12
    mov dword ptr [esi + edi*4 + 96], eax
L1:
    mov ecx, dword ptr [esi + edi*4 + 96]
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [edx + edi*4 + 76]
    push ecx
    push esi
    call sub_1004483E
    add esp, 8
    mov byte ptr [ebx], 1
L2:
    mov al, byte ptr [esp + ebp + 28]
    test al, al
    lea edi, [esp + ebp + 28]
    jne L4
    mov eax, dword ptr [esi + ebp*4 + 112]
    test eax, eax
    jne L3
    mov eax, dword ptr [esi + 4]
    push 000000112h
    push 0
    push esi
    call dword ptr [eax]
    mov byte ptr [eax + 000000111h], 0
    add esp, 12
    mov dword ptr [esi + ebp*4 + 112], eax
L3:
    mov ecx, dword ptr [esi + ebp*4 + 112]
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [edx + ebp*4 + 92]
    push ecx
    push esi
    call sub_10044886
    add esp, 8
    mov byte ptr [edi], 1
L4:
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 36]
    mov ecx, dword ptr [esi + 0000000ECh]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 36], edx
    jl L0
    pop edi
    pop ebp
    pop ebx
L5:
    pop esi
FUN_10044a10 ENDP
END
