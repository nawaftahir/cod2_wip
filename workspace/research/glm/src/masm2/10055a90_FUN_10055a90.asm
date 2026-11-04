.686
.MODEL FLAT, C
EXTRN sub_1005597F:PROC
EXTRN sub_10055C32:PROC
EXTRN sub_10055C6A:PROC
EXTRN sub_10055C7A:PROC
EXTRN sub_10055C7C:PROC
EXTRN sub_10055C7D:PROC
EXTRN sub_10055C82:PROC
EXTRN sub_10055C89:PROC
.CODE
FUN_10055a90 PROC
    sub sub esp, 40
    push push ebx
    mov mov ebx, dword ptr [esp + 48]
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [ebx + 01B0h]
    lea lea esi, [edi + 32]
    push push esi
    push push ebx
    mov mov dword ptr [esp + 60], edi
    call sub_1005597F
    add add esp, 8
    mov mov ebp, eax
    cmp cmp dword ptr [ebx + 108], 3
    push push 1
    mov mov dword ptr [esp + 48], ebp
    push push ebx
    jne L0
    mov mov eax, dword ptr [ebx]
    add add eax, 24
    mov mov dword ptr [eax], ebp
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [eax + 4], ecx
    mov mov edx, dword ptr [edi + 36]
    mov mov dword ptr [eax + 8], edx
    mov mov ecx, dword ptr [edi + 40]
    mov mov dword ptr [eax + 12], ecx
    mov mov edx, dword ptr [ebx]
    mov mov dword ptr [edx + 20], 94
    jmp L1
    mov mov ecx, dword ptr [ebx]
    mov mov dword ptr [ecx + 20], 95
    mov mov edx, dword ptr [ebx]
    mov mov dword ptr [edx + 24], ebp
    mov mov eax, dword ptr [ebx]
    call call dword ptr [eax + 4]
    mov mov edx, dword ptr [ebx + 108]
    mov mov ecx, dword ptr [ebx + 4]
    add add esp, 8
    push push edx
    push push ebp
    push push 1
    push push ebx
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ebx + 108]
    add add esp, 16
    test test ecx, ecx
    mov mov dword ptr [esp + 48], eax
    mov mov dword ptr [esp + 20], ebp
    mov mov dword ptr [esp + 32], 0
    jle sub_10055C89
    mov mov edi, eax
    mov mov dword ptr [esp + 24], esi
    lea lea esp, [esp]
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [esp + 20]
    cdq cdq
    idiv idiv ecx
    test test ecx, ecx
    mov mov esi, eax
    jle sub_10055C6A
    lea lea eax, [ecx - 1]
L1:
    mov mov dword ptr [esp + 40], eax
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    xor xor ebx, ebx
    mov mov dword ptr [esp + 36], eax
    mov mov dword ptr [esp + 16], ebx
    mov mov dword ptr [esp + 28], ecx
    jmp sub_10055C32
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 16]
    add add eax, ecx
    cdq cdq
    idiv idiv dword ptr [esp + 40]
    cmp cmp ebx, ebp
    mov mov edx, ebx
    jge sub_10055C7C
    xor xor ecx, ecx
    test test esi, esi
    jle sub_10055C7A
    lea lea ebx, [ebx]
    mov mov ebp, dword ptr [edi]
    add add ebp, ecx
    inc inc ecx
    cmp cmp ecx, esi
    mov mov byte ptr [edx + ebp], al
    jl sub_10055C7C
    mov mov ebp, dword ptr [esp + 44]
    add add edx, dword ptr [esp + 20]
    cmp cmp edx, ebp
    jl sub_10055C7C
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 28]
    add add edx, 0FFh
    add add ebx, esi
    dec dec eax
    mov mov dword ptr [esp + 16], edx
    mov mov dword ptr [esp + 28], eax
    jne sub_10055C82
    mov mov ebx, dword ptr [esp + 60]
    mov mov eax, dword ptr [esp + 32]
    mov mov ecx, dword ptr [ebx + 108]
    mov mov dword ptr [esp + 20], esi
    mov mov esi, dword ptr [esp + 24]
    inc inc eax
    add add esi, 4
    add add edi, 4
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 24], esi
    jl sub_10055C7D
    mov mov eax, dword ptr [esp + 52]
    mov mov edx, dword ptr [esp + 48]
    pop pop edi
    pop pop esi
    mov mov dword ptr [eax + 20], ebp
    pop pop ebp
    mov mov dword ptr [eax + 16], edx
    pop pop ebx
    add add esp, 40
    ret ret
    mov mov dword ptr [edi + 20], ebp
    mov mov dword ptr [edi + 16], eax
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 40
    ret ret
FUN_10055a90 ENDP
END
