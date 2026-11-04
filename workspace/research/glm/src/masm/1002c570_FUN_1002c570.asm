.686
.MODEL FLAT, C
EXTRN sub_1005EEC1:PROC
EXTRN sub_1005EEF3:PROC
.CODE
FUN_1002c570 PROC
    mov eax, dword ptr [esi + 16]
    push ebx
    push ebp
    xor ebp, ebp
    cmp eax, 1
    push edi
    je L1
    lea ecx, [ecx]
L0:
    inc ebp
    mov edx, 1
    mov ecx, ebp
    shl edx, cl
    cmp eax, edx
    jne L0
L1:
    mov edx, dword ptr [esi + 12]
    xor ebx, ebx
    cmp edx, 1
    je L3
L2:
    inc ebx
    mov edi, 1
    mov ecx, ebx
    shl edi, cl
    cmp edx, edi
    jne L2
L3:
    xor edi, edi
    test eax, eax
    jle L5
    lea esp, [esp]
L4:
    mov eax, dword ptr [esi + 12]
    mov ecx, dword ptr [esp + 16]
    imul eax, edi
    push 0101D7210h
    push 0101D7A10h
    lea edx, [ecx + eax*8]
    push 1
    push edx
    mov edx, ebx
    call sub_1005EEC1
    mov eax, dword ptr [esi + 16]
    add esp, 16
    inc edi
    cmp edi, eax
    jl L4
L5:
    mov eax, dword ptr [esi + 12]
    xor edi, edi
    test eax, eax
    jle L7
    mov ebx, dword ptr [esp + 16]
    lea esp, [esp]
L6:
    push 0101D7210h
    push 0101D7A10h
    push eax
    push ebx
    mov edx, ebp
    call sub_1005EEF3
    mov eax, dword ptr [esi + 12]
    add esp, 16
    inc edi
    add ebx, 8
    cmp edi, eax
    jl L6
L7:
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1002c570 ENDP
END
