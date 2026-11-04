.686
.MODEL FLAT, C
EXTRN sub_1002C618:PROC
EXTRN sub_1002C61C:PROC
EXTRN sub_1002C686:PROC
EXTRN sub_1002C691:PROC
EXTRN sub_1005EEC1:PROC
EXTRN sub_1005EEF3:PROC
.CODE
FUN_1002c570 PROC
    mov mov eax, dword ptr [esi + 16]
    push push ebx
    push push ebp
    xor xor ebp, ebp
    cmp cmp eax, 1
    push push edi
    je L0
    lea lea ecx, [ecx]
    inc inc ebp
    mov mov edx, 1
    mov mov ecx, ebp
    shl shl edx, cl
    cmp cmp eax, edx
    jne L1
    mov mov edx, dword ptr [esi + 12]
    xor xor ebx, ebx
    cmp cmp edx, 1
    je L2
    inc inc ebx
    mov mov edi, 1
L1:
    mov mov ecx, ebx
    shl shl edi, cl
    cmp cmp edx, edi
    jne L2
    xor xor edi, edi
    test test eax, eax
    jle sub_1002C618
    lea lea esp, [esp]
    mov mov eax, dword ptr [esi + 12]
    mov mov ecx, dword ptr [esp + 16]
    imul imul eax, edi
    push push 0101D7210h
    push push 0101D7A10h
    lea lea edx, [ecx + eax*8]
    push push 1
    push push edx
    mov mov edx, ebx
    call sub_1005EEC1
    mov mov eax, dword ptr [esi + 16]
    add add esp, 16
    inc inc edi
    cmp cmp edi, eax
    jl sub_1002C61C
    mov mov eax, dword ptr [esi + 12]
    xor xor edi, edi
    test test eax, eax
    jle sub_1002C686
    mov mov ebx, dword ptr [esp + 16]
    lea lea esp, [esp]
    push push 0101D7210h
    push push 0101D7A10h
    push push eax
    push push ebx
    mov mov edx, ebp
    call sub_1005EEF3
    mov mov eax, dword ptr [esi + 12]
    add add esp, 16
    inc inc edi
    add add ebx, 8
    cmp cmp edi, eax
    jl sub_1002C691
    pop pop edi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1002c570 ENDP
END
