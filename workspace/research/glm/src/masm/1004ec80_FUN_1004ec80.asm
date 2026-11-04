.686
.MODEL FLAT, C
EXTRN sub_1004EA9C:PROC
EXTRN sub_1004ECDA:PROC
.CODE
FUN_1004ec80 PROC
    sub esp, 28
    mov eax, dword ptr [esp + 32]
    push ebx
    push ebp
    push edi
    mov edi, dword ptr [eax + 32]
    mov ebp, dword ptr [edi + 4]
    test ebp, ebp
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 20], edi
    jne L1
    push eax
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    jne L0
    pop edi
    pop ebp
    pop ebx
    add esp, 28
    ret
L0:
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
L1:
    xor eax, eax
    mov ah, byte ptr [ebx]
    dec ebp
    inc ebx
    test ebp, ebp
    push esi
    mov esi, eax
    jne L4
    mov ecx, dword ptr [esp + 48]
    push ecx
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    jne L3
L2:
    pop esi
    pop edi
    pop ebp
    xor al, al
    pop ebx
    add esp, 28
    ret
L3:
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
L4:
    movzx edx, byte ptr [ebx]
    add esi, edx
    dec ebp
    sub esi, 2
    inc ebx
    cmp esi, 14
    jl L5
    mov eax, 14
    mov dword ptr [esp + 16], eax
    jmp L6
L5:
    xor eax, eax
    test esi, esi
    setle al
    dec eax
    and eax, esi
    mov dword ptr [esp + 16], eax
L6:
    xor ecx, ecx
    test eax, eax
    mov dword ptr [esp + 20], ecx
    jbe L9
    mov edi, edi
L7:
    test ebp, ebp
    jne L8
    mov ecx, dword ptr [esp + 48]
    push ecx
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L2
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 20]
L8:
    mov dl, byte ptr [ebx]
    dec ebp
    inc ebx
    mov byte ptr [esp + ecx + 28], dl
    inc ecx
    cmp ecx, eax
    mov dword ptr [esp + 20], ecx
    jb L7
L9:
    mov edx, dword ptr [esp + 48]
    mov ecx, dword ptr [edx + 000000184h]
    sub esi, eax
    sub ecx, 0000000E0h
    mov dword ptr [esp + 20], esi
    je L11
    sub ecx, 14
    je L10
    mov eax, dword ptr [edx]
    mov dword ptr [eax + 20], 68
    mov ecx, dword ptr [edx]
    mov eax, dword ptr [edx + 000000184h]
    mov dword ptr [ecx + 24], eax
    mov ecx, dword ptr [edx]
    push edx
    call dword ptr [ecx]
    add esp, 4
    jmp L13
L10:
    push esi
    mov ecx, eax
    lea eax, [esp + 32]
    mov esi, edx
    call sub_1004ECDA
    add esp, 4
    jmp L12
L11:
    mov ecx, esi
    lea edi, [esp + 28]
    mov esi, edx
    call sub_1004EA9C
    mov edi, dword ptr [esp + 24]
L12:
    mov esi, dword ptr [esp + 20]
L13:
    test esi, esi
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 4], ebp
    jle L14
    mov eax, dword ptr [esp + 48]
    mov edx, dword ptr [eax + 32]
    push esi
    push eax
    call dword ptr [edx + 0x10]
    add esp, 8
L14:
    pop esi
    pop edi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 28
    ret
FUN_1004ec80 ENDP
END
