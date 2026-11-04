.686
.MODEL FLAT, C
EXTRN sub_1006508D:PROC
EXTRN sub_10065105:PROC
EXTRN sub_1008291B:PROC
EXTRN sub_10083183:PROC
EXTRN sub_1009953E:PROC
EXTRN sub_100A0E93:PROC
.CODE
FUN_100a121f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 24], ebx
    jne L0
    xor eax, eax
    jmp L9
L0:
    push edi
    push 36
    call sub_1006508D
    cmp eax, ebx
    je L1
    mov ecx, eax
    call sub_10083183
    mov edi, eax
    jmp L2
L1:
    xor edi, edi
L2:
    cmp edi, ebx
    je L7
    xor ecx, ecx
    inc ecx
    cmp dword ptr [ebp + 8], ebx
    mov dword ptr [edi + 16], ecx
    mov eax, dword ptr [esi + 24]
    je L4
    cmp dword ptr [eax + 32], ebx
    jne L5
    mov eax, dword ptr [esi + 16]
    push dword ptr [eax + 20]
    push 010115390h
    push 000000C07h
L3:
    lea eax, [esi + 32]
    push eax
    push esi
    call sub_1009953E
    add esp, 20
    jmp L6
L4:
    cmp dword ptr [eax + 32], ebx
    je L6
    mov eax, dword ptr [esi + 16]
    push dword ptr [eax + 20]
    push 01010FB4Ch
    push 000000C08h
    jmp L3
L5:
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    push dword ptr [eax + 44]
    push 21
    call sub_100A0E93
    mov dword ptr [edi + 20], eax
L6:
    push 20
    call sub_10065105
    cmp eax, ebx
    je L7
    push 010114734h
    push ebx
    push edi
    mov ecx, eax
    call sub_1008291B
    jmp L8
L7:
    xor eax, eax
L8:
    pop edi
L9:
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_100a121f ENDP
END
