.686
.MODEL FLAT, C
EXTRN sub_1000E261:PROC
EXTRN sub_1000E269:PROC
EXTRN sub_1000E26D:PROC
EXTRN sub_1000E270:PROC
EXTRN sub_1000E289:PROC
EXTRN sub_1000E28D:PROC
EXTRN sub_1000E299:PROC
EXTRN sub_1000E2D4:PROC
EXTRN sub_1000E2EE:PROC
EXTRN sub_1000E32A:PROC
EXTRN sub_1000E346:PROC
EXTRN sub_1000E351:PROC
EXTRN sub_1000E35A:PROC
.CODE
FUN_1000e080 PROC
    push push ecx
    mov mov ecx, dword ptr [esp + 16]
    push push ebx
    mov mov ebx, dword ptr [esp + 24]
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 24]
    mov mov eax, ecx
    sub sub eax, esi
    sar sar eax, 2
    cdq cdq
    push push edi
    sub sub eax, edx
    sar sar eax, 1
    add add ecx, -4
    push push ebx
    lea lea edi, [esi + eax*4]
    push push ecx
    call sub_1000E35A
    add add esp, 8
    cmp cmp esi, edi
    lea lea ebp, [edi + 4]
    jae L0
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [edi - 4]
    push push eax
    push push ecx
    call call ebx
    add add esp, 8
    test test eax, eax
    jne L1
    mov mov edx, dword ptr [edi - 4]
    mov mov eax, dword ptr [edi]
    push push edx
    push push eax
    call call ebx
    add add esp, 8
    test test eax, eax
    jne L2
    add add edi, -4
    cmp cmp esi, edi
    jb L0
    mov mov esi, dword ptr [esp + 32]
    cmp cmp ebp, esi
    jae L3
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [ebp]
    push push ecx
    push push edx
    call call ebx
    add add esp, 8
    test test eax, eax
    jne L4
    mov mov eax, dword ptr [ebp]
    mov mov ecx, dword ptr [edi]
    push push eax
    push push ecx
    call call ebx
    add add esp, 8
    test test eax, eax
    jne L5
    add add ebp, 4
    cmp cmp ebp, esi
    jb L3
    mov mov ebx, ebp
    mov mov esi, edi
    mov mov edi, edi
    cmp cmp ebx, dword ptr [esp + 32]
    jae L6
    mov mov edx, dword ptr [ebx]
    mov mov eax, dword ptr [edi]
    push push edx
    push push eax
    call call dword ptr [esp + 44]
    add add esp, 8
    test test eax, eax
    jne L7
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [ebx]
    push push ecx
    push push edx
    call call dword ptr [esp + 44]
    add add esp, 8
    test test eax, eax
    jne L8
    mov mov edx, dword ptr [ebx]
    mov mov eax, ebp
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [eax], edx
    add add ebp, 4
    mov mov dword ptr [ebx], ecx
    mov mov eax, dword ptr [esp + 32]
    add add ebx, 4
    cmp cmp ebx, eax
    jb L6
    cmp cmp esi, dword ptr [esp + 28]
    jbe sub_1000E26D
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [esi - 4]
    push push eax
    push push ecx
    call call dword ptr [esp + 44]
    add add esp, 8
    test test eax, eax
    jne sub_1000E270
    mov mov edx, dword ptr [esi - 4]
    mov mov eax, dword ptr [edi]
L3:
    push push edx
    push push eax
    call call dword ptr [esp + 44]
    add add esp, 8
    test test eax, eax
    jne sub_1000E28D
    mov mov ecx, dword ptr [esi - 4]
L4:
    mov mov eax, dword ptr [edi - 4]
    sub sub edi, 4
    mov mov dword ptr [edi], ecx
    mov mov dword ptr [esi - 4], eax
    mov mov eax, dword ptr [esp + 28]
    add add esi, -4
    cmp cmp eax, esi
    jb sub_1000E269
    cmp cmp esi, dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 32]
    jne sub_1000E2EE
    cmp cmp ebx, eax
    je sub_1000E32A
    cmp cmp ebp, ebx
    je sub_1000E2D4
    mov mov edx, dword ptr [ebp]
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [edi], edx
    mov mov dword ptr [ebp], eax
    mov mov ecx, edi
    mov mov edx, dword ptr [ecx]
    mov mov eax, ebx
    mov mov dword ptr [esp + 16], edx
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ecx], edx
    mov mov ecx, dword ptr [esp + 16]
    add add ebp, 4
    add add edi, 4
    add add ebx, 4
    mov mov dword ptr [eax], ecx
    jmp sub_1000E261
    sub sub esi, 4
    cmp cmp ebx, eax
    jne sub_1000E351
    sub sub edi, 4
    cmp cmp esi, edi
    je sub_1000E346
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [esi], edx
    mov mov dword ptr [edi], eax
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi]
L7:
    sub sub ebp, 4
    mov mov dword ptr [edi], ecx
    mov mov dword ptr [ebp], eax
    jmp sub_1000E289
    mov mov eax, dword ptr [ebx]
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [ebx], edx
    mov mov dword ptr [esi], eax
    add add ebx, 4
    jmp sub_1000E299
    mov mov eax, dword ptr [esp + 24]
    mov mov dword ptr [eax], edi
    pop pop edi
    pop pop esi
    mov mov dword ptr [eax + 4], ebp
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1000e080 ENDP
END
