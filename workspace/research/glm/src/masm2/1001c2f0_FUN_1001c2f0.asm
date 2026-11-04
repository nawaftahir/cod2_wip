.686
.MODEL FLAT, C
EXTRN sub_1001C3C3:PROC
EXTRN sub_1001C3D6:PROC
EXTRN sub_1001C3EE:PROC
EXTRN sub_1001C3FC:PROC
EXTRN sub_1001C409:PROC
EXTRN sub_1001C425:PROC
EXTRN sub_10061CD9:PROC
EXTRN sub_10061D28:PROC
.CODE
FUN_1001c2f0 PROC
    mov mov eax, dword ptr [esp + 12]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    push push esi
    xor xor esi, esi
    test test eax, eax
    jle sub_1001C3C3
    mov mov ax, word ptr [ebp + esi*8]
    cmp cmp ax, 2
    jne L2
    movzx movzx edx, word ptr [edi + 54]
    xor xor ecx, ecx
    test test edx, edx
    jle L0
    mov mov ebx, dword ptr [ebp + esi*8 + 4]
    mov mov eax, dword ptr [edi + 64]
    cmp cmp dword ptr [eax], ebx
    je sub_1001C3D6
    inc inc ecx
    add add eax, 20
    cmp cmp ecx, edx
    jl L1
    mov mov eax, dword ptr [ebp + esi*8 + 4]
    mov mov ecx, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 20]
    push push eax
    mov mov eax, dword ptr [edi]
    push push ecx
    push push edx
    push push eax
    push push 010194A00h
    call sub_10061CD9
    add add esp, 20
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    ret ret
    cmp cmp ax, 4
    jne sub_1001C409
    movzx movzx edx, word ptr [edi + 52]
    xor xor ecx, ecx
L1:
    test test edx, edx
    jle sub_1001C3EE
    mov mov ebx, dword ptr [ebp + esi*8 + 4]
    mov mov eax, dword ptr [edi + 60]
    lea lea esp, [esp]
    cmp cmp dword ptr [eax], ebx
L2:
    je sub_1001C425
    inc inc ecx
    add add eax, 12
    cmp cmp ecx, edx
    jl sub_1001C3FC
    mov mov ecx, dword ptr [ebp + esi*8 + 4]
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 20]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push edx
    push push eax
    push push ecx
    push push 0101949A0h
    call sub_10061D28
    add add esp, 20
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esp + 24]
    inc inc esi
    cmp cmp esi, eax
    jl sub_1001C3C3
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    ret ret
FUN_1001c2f0 ENDP
END
