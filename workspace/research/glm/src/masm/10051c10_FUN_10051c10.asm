.686
.MODEL FLAT, C
EXTRN sub_10051E7D:PROC
.CODE
FUN_10051c10 PROC
    sub esp, 20
    mov eax, dword ptr [esi + 4]
    push ebx
    push ebp
    push 0000000A0h
    push 1
    push esi
    call dword ptr [eax]
    mov ebp, eax
    mov dword ptr [esi + 0000001A8h], ebp
    mov dword ptr [ebp], 0100516E0h
    mov dword ptr [ebp + 4], 010051700h
    mov byte ptr [ebp + 8], 0
    mov al, byte ptr [esi + 000000112h]
    add esp, 12
    test al, al
    mov dword ptr [esp + 24], ebp
    je L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 25
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L0:
    mov al, byte ptr [esi + 80]
    test al, al
    je L1
    cmp dword ptr [esi + 000000120h], 1
    mov byte ptr [esp + 11], 1
    jg L2
L1:
    mov byte ptr [esp + 11], 0
L2:
    mov eax, dword ptr [esi + 44]
    test eax, eax
    mov ebx, dword ptr [esi + 0000000CCh]
    mov dword ptr [esp + 12], 0
    jle sub_10051E7D
    add ebx, 36
    add ebp, 52
    push edi
    jmp L3
    lea ebx, [ebx]
L3:
    mov ecx, dword ptr [ebx]
    mov eax, dword ptr [ebx - 28]
    mov edi, dword ptr [esi + 000000120h]
    imul eax, ecx
    cdq
    idiv edi
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [ebx - 24]
    imul eax, ecx
    cdq
    idiv edi
    mov edx, dword ptr [esi + 00000011Ch]
    mov dword ptr [esp + 24], edx
    mov ecx, eax
    mov eax, dword ptr [esi + 000000118h]
    mov dword ptr [ebp + 48], ecx
    cmp byte ptr [ebx + 12], 0
    jne L4
    mov dword ptr [ebp], 0100517F0h
    jmp L12
L4:
    mov edi, dword ptr [esp + 20]
    cmp edi, eax
    jne L5
    cmp ecx, edx
    jne L5
    mov dword ptr [ebp], 0100517E0h
    jmp L12
L5:
    add edi, edi
    cmp edi, eax
    jne L9
    cmp ecx, edx
    jne L7
    mov al, byte ptr [esp + 15]
    test al, al
    je L6
    cmp dword ptr [ebx + 4], 2
    jbe L6
    mov dword ptr [ebp], 010051A20h
    jmp L11
L6:
    mov dword ptr [ebp], 010051940h
    jmp L11
L7:
    cmp edi, eax
    jne L9
    mov edi, dword ptr [esp + 24]
    lea edx, [ecx + ecx]
    cmp edx, edi
    jne L9
    mov al, byte ptr [esp + 15]
    test al, al
    je L8
    cmp dword ptr [ebx + 4], 2
    jbe L8
    mov eax, dword ptr [esp + 28]
    mov dword ptr [ebp], 010051AE0h
    mov byte ptr [eax + 8], 1
    jmp L11
L8:
    mov dword ptr [ebp], 0100519A0h
    jmp L11
L9:
    cdq
    idiv dword ptr [esp + 20]
    test edx, edx
    mov dword ptr [esp + 20], eax
    jne L10
    mov eax, dword ptr [esp + 24]
    cdq
    idiv ecx
    test edx, edx
    jne L10
    mov edi, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 28]
    mov dl, byte ptr [esp + 20]
    mov dword ptr [ebp], 010051800h
    mov byte ptr [edi + ecx + 00000008Ch], dl
    mov byte ptr [edi + ecx + 000000096h], al
    jmp L11
L10:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 38
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L11:
    mov eax, dword ptr [esi + 000000118h]
    mov edx, dword ptr [esi + 100]
    lea ecx, [edx + eax - 1]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [esi + 00000011Ch]
    push eax
    mov eax, ecx
    cdq
    idiv dword ptr [esp + 28]
    mov edi, dword ptr [esi + 4]
    sub ecx, edx
    push ecx
    push 1
    push esi
    call dword ptr [edi + 8]
    add esp, 16
    mov dword ptr [ebp - 40], eax
L12:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esi + 44]
    inc eax
    add ebp, 4
    add ebx, 84
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jl L3
    pop edi
FUN_10051c10 ENDP
END
