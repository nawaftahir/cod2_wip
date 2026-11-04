.686
.MODEL FLAT, C
EXTRN sub_10046A74:PROC
EXTRN sub_10046A87:PROC
EXTRN sub_10046E11:PROC
EXTRN sub_10047017:PROC
.CODE
FUN_10046e00 PROC
    push edi
    mov edi, eax
    cmp dword ptr [edi + 20], 100
    je L0
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [edi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L0:
    mov eax, dword ptr [edi + 76]
    test eax, eax
    jne L1
    mov ecx, dword ptr [edi + 4]
    push 000000348h
    push 0
    push edi
    call dword ptr [ecx]
    add esp, 12
    mov dword ptr [edi + 76], eax
L1:
    push ebx
    push 1
    push 50
    push 010190970h
    xor ebx, ebx
    mov dword ptr [edi + 64], 8
    call sub_10046A74
    push 1
    push 50
    push 010190A70h
    mov ebx, 1
    call sub_10046A87
    add esp, 24
    mov eax, edi
    call sub_10046E11
    lea eax, [edi + 000000090h]
    mov ecx, 16
    mov dl, 5
    pop ebx
    nop
L2:
    mov byte ptr [eax - 16], 0
    mov byte ptr [eax], 1
    mov byte ptr [eax + 16], dl
    inc eax
    dec ecx
    jne L2
    mov ecx, dword ptr [edi + 64]
    xor eax, eax
    cmp ecx, 8
    mov dword ptr [edi + 0000000B4h], eax
    mov dword ptr [edi + 0000000B0h], eax
    mov byte ptr [edi + 0000000B8h], al
    mov byte ptr [edi + 0000000B9h], al
    mov byte ptr [edi + 0000000BAh], al
    mov ecx, 1
    jle L3
    mov byte ptr [edi + 0000000BAh], cl
L3:
    mov byte ptr [edi + 0000000BBh], al
    mov dword ptr [edi + 0000000BCh], eax
    mov dword ptr [edi + 0000000C0h], eax
    mov dword ptr [edi + 0000000C4h], eax
    mov dword ptr [edi + 0000000C8h], eax
    mov byte ptr [edi + 0000000CFh], al
    mov byte ptr [edi + 0000000CDh], cl
    mov byte ptr [edi + 0000000CEh], cl
    mov word ptr [edi + 0000000D0h], cx
    mov word ptr [edi + 0000000D2h], cx
    mov eax, edi
    pop edi
    jmp sub_10047017
FUN_10046e00 ENDP
END
