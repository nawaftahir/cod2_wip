.686
.MODEL FLAT, C
EXTRN sub_1004483E:PROC
EXTRN sub_10044886:PROC
EXTRN sub_10044B3F:PROC
EXTRN sub_10044B4E:PROC
EXTRN sub_10044B7B:PROC
EXTRN sub_10044B8C:PROC
.CODE
FUN_10044a10 PROC
    sub sub esp, 16
    push push esi
    mov mov esi, dword ptr [esp + 24]
    mov mov eax, dword ptr [esi + 0164h]
    mov mov ecx, dword ptr [esi + 0ECh]
    mov mov dword ptr [esp + 4], eax
    xor xor eax, eax
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 12], eax
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 8], eax
    jle sub_10044B3F
    push push ebx
    lea lea ecx, [esi + 0F0h]
    push push ebp
    mov mov dword ptr [esp + 32], ecx
    push push edi
    jmp L0
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [esp + 36]
    mov mov eax, dword ptr [edx]
    mov mov edi, dword ptr [eax + 20]
    mov mov ebp, dword ptr [eax + 24]
    mov mov al, byte ptr [esp + edi + 24]
    test test al, al
    lea lea ebx, [esp + edi + 24]
    jne L2
    mov mov eax, dword ptr [esi + edi*4 + 96]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [esi + 4]
    push push 0112h
    push push 0
    push push esi
    call call dword ptr [eax]
    mov mov byte ptr [eax + 0111h], 0
    add add esp, 12
    mov mov dword ptr [esi + edi*4 + 96], eax
    mov mov ecx, dword ptr [esi + edi*4 + 96]
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [edx + edi*4 + 76]
    push push ecx
    push push esi
    call sub_1004483E
    add add esp, 8
    mov mov byte ptr [ebx], 1
    mov mov al, byte ptr [esp + ebp + 28]
    test test al, al
    lea lea edi, [esp + ebp + 28]
    jne sub_10044B8C
    mov mov eax, dword ptr [esi + ebp*4 + 112]
    test test eax, eax
    jne sub_10044B7B
    mov mov eax, dword ptr [esi + 4]
    push push 0112h
    push push 0
    push push esi
    call call dword ptr [eax]
    mov mov byte ptr [eax + 0111h], 0
    add add esp, 12
    mov mov dword ptr [esi + ebp*4 + 112], eax
    mov mov ecx, dword ptr [esi + ebp*4 + 112]
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [edx + ebp*4 + 92]
    push push ecx
    push push esi
    call sub_10044886
    add add esp, 8
    mov mov byte ptr [edi], 1
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esi + 0ECh]
    inc inc eax
    add add edx, 4
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 36], edx
    jl sub_10044B4E
    pop pop edi
    pop pop ebp
    pop pop ebx
    pop pop esi
FUN_10044a10 ENDP
END
