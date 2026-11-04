.686
.MODEL FLAT, C
EXTRN sub_1001ADDE:PROC
EXTRN sub_1001AFC1:PROC
EXTRN sub_1001AFC6:PROC
EXTRN sub_1001AFFC:PROC
EXTRN sub_1001B012:PROC
EXTRN sub_1005FB07:PROC
EXTRN sub_1005FB38:PROC
EXTRN sub_1005FB7F:PROC
.CODE
FUN_1001af10 PROC
    push push ecx
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    mov mov ebx, eax
    push push 1
    push push 010195544h
    mov mov ecx, ebx
    call sub_1005FB07
    add add esp, 8
    test test eax, eax
    jne L0
    pop pop ebp
    xor xor al, al
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [esp + 20]
    push push esi
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_1001AFC1
    mov mov esi, 10
    cmp cmp esi, 10
    je L1
    push push 1
    push push 01019581Ch
    mov mov ecx, ebx
    call sub_1005FB38
    add add esp, 8
    test test eax, eax
    je sub_1001AFFC
    mov mov ecx, dword ptr [esp + 24]
    lea lea eax, [esp + 16]
    push push eax
    push push ecx
    call sub_1001ADDE
    add add esp, 8
    test test al, al
    je sub_1001B012
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [ebp]
    mov mov ecx, esi
    shl shl edx, cl
    add add esi, 5
    or or eax, edx
    mov mov dword ptr [ebp], eax
    mov mov eax, dword ptr [esp + 28]
    inc inc edi
    cmp cmp edi, eax
    jl sub_1001AFC6
    push push 1
    push push 010195540h
    mov mov ecx, ebx
    call sub_1005FB7F
    add add esp, 8
    pop pop edi
    pop pop esi
    test test eax, eax
    pop pop ebp
    setne setne al
    pop pop ebx
    pop pop ecx
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1001af10 ENDP
END
