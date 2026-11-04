.686
.MODEL FLAT, C
EXTRN sub_1004EA9C:PROC
EXTRN sub_1004EDCF:PROC
EXTRN sub_1004EDD1:PROC
EXTRN sub_1004EE5A:PROC
EXTRN sub_1004EE68:PROC
EXTRN sub_1004EEA0:PROC
EXTRN sub_1004EEAF:PROC
EXTRN sub_1004EEE9:PROC
.CODE
FUN_1004ec80 PROC
    sub sub esp, 28
    mov mov eax, dword ptr [esp + 32]
    push push ebx
    push push ebp
    push push edi
    mov mov edi, dword ptr [eax + 32]
    mov mov ebp, dword ptr [edi + 4]
    test test ebp, ebp
    mov mov ebx, dword ptr [edi]
    mov mov dword ptr [esp + 20], edi
    jne L0
    push push eax
    call call dword ptr [edi + 12]
    add add esp, 4
    test test al, al
    jne L1
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 28
    ret ret
    mov mov ebx, dword ptr [edi]
    mov mov ebp, dword ptr [edi + 4]
    xor xor eax, eax
    mov mov ah, byte ptr [ebx]
    dec dec ebp
    inc inc ebx
    test test ebp, ebp
    push push esi
    mov mov esi, eax
    jne L3
    mov mov ecx, dword ptr [esp + 48]
    push push ecx
    call call dword ptr [edi + 12]
    add add esp, 4
    test test al, al
L0:
    jne L4
    pop pop esi
    pop pop edi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 28
    ret ret
    mov mov ebx, dword ptr [edi]
    mov mov ebp, dword ptr [edi + 4]
    movzx movzx edx, byte ptr [ebx]
    add add esi, edx
    dec dec ebp
    sub sub esi, 2
    inc inc ebx
    cmp cmp esi, 14
    jl L5
    mov mov eax, 14
    mov mov dword ptr [esp + 16], eax
    jmp L7
    xor xor eax, eax
    test test esi, esi
    setle setle al
    dec dec eax
    and and eax, esi
    mov mov dword ptr [esp + 16], eax
    xor xor ecx, ecx
    test test eax, eax
    mov mov dword ptr [esp + 20], ecx
    jbe sub_1004EDCF
    mov mov edi, edi
    test test ebp, ebp
    jne L8
    mov mov ecx, dword ptr [esp + 48]
    push push ecx
    call call dword ptr [edi + 12]
    add add esp, 4
    test test al, al
    je L6
    mov mov ebx, dword ptr [edi]
    mov mov ebp, dword ptr [edi + 4]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 20]
    mov mov dl, byte ptr [ebx]
    dec dec ebp
    inc inc ebx
    mov mov byte ptr [esp + ecx + 28], dl
    inc inc ecx
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 20], ecx
    jb sub_1004EDD1
    mov mov edx, dword ptr [esp + 48]
    mov mov ecx, dword ptr [edx + 0184h]
    sub sub esi, eax
    sub sub ecx, 0E0h
    mov mov dword ptr [esp + 20], esi
    je sub_1004EE68
    sub sub ecx, 14
    je sub_1004EE5A
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [eax + 20], 68
    mov mov ecx, dword ptr [edx]
    mov mov eax, dword ptr [edx + 0184h]
    mov mov dword ptr [ecx + 24], eax
    mov mov ecx, dword ptr [edx]
    push push edx
    call call dword ptr [ecx]
    add add esp, 4
L7:
    jmp sub_1004EEA0
    push push esi
    mov mov ecx, eax
    lea lea eax, [esp + 32]
    mov mov esi, edx
    call L2
    add add esp, 4
    jmp sub_1004EEAF
    mov mov ecx, esi
    lea lea edi, [esp + 28]
    mov mov esi, edx
    call sub_1004EA9C
    mov mov edi, dword ptr [esp + 24]
    mov mov esi, dword ptr [esp + 20]
    test test esi, esi
    mov mov dword ptr [edi], ebx
    mov mov dword ptr [edi + 4], ebp
    jle sub_1004EEE9
    mov mov eax, dword ptr [esp + 48]
    mov mov edx, dword ptr [eax + 32]
    push push esi
    push push eax
    call call dword ptr [edx + 16]
    add add esp, 8
    pop pop esi
    pop pop edi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    add add esp, 28
    ret ret
FUN_1004ec80 ENDP
END
