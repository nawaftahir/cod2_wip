.686
.MODEL FLAT, C
EXTRN sub_1001ADDE:PROC
EXTRN sub_1005FB07:PROC
EXTRN sub_1005FB38:PROC
EXTRN sub_1005FB7F:PROC
.CODE
FUN_1001af10 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 24]
    mov ebx, eax
    push 1
    push 010195544h
    mov ecx, ebx
    call sub_1005FB07
    add esp, 8
    test eax, eax
    jne L0
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
L0:
    mov eax, dword ptr [esp + 20]
    push esi
    push edi
    xor edi, edi
    test eax, eax
    jle L3
    mov esi, 10
L1:
    cmp esi, 10
    je L2
    push 1
    push 01019581Ch
    mov ecx, ebx
    call sub_1005FB38
    add esp, 8
    test eax, eax
    je L4
L2:
    mov ecx, dword ptr [esp + 24]
    lea eax, [esp + 16]
    push eax
    push ecx
    call sub_1001ADDE
    add esp, 8
    test al, al
    je L4
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [ebp]
    mov ecx, esi
    shl edx, cl
    add esi, 5
    or eax, edx
    mov dword ptr [ebp], eax
    mov eax, dword ptr [esp + 28]
    inc edi
    cmp edi, eax
    jl L1
L3:
    push 1
    push 010195540h
    mov ecx, ebx
    call sub_1005FB7F
    add esp, 8
    pop edi
    pop esi
    test eax, eax
    pop ebp
    setne al
    pop ebx
    pop ecx
    ret
L4:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
FUN_1001af10 ENDP
END
