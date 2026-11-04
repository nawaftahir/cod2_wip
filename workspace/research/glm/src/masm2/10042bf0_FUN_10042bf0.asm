.686
.MODEL FLAT, C
EXTRN sub_10042E25:PROC
EXTRN sub_10042E30:PROC
EXTRN sub_10042E46:PROC
EXTRN sub_10042E56:PROC
EXTRN sub_10042EBB:PROC
EXTRN sub_10042ED3:PROC
EXTRN sub_10042F19:PROC
EXTRN sub_10042F1F:PROC
EXTRN sub_10042F48:PROC
EXTRN sub_10042F4E:PROC
EXTRN sub_10042F94:PROC
EXTRN sub_10042F9C:PROC
EXTRN sub_10042FB5:PROC
.CODE
FUN_10042bf0 PROC
    mov mov eax, dword ptr [esi + 4]
    push push ebx
    push push edi
    push push 12
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov edi, eax
    mov mov dword ptr [esi + 0158h], edi
    mov mov dword ptr [edi], 010042BE0h
    mov mov eax, dword ptr [esi + 48]
    add add esp, 12
    dec dec eax
    mov mov ebx, 4
    cmp cmp eax, ebx
    ja L0
    jmp jmp dword ptr [eax*4 + 010042DE8h]
    cmp cmp dword ptr [esi + 44], 1
    je L2
    jmp L1
    cmp cmp dword ptr [esi + 44], 3
    je L3
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 9
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    jmp L4
    cmp cmp dword ptr [esi + 44], ebx
    je L5
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 9
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    jmp L6
    cmp cmp dword ptr [esi + 44], 1
    jge L7
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 9
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 72]
    lea lea ecx, [eax - 1]
    cmp cmp ecx, ebx
    ja sub_10042E46
    jmp jmp dword ptr [ecx*4 + 010042DFCh]
    cmp cmp dword ptr [esi + 68], 1
    je L8
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 10
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 48]
    cmp cmp eax, 1
    je L10
    cmp cmp eax, 2
L2:
    jne L9
    mov mov dword ptr [edi], 0100426D0h
L3:
    mov mov dword ptr [edi + 4], 0100428D0h
    pop pop edi
    pop pop ebx
    ret ret
    cmp cmp eax, 3
L4:
    jne sub_10042E30
    mov mov dword ptr [edi + 4], 010042AE0h
    pop pop edi
    pop pop ebx
    ret ret
    cmp cmp dword ptr [esi + 68], 3
    je L11
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 10
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    cmp cmp dword ptr [esi + 48], 2
    je sub_10042ED3
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 27
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    pop pop edi
    pop pop ebx
    ret ret
    cmp cmp dword ptr [esi + 68], 3
    je sub_10042E25
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 10
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 48]
    cmp cmp eax, 2
    jne sub_10042E56
    mov mov dword ptr [edi], 0100426D0h
    mov mov dword ptr [edi + 4], 0100427B0h
    pop pop edi
    pop pop ebx
    ret ret
    cmp cmp eax, 3
    je sub_10042F1F
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 27
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    pop pop edi
    pop pop ebx
    ret ret
    cmp cmp dword ptr [esi + 68], ebx
    je sub_10042EBB
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 10
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    cmp cmp dword ptr [esi + 48], ebx
    je sub_10042F4E
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 27
L10:
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    pop pop edi
    pop pop ebx
    ret ret
    cmp cmp dword ptr [esi + 68], ebx
    je sub_10042F19
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 10
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 48]
    cmp cmp eax, ebx
    jne sub_10042F48
    mov mov dword ptr [edi], 0100426D0h
    mov mov dword ptr [edi + 4], 010042980h
    pop pop edi
    pop pop ebx
    ret ret
    cmp cmp eax, 5
    je sub_10042F94
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 27
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    pop pop edi
L11:
    pop pop ebx
    ret ret
    cmp cmp eax, dword ptr [esi + 48]
    jne sub_10042F9C
    mov mov edx, dword ptr [esi + 68]
    cmp cmp edx, dword ptr [esi + 44]
    je sub_10042FB5
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 27
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov dword ptr [edi + 4], 010042B50h
    pop pop edi
    pop pop ebx
    ret ret
FUN_10042bf0 ENDP
END
