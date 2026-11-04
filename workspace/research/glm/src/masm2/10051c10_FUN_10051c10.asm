.686
.MODEL FLAT, C
EXTRN sub_10051E20:PROC
EXTRN sub_10051E24:PROC
EXTRN sub_10051E26:PROC
EXTRN sub_10051E57:PROC
EXTRN sub_10051E7D:PROC
EXTRN sub_10051E85:PROC
EXTRN sub_10051E8B:PROC
EXTRN sub_10051E8F:PROC
EXTRN sub_10051E90:PROC
EXTRN sub_10051E95:PROC
EXTRN sub_10051EB6:PROC
EXTRN sub_10051EC1:PROC
EXTRN sub_10051ECD:PROC
EXTRN sub_10051ECE:PROC
EXTRN sub_10051EFB:PROC
EXTRN sub_10051F00:PROC
EXTRN sub_10051F04:PROC
EXTRN sub_10051F0B:PROC
EXTRN sub_10051F3F:PROC
.CODE
FUN_10051c10 PROC
    sub sub esp, 20
    mov mov eax, dword ptr [esi + 4]
    push push ebx
    push push ebp
    push push 0A0h
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov ebp, eax
    mov mov dword ptr [esi + 01A8h], ebp
    mov mov dword ptr [ebp], 0100516E0h
    mov mov dword ptr [ebp + 4], 010051700h
    mov mov byte ptr [ebp + 8], 0
    mov mov al, byte ptr [esi + 0112h]
    add add esp, 12
    test test al, al
    mov mov dword ptr [esp + 24], ebp
    je L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 25
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov al, byte ptr [esi + 80]
    test test al, al
    je L1
    cmp cmp dword ptr [esi + 0120h], 1
    mov mov byte ptr [esp + 11], 1
    jg L2
    mov mov byte ptr [esp + 11], 0
    mov mov eax, dword ptr [esi + 44]
    test test eax, eax
    mov mov ebx, dword ptr [esi + 0CCh]
    mov mov dword ptr [esp + 12], 0
    jle sub_10051E7D
    add add ebx, 36
    add add ebp, 52
    push push edi
    jmp L3
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [ebx]
    mov mov eax, dword ptr [ebx - 28]
    mov mov edi, dword ptr [esi + 0120h]
    imul imul eax, ecx
    cdq cdq
    idiv idiv edi
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [ebx - 24]
    imul imul eax, ecx
    cdq cdq
    idiv idiv edi
    mov mov edx, dword ptr [esi + 011Ch]
    mov mov dword ptr [esp + 24], edx
L1:
    mov mov ecx, eax
    mov mov eax, dword ptr [esi + 0118h]
    mov mov dword ptr [ebp + 48], ecx
    cmp cmp byte ptr [ebx + 12], 0
    jne L4
    mov mov dword ptr [ebp], 0100517F0h
    jmp sub_10051EB6
    mov mov edi, dword ptr [esp + 20]
    cmp cmp edi, eax
    jne L5
    cmp cmp ecx, edx
    jne L6
    mov mov dword ptr [ebp], 0100517E0h
    jmp sub_10051ECE
    add add edi, edi
    cmp cmp edi, eax
    jne sub_10051E57
    cmp cmp ecx, edx
    jne sub_10051E24
    mov mov al, byte ptr [esp + 15]
    test test al, al
    je sub_10051E20
    cmp cmp dword ptr [ebx + 4], 2
    jbe sub_10051E26
    mov mov dword ptr [ebp], 010051A20h
    jmp sub_10051EC1
    mov mov dword ptr [ebp], 010051940h
    jmp sub_10051ECD
    cmp cmp edi, eax
    jne sub_10051E85
    mov mov edi, dword ptr [esp + 24]
    lea lea edx, [ecx + ecx]
    cmp cmp edx, edi
    jne sub_10051E90
    mov mov al, byte ptr [esp + 15]
    test test al, al
    je sub_10051E8F
    cmp cmp dword ptr [ebx + 4], 2
    jbe sub_10051E95
    mov mov eax, dword ptr [esp + 28]
    mov mov dword ptr [ebp], 010051AE0h
    mov mov byte ptr [eax + 8], 1
    jmp sub_10051EFB
    mov mov dword ptr [ebp], 0100519A0h
    jmp sub_10051F04
    cdq cdq
    idiv idiv dword ptr [esp + 20]
    test test edx, edx
    mov mov dword ptr [esp + 20], eax
    jne sub_10051F00
    mov mov eax, dword ptr [esp + 24]
    cdq cdq
    idiv idiv ecx
    test test edx, edx
    jne sub_10051F0B
    mov mov edi, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 28]
    mov mov dl, byte ptr [esp + 20]
    mov mov dword ptr [ebp], 010051800h
    mov mov byte ptr [edi + ecx + 08Ch], dl
    mov mov byte ptr [edi + ecx + 096h], al
    jmp sub_10051F3F
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 38
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 0118h]
    mov mov edx, dword ptr [esi + 100]
    lea lea ecx, [edx + eax - 1]
    mov mov dword ptr [esp + 24], eax
    mov mov eax, dword ptr [esi + 011Ch]
    push push eax
    mov mov eax, ecx
    cdq cdq
    idiv idiv dword ptr [esp + 28]
    mov mov edi, dword ptr [esi + 4]
    sub sub ecx, edx
    push push ecx
    push push 1
    push push esi
    call call dword ptr [edi + 8]
    add add esp, 16
L6:
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esi + 44]
    inc inc eax
    add add ebp, 4
    add add ebx, 84
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    jl sub_10051E8B
    pop pop edi
FUN_10051c10 ENDP
END
