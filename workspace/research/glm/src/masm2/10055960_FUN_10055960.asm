.686
.MODEL FLAT, C
EXTRN sub_10055A46:PROC
EXTRN sub_10055A58:PROC
EXTRN sub_10055A7D:PROC
EXTRN sub_10055A9D:PROC
EXTRN sub_10055AA8:PROC
EXTRN sub_10055AB0:PROC
EXTRN sub_10055AB8:PROC
EXTRN sub_10055AC6:PROC
EXTRN sub_10055ACB:PROC
EXTRN sub_10055AF7:PROC
.CODE
FUN_10055960 PROC
    sub sub esp, 12
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 32]
    mov mov esi, dword ptr [edi + 108]
    mov mov edx, dword ptr [edi + 92]
    mov mov dword ptr [esp + 20], esi
    mov mov dword ptr [esp + 24], edx
    mov mov ebp, 1
    mov mov edi, edi
    inc inc ebp
    cmp cmp esi, 1
    mov mov eax, ebp
    jle L2
    lea lea ecx, [esi - 1]
    jmp L1
    lea lea ecx, [ecx]
    imul imul eax, ebp
    dec dec ecx
    jne L3
    cmp cmp eax, edx
    jle L0
    dec dec ebp
    cmp cmp ebp, 2
    jge L4
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 20], 56
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 24], eax
    mov mov eax, dword ptr [edi]
    push push edi
    call call dword ptr [eax]
    add add esp, 4
    test test esi, esi
    mov mov ebx, 1
L1:
    jle L6
    mov mov edi, dword ptr [esp + 36]
    mov mov ecx, esi
    mov mov eax, ebp
    mov mov edx, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    jmp L5
    lea lea ecx, [ecx]
    imul imul ebx, ebp
    dec dec edx
    jne sub_10055A46
    jmp sub_10055A58
    mov mov esi, dword ptr [esp + 20]
    lea lea esp, [esp]
    xor xor ebp, ebp
    test test esi, esi
    mov mov byte ptr [esp + 19], 0
    jle sub_10055ACB
    jmp sub_10055A7D
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [esp + 32]
    cmp cmp dword ptr [ecx + 52], 2
    jne sub_10055A9D
    mov mov edi, dword ptr [ebp*4 + 0101911F0h]
    jmp sub_10055AA8
    mov mov edi, ebp
    mov mov edx, dword ptr [esp + 36]
    mov mov esi, dword ptr [edx + edi*4]
    mov mov eax, ebx
    cdq cdq
    idiv idiv esi
    mov mov edx, dword ptr [esp + 24]
    lea lea ecx, [esi + 1]
    imul imul eax, ecx
    cmp cmp eax, edx
    jg sub_10055AF7
    mov mov edx, dword ptr [esp + 36]
    mov mov ebx, eax
    mov mov eax, dword ptr [esp + 20]
    inc inc ebp
    cmp cmp ebp, eax
    mov mov dword ptr [edx + edi*4], ecx
    mov mov byte ptr [esp + 19], 1
    jl sub_10055AC6
    jmp sub_10055AB0
    mov mov al, byte ptr [esp + 19]
    test test al, al
    jne sub_10055AB8
    pop pop edi
FUN_10055960 ENDP
END
