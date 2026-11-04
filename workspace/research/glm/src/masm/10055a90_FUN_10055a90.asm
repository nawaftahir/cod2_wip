.686
.MODEL FLAT, C
EXTRN sub_1005597F:PROC
.CODE
FUN_10055a90 PROC
    sub esp, 40
    push ebx
    mov ebx, dword ptr [esp + 48]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [ebx + 0000001B0h]
    lea esi, [edi + 32]
    push esi
    push ebx
    mov dword ptr [esp + 60], edi
    call sub_1005597F
    add esp, 8
    mov ebp, eax
    cmp dword ptr [ebx + 108], 3
    push 1
    mov dword ptr [esp + 48], ebp
    push ebx
    jne L0
    mov eax, dword ptr [ebx]
    add eax, 24
    mov dword ptr [eax], ebp
    mov ecx, dword ptr [esi]
    mov dword ptr [eax + 4], ecx
    mov edx, dword ptr [edi + 36]
    mov dword ptr [eax + 8], edx
    mov ecx, dword ptr [edi + 40]
    mov dword ptr [eax + 12], ecx
    mov edx, dword ptr [ebx]
    mov dword ptr [edx + 20], 94
    jmp L1
L0:
    mov ecx, dword ptr [ebx]
    mov dword ptr [ecx + 20], 95
    mov edx, dword ptr [ebx]
    mov dword ptr [edx + 24], ebp
L1:
    mov eax, dword ptr [ebx]
    call dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 108]
    mov ecx, dword ptr [ebx + 4]
    add esp, 8
    push edx
    push ebp
    push 1
    push ebx
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [ebx + 108]
    add esp, 16
    test ecx, ecx
    mov dword ptr [esp + 48], eax
    mov dword ptr [esp + 20], ebp
    mov dword ptr [esp + 32], 0
    jle L10
    mov edi, eax
    mov dword ptr [esp + 24], esi
    lea esp, [esp]
L2:
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esp + 20]
    cdq
    idiv ecx
    test ecx, ecx
    mov esi, eax
    jle L9
    lea eax, [ecx - 1]
    mov dword ptr [esp + 40], eax
    cdq
    sub eax, edx
    sar eax, 1
    xor ebx, ebx
    mov dword ptr [esp + 36], eax
    mov dword ptr [esp + 16], ebx
    mov dword ptr [esp + 28], ecx
    jmp L4
L3:
    mov eax, dword ptr [esp + 36]
L4:
    mov ecx, dword ptr [esp + 16]
    add eax, ecx
    cdq
    idiv dword ptr [esp + 40]
    cmp ebx, ebp
    mov edx, ebx
    jge L8
L5:
    xor ecx, ecx
    test esi, esi
    jle L7
    lea ebx, [ebx]
L6:
    mov ebp, dword ptr [edi]
    add ebp, ecx
    inc ecx
    cmp ecx, esi
    mov byte ptr [edx + ebp], al
    jl L6
    mov ebp, dword ptr [esp + 44]
L7:
    add edx, dword ptr [esp + 20]
    cmp edx, ebp
    jl L5
L8:
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 28]
    add edx, 0000000FFh
    add ebx, esi
    dec eax
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 28], eax
    jne L3
    mov ebx, dword ptr [esp + 60]
L9:
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [ebx + 108]
    mov dword ptr [esp + 20], esi
    mov esi, dword ptr [esp + 24]
    inc eax
    add esi, 4
    add edi, 4
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 24], esi
    jl L2
    mov eax, dword ptr [esp + 52]
    mov edx, dword ptr [esp + 48]
    pop edi
    pop esi
    mov dword ptr [eax + 20], ebp
    pop ebp
    mov dword ptr [eax + 16], edx
    pop ebx
    add esp, 40
    ret
L10:
    mov dword ptr [edi + 20], ebp
    mov dword ptr [edi + 16], eax
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 40
    ret
FUN_10055a90 ENDP
END
