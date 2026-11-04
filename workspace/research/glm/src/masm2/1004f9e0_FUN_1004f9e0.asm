.686
.MODEL FLAT, C
EXTRN sub_1004FC2A:PROC
EXTRN sub_1004FC33:PROC
EXTRN sub_1004FC3F:PROC
EXTRN sub_1004FC53:PROC
EXTRN sub_1004FCEC:PROC
EXTRN sub_1004FCEF:PROC
EXTRN sub_1004FD6E:PROC
EXTRN sub_1004FD84:PROC
EXTRN sub_1004FD8D:PROC
EXTRN sub_1004FD96:PROC
EXTRN sub_1004FDB7:PROC
EXTRN sub_1004FDE1:PROC
.CODE
FUN_1004f9e0 PROC
    push push ecx
    cmp cmp dword ptr [esi + 20], 0CAh
    je L0
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 20
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 56]
    mov mov ecx, dword ptr [esi + 60]
    lea lea edx, [eax*8]
    cmp cmp edx, ecx
    ja L1
    mov mov eax, dword ptr [esi + 36]
    add add eax, 7
    cdq cdq
    and and edx, 7
    add add eax, edx
    sar sar eax, 3
    mov mov dword ptr [esi + 100], eax
    mov mov eax, dword ptr [esi + 40]
    add add eax, 7
    cdq cdq
    and and edx, 7
    add add eax, edx
    sar sar eax, 3
    mov mov dword ptr [esi + 104], eax
    mov mov dword ptr [esi + 0120h], 1
    jmp L3
    lea lea edx, [eax*4]
    cmp cmp edx, ecx
    ja L2
    mov mov eax, dword ptr [esi + 36]
    add add eax, 3
    cdq cdq
    and and edx, 3
    add add eax, edx
    sar sar eax, 2
    mov mov dword ptr [esi + 100], eax
    mov mov eax, dword ptr [esi + 40]
    add add eax, 3
    cdq cdq
    and and edx, 3
    add add eax, edx
    sar sar eax, 2
    mov mov dword ptr [esi + 104], eax
    mov mov dword ptr [esi + 0120h], 2
    jmp L6
    add add eax, eax
    cmp cmp eax, ecx
    ja L4
    mov mov eax, dword ptr [esi + 36]
    inc inc eax
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov dword ptr [esi + 100], eax
    mov mov eax, dword ptr [esi + 40]
    inc inc eax
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov dword ptr [esi + 104], eax
    mov mov dword ptr [esi + 0120h], 4
    jmp L7
    mov mov ecx, dword ptr [esi + 36]
    mov mov edx, dword ptr [esi + 40]
    mov mov dword ptr [esi + 100], ecx
    mov mov dword ptr [esi + 104], edx
    mov mov dword ptr [esi + 0120h], 8
    mov mov eax, dword ptr [esi + 44]
    test test eax, eax
    mov mov ecx, dword ptr [esi + 0CCh]
    push push ebx
    push push ebp
    push push edi
    mov mov dword ptr [esp + 12], 0
    jle sub_1004FC2A
    add add ecx, 12
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [esi + 0120h]
    mov mov eax, edx
    cmp cmp eax, 8
    jge sub_1004FC2A
    mov mov edi, dword ptr [esi + 0118h]
    imul imul edi, edx
    mov mov ebx, dword ptr [ecx - 4]
    imul imul ebx, eax
    shl shl ebx, 1
    cmp cmp ebx, edi
    jg sub_1004FC3F
    mov mov ebp, dword ptr [ecx]
    mov mov ebx, dword ptr [esi + 011Ch]
    imul imul ebp, eax
    imul imul ebx, edx
    shl shl ebp, 1
    cmp cmp ebp, ebx
    jg sub_1004FC53
    add add eax, eax
    cmp cmp eax, 8
    jl sub_1004FC33
    mov mov dword ptr [ecx + 24], eax
    mov mov eax, dword ptr [esp + 12]
    mov mov edx, dword ptr [esi + 44]
    inc inc eax
    add add ecx, 84
    cmp cmp eax, edx
    mov mov dword ptr [esp + 12], eax
    jl sub_1004FC33
    mov mov ecx, dword ptr [esi + 44]
    mov mov eax, dword ptr [esi + 0CCh]
    xor xor ebp, ebp
    test test ecx, ecx
    jle sub_1004FCEC
    lea lea ecx, [eax + 36]
    mov mov ebx, dword ptr [ecx]
    mov mov eax, dword ptr [ecx - 28]
    mov mov edi, dword ptr [esi + 0118h]
    imul imul eax, ebx
    imul imul eax, dword ptr [esi + 36]
L5:
    shl shl edi, 3
    lea lea eax, [eax + edi - 1]
L6:
    cdq cdq
    idiv idiv edi
    mov mov edx, dword ptr [ecx - 24]
    add add ecx, 84
    mov mov dword ptr [ecx - 80], eax
    imul imul edx, dword ptr [esi + 40]
    mov mov edi, dword ptr [esi + 011Ch]
    imul imul edx, ebx
    shl shl edi, 3
    lea lea eax, [edx + edi - 1]
    cdq cdq
    idiv idiv edi
    inc inc ebp
    mov mov dword ptr [ecx - 76], eax
    cmp cmp ebp, dword ptr [esi + 44]
L7:
    jl sub_1004FCEF
    mov mov eax, dword ptr [esi + 52]
    pop pop edi
    dec dec eax
    cmp cmp eax, 4
    pop pop ebp
    pop pop ebx
    ja sub_1004FD6E
    jmp jmp dword ptr [eax*4 + 01004FBF0h]
    mov mov dword ptr [esi + 108], 1
    jmp sub_1004FD84
    mov mov dword ptr [esi + 108], 3
    jmp sub_1004FD8D
    mov mov dword ptr [esi + 108], 4
    jmp sub_1004FD96
    mov mov eax, dword ptr [esi + 44]
    mov mov dword ptr [esi + 108], eax
    mov mov al, byte ptr [esi + 82]
    test test al, al
    mov mov eax, 1
    jne sub_1004FDB7
    mov mov eax, dword ptr [esi + 108]
    mov mov edx, esi
    mov mov dword ptr [esi + 112], eax
    call L5
    test test al, al
    je sub_1004FDE1
    mov mov ecx, dword ptr [esi + 011Ch]
    mov mov dword ptr [esi + 116], ecx
    pop pop ecx
    ret ret
    mov mov dword ptr [esi + 116], 1
    pop pop ecx
    ret ret
FUN_1004f9e0 ENDP
END
