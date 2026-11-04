.686
.MODEL FLAT, C
EXTRN sub_10046A74:PROC
EXTRN sub_10046A87:PROC
EXTRN sub_10046F0E:PROC
EXTRN sub_10046F7C:PROC
EXTRN sub_10047017:PROC
.CODE
FUN_10046e00 PROC
    push push edi
    mov mov edi, eax
    cmp cmp dword ptr [edi + 20], 100
    je L1
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [eax + 20], 20
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [edi + 20]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [edi]
    push push edi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [edi + 76]
    test test eax, eax
    jne L2
    mov mov ecx, dword ptr [edi + 4]
    push push 0348h
    push push 0
    push push edi
    call call dword ptr [ecx]
    add add esp, 12
    mov mov dword ptr [edi + 76], eax
    push push ebx
    push push 1
    push push 50
    push push 010190970h
    xor xor ebx, ebx
    mov mov dword ptr [edi + 64], 8
    call sub_10046A74
    push push 1
    push push 50
    push push 010190A70h
    mov mov ebx, 1
    call sub_10046A87
    add add esp, 24
    mov mov eax, edi
    call L0
    lea lea eax, [edi + 090h]
    mov mov ecx, 16
    mov mov dl, 5
    pop pop ebx
    nop nop
    mov mov byte ptr [eax - 16], 0
    mov mov byte ptr [eax], 1
    mov mov byte ptr [eax + 16], dl
    inc inc eax
    dec dec ecx
    jne sub_10046F0E
    mov mov ecx, dword ptr [edi + 64]
    xor xor eax, eax
    cmp cmp ecx, 8
    mov mov dword ptr [edi + 0B4h], eax
    mov mov dword ptr [edi + 0B0h], eax
    mov mov byte ptr [edi + 0B8h], al
    mov mov byte ptr [edi + 0B9h], al
    mov mov byte ptr [edi + 0BAh], al
    mov mov ecx, 1
    jle sub_10046F7C
    mov mov byte ptr [edi + 0BAh], cl
    mov mov byte ptr [edi + 0BBh], al
    mov mov dword ptr [edi + 0BCh], eax
    mov mov dword ptr [edi + 0C0h], eax
    mov mov dword ptr [edi + 0C4h], eax
    mov mov dword ptr [edi + 0C8h], eax
    mov mov byte ptr [edi + 0CFh], al
    mov mov byte ptr [edi + 0CDh], cl
    mov mov byte ptr [edi + 0CEh], cl
    mov mov word ptr [edi + 0D0h], cx
    mov mov word ptr [edi + 0D2h], cx
    mov mov eax, edi
    pop pop edi
    jmp sub_10047017
FUN_10046e00 ENDP
END
