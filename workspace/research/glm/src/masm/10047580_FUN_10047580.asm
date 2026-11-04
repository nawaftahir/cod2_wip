.686
.MODEL FLAT, C
EXTRN sub_100475CC:PROC
EXTRN sub_10047662:PROC
EXTRN sub_100476B2:PROC
EXTRN sub_1004773B:PROC
.CODE
FUN_10047580 PROC
    push ebx
    push ebp
    push esi
    mov esi, eax
    cmp dword ptr [esi + 20], 100
    push edi
    mov edi, dword ptr [esi + 68]
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
    cmp edi, 3
    jne L1
    cmp dword ptr [esi + 72], edi
    jne L2
    mov ebx, 10
    jmp L3
L1:
    cmp edi, 4
    jle L2
    lea ebx, [edi + edi*2]
    shl ebx, 1
    jmp L3
L2:
    lea ebx, [edi*4 + 2]
L3:
    mov eax, dword ptr [esi + 000000168h]
    xor ebp, ebp
    cmp eax, ebp
    je L4
    cmp dword ptr [esi + 00000016Ch], ebx
    jge L6
L4:
    cmp ebx, 10
    mov eax, ebx
    jg L5
    mov eax, 10
L5:
    mov ecx, dword ptr [esi + 4]
    lea edx, [eax + eax*8]
    shl edx, 2
    push edx
    push ebp
    push esi
    mov dword ptr [esi + 00000016Ch], eax
    call dword ptr [ecx]
    add esp, 12
    mov dword ptr [esi + 000000168h], eax
L6:
    cmp edi, 3
    mov eax, dword ptr [esi + 000000168h]
    mov dword ptr [esi + 0000000B4h], eax
    mov dword ptr [esi + 0000000B0h], ebx
    jne L7
    cmp dword ptr [esi + 72], edi
    jne L7
    mov esi, 1
    push ebp
    mov ebx, esi
    mov edx, edi
    call sub_100475CC
    mov dword ptr [eax], esi
    mov dword ptr [eax + 4], ebp
    mov dword ptr [eax + 20], esi
    mov dword ptr [eax + 24], 5
    mov dword ptr [eax + 28], ebp
    mov ecx, 2
    mov dword ptr [eax + 32], ecx
    mov dword ptr [eax + 36], esi
    mov dword ptr [eax + 40], ecx
    mov dword ptr [eax + 56], esi
    mov dword ptr [eax + 64], ebp
    mov dword ptr [eax + 68], esi
    mov edi, 63
    mov dword ptr [eax + 60], edi
    mov dword ptr [eax + 72], esi
    mov dword ptr [eax + 76], esi
    mov dword ptr [eax + 92], esi
    mov dword ptr [eax + 96], edi
    mov dword ptr [eax + 100], ebp
    mov dword ptr [eax + 104], esi
    mov dword ptr [eax + 108], esi
    mov dword ptr [eax + 112], ebp
    mov dword ptr [eax + 000000080h], 6
    mov dword ptr [eax + 000000084h], edi
    mov dword ptr [eax + 000000088h], ebp
    mov dword ptr [eax + 00000008Ch], ecx
    mov dword ptr [eax + 000000090h], esi
    mov dword ptr [eax + 000000094h], ebp
    mov dword ptr [eax + 0000000A4h], esi
    mov dword ptr [eax + 0000000A8h], edi
    mov dword ptr [eax + 0000000ACh], ecx
    mov dword ptr [eax + 0000000B0h], esi
    push esi
    add eax, 0000000B4h
    xor ebx, ebx
    call sub_10047662
    mov dword ptr [eax], esi
    mov dword ptr [eax + 20], esi
    mov dword ptr [eax + 24], edi
    mov dword ptr [eax + 28], esi
    mov dword ptr [eax + 32], ebp
    mov dword ptr [eax + 4], 2
    mov dword ptr [eax + 36], esi
    mov dword ptr [eax + 40], esi
    mov dword ptr [eax + 56], esi
    mov dword ptr [eax + 60], edi
    mov dword ptr [eax + 64], esi
    mov dword ptr [eax + 68], ebp
    add esp, 8
    mov dword ptr [eax + 96], edi
    pop edi
    mov dword ptr [eax + 72], esi
    mov dword ptr [eax + 92], esi
    mov dword ptr [eax + 100], esi
    pop esi
    mov dword ptr [eax + 76], ebp
    mov dword ptr [eax + 104], ebp
    pop ebp
    pop ebx
    ret
L7:
    mov esi, 1
    push ebp
    mov ebx, esi
    mov edx, edi
    call sub_100476B2
    add esp, 4
    xor ecx, ecx
    cmp edi, ebp
    jle L9
    mov edx, 5
L8:
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], esi
    mov dword ptr [eax + 20], esi
    mov dword ptr [eax + 24], edx
    mov dword ptr [eax + 28], ebp
    mov dword ptr [eax + 32], 2
    add eax, 36
    inc ecx
    cmp ecx, edi
    jl L8
L9:
    xor ecx, ecx
    cmp edi, ebp
    jle L11
    mov edx, 6
L10:
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], esi
    mov dword ptr [eax + 20], edx
    mov dword ptr [eax + 24], 63
    mov dword ptr [eax + 28], ebp
    mov dword ptr [eax + 32], 2
    add eax, 36
    inc ecx
    cmp ecx, edi
    jl L10
L11:
    xor ecx, ecx
    cmp edi, ebp
    jle L13
    nop
L12:
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], esi
    mov dword ptr [eax + 20], esi
    mov dword ptr [eax + 24], 63
    mov dword ptr [eax + 28], 2
    mov dword ptr [eax + 32], esi
    add eax, 36
    inc ecx
    cmp ecx, edi
    jl L12
L13:
    push esi
    xor ebx, ebx
    mov edx, edi
    call sub_1004773B
    add esp, 4
    xor ecx, ecx
    cmp edi, ebp
    jle L15
L14:
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], esi
    mov dword ptr [eax + 20], esi
    mov dword ptr [eax + 24], 63
    mov dword ptr [eax + 28], esi
    mov dword ptr [eax + 32], ebp
    add eax, 36
    inc ecx
    cmp ecx, edi
    jl L14
L15:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10047580 ENDP
END
