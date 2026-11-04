.686
.MODEL FLAT, C
EXTRN sub_1004D605:PROC
EXTRN sub_1004DC66:PROC
EXTRN sub_1004DCD2:PROC
EXTRN sub_1004DCD8:PROC
.CODE
FUN_1004db80 PROC
    push push ebx
    push push ebp
    push push esi
    push push 80
    mov mov esi, eax
    mov mov eax, dword ptr [esi + 4]
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov ebx, eax
    mov mov al, byte ptr [esp + 28]
    add add esp, 12
    test test al, al
    mov mov dword ptr [esi + 018Ch], ebx
    mov mov dword ptr [ebx], 01004D920h
    je L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 4
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 01A8h]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je L2
    cmp cmp dword ptr [esi + 0120h], 2
    jge L1
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 47
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    call sub_1004D605
    mov mov eax, dword ptr [esi + 0120h]
    add add eax, 2
    jmp sub_1004DC66
    mov mov eax, dword ptr [esi + 0120h]
    mov mov ecx, dword ptr [esi + 44]
    xor xor ebp, ebp
    test test ecx, ecx
    mov mov dword ptr [esp + 16], eax
    mov mov eax, dword ptr [esi + 0CCh]
    jle sub_1004DCD2
    push push edi
    lea lea edi, [eax + 36]
    add add ebx, 8
    mov mov ecx, dword ptr [edi]
    mov mov eax, dword ptr [edi - 24]
    imul imul eax, ecx
    cdq cdq
    idiv idiv dword ptr [esi + 0120h]
    mov mov edx, dword ptr [esi + 4]
    imul imul eax, dword ptr [esp + 20]
    push push eax
    mov mov eax, dword ptr [edi - 8]
    imul imul eax, ecx
    push push eax
L1:
    push push 1
    push push esi
    call call dword ptr [edx + 8]
    add add esp, 16
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [esi + 44]
    inc inc ebp
    add add ebx, 4
    add add edi, 84
    cmp cmp ebp, eax
    jl sub_1004DCD8
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1004db80 ENDP
END
