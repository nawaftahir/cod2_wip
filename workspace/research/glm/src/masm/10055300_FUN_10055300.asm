.686
.MODEL FLAT, C
.CODE
FUN_10055300 PROC
    push ecx
    mov eax, dword ptr [esi + 16]
    push ebx
    mov ebx, dword ptr [esi + 24]
    push ebp
    mov ebp, dword ptr [esi + 8]
    push edi
    imul ebx, ebp
    xor edi, edi
    test eax, eax
    mov dword ptr [esp + 12], ebp
    jle L7
    jmp L1
L0:
    mov ebp, dword ptr [esp + 12]
L1:
    mov ecx, dword ptr [esi + 20]
    sub eax, edi
    cmp ecx, eax
    jge L2
    mov eax, ecx
L2:
    mov ecx, dword ptr [esi + 24]
    mov edx, dword ptr [esi + 28]
    add ecx, edi
    sub edx, ecx
    cmp eax, edx
    jl L3
    mov eax, edx
L3:
    mov edx, dword ptr [esi + 4]
    sub edx, ecx
    cmp eax, edx
    jl L4
    mov eax, edx
L4:
    test eax, eax
    jle L7
    imul eax, ebp
    mov ebp, eax
    mov al, byte ptr [esp + 24]
    test al, al
    push ebp
    push ebx
    je L5
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax + edi*4]
    mov eax, dword ptr [esp + 28]
    push ecx
    lea edx, [esi + 40]
    push edx
    push eax
    call dword ptr [esi + 0x2c]
    jmp L6
L5:
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [esp + 28]
    push edx
    lea eax, [esi + 40]
    push eax
    push ecx
    call dword ptr [eax]
L6:
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi + 16]
    add edi, edx
    add esp, 20
    add ebx, ebp
    cmp edi, eax
    jl L0
L7:
    pop edi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_10055300 ENDP
END
