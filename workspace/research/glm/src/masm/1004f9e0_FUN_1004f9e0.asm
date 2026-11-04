.686
.MODEL FLAT, C
EXTRN sub_1004FB57:PROC
.CODE
FUN_1004f9e0 PROC
    push ecx
    cmp dword ptr [esi + 20], 0000000CAh
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L0:
    mov eax, dword ptr [esi + 56]
    mov ecx, dword ptr [esi + 60]
    lea edx, [eax*8]
    cmp edx, ecx
    ja L1
    mov eax, dword ptr [esi + 36]
    add eax, 7
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    mov dword ptr [esi + 100], eax
    mov eax, dword ptr [esi + 40]
    add eax, 7
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    mov dword ptr [esi + 104], eax
    mov dword ptr [esi + 000000120h], 1
    jmp L4
L1:
    lea edx, [eax*4]
    cmp edx, ecx
    ja L2
    mov eax, dword ptr [esi + 36]
    add eax, 3
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    mov dword ptr [esi + 100], eax
    mov eax, dword ptr [esi + 40]
    add eax, 3
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    mov dword ptr [esi + 104], eax
    mov dword ptr [esi + 000000120h], 2
    jmp L4
L2:
    add eax, eax
    cmp eax, ecx
    ja L3
    mov eax, dword ptr [esi + 36]
    inc eax
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [esi + 100], eax
    mov eax, dword ptr [esi + 40]
    inc eax
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [esi + 104], eax
    mov dword ptr [esi + 000000120h], 4
    jmp L4
L3:
    mov ecx, dword ptr [esi + 36]
    mov edx, dword ptr [esi + 40]
    mov dword ptr [esi + 100], ecx
    mov dword ptr [esi + 104], edx
    mov dword ptr [esi + 000000120h], 8
L4:
    mov eax, dword ptr [esi + 44]
    test eax, eax
    mov ecx, dword ptr [esi + 0000000CCh]
    push ebx
    push ebp
    push edi
    mov dword ptr [esp + 12], 0
    jle L8
    add ecx, 12
    lea ebx, [ebx]
L5:
    mov edx, dword ptr [esi + 000000120h]
    mov eax, edx
    cmp eax, 8
    jge L7
    mov edi, dword ptr [esi + 000000118h]
    imul edi, edx
L6:
    mov ebx, dword ptr [ecx - 4]
    imul ebx, eax
    shl ebx, 1
    cmp ebx, edi
    jg L7
    mov ebp, dword ptr [ecx]
    mov ebx, dword ptr [esi + 00000011Ch]
    imul ebp, eax
    imul ebx, edx
    shl ebp, 1
    cmp ebp, ebx
    jg L7
    add eax, eax
    cmp eax, 8
    jl L6
L7:
    mov dword ptr [ecx + 24], eax
    mov eax, dword ptr [esp + 12]
    mov edx, dword ptr [esi + 44]
    inc eax
    add ecx, 84
    cmp eax, edx
    mov dword ptr [esp + 12], eax
    jl L5
L8:
    mov ecx, dword ptr [esi + 44]
    mov eax, dword ptr [esi + 0000000CCh]
    xor ebp, ebp
    test ecx, ecx
    jle L10
    lea ecx, [eax + 36]
L9:
    mov ebx, dword ptr [ecx]
    mov eax, dword ptr [ecx - 28]
    mov edi, dword ptr [esi + 000000118h]
    imul eax, ebx
    imul eax, dword ptr [esi + 36]
    shl edi, 3
    lea eax, [eax + edi - 1]
    cdq
    idiv edi
    mov edx, dword ptr [ecx - 24]
    add ecx, 84
    mov dword ptr [ecx - 80], eax
    imul edx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 00000011Ch]
    imul edx, ebx
    shl edi, 3
    lea eax, [edx + edi - 1]
    cdq
    idiv edi
    inc ebp
    mov dword ptr [ecx - 76], eax
    cmp ebp, dword ptr [esi + 44]
    jl L9
L10:
    mov eax, dword ptr [esi + 52]
    pop edi
    dec eax
    cmp eax, 4
    pop ebp
    pop ebx
    ja L11
    jmp dword ptr [eax*4 + 0x1004fbf0]
    mov dword ptr [esi + 108], 1
    jmp L12
    mov dword ptr [esi + 108], 3
    jmp L12
    mov dword ptr [esi + 108], 4
    jmp L12
L11:
    mov eax, dword ptr [esi + 44]
    mov dword ptr [esi + 108], eax
L12:
    mov al, byte ptr [esi + 82]
    test al, al
    mov eax, 1
    jne L13
    mov eax, dword ptr [esi + 108]
L13:
    mov edx, esi
    mov dword ptr [esi + 112], eax
    call sub_1004FB57
    test al, al
    je L14
    mov ecx, dword ptr [esi + 00000011Ch]
    mov dword ptr [esi + 116], ecx
    pop ecx
    ret
L14:
    mov dword ptr [esi + 116], 1
    pop ecx
    ret
FUN_1004f9e0 ENDP
END
