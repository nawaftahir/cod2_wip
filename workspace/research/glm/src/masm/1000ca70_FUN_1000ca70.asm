.686
.MODEL FLAT, C
EXTRN sub_1000F0A9:PROC
.CODE
FUN_1000ca70 PROC
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 20]
    push esi
    mov ebx, eax
    mov eax, dword ptr [esp + 28]
    push edi
    xor edi, edi
    and eax, 1
    lea ecx, [ebp + 16]
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 16], ecx
    jmp L1
L0:
    mov eax, dword ptr [esp + 20]
L1:
    test eax, eax
    je L2
    mov esi, dword ptr [esp + 36]
    mov eax, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 44]
    jmp L5
L2:
    movzx ecx, byte ptr [edi + ebp + 8]
    mov eax, dword ptr [esp + 36]
    sar eax, cl
    mov edx, 1
    mov esi, 1
    sub edx, eax
    jns L3
    mov esi, eax
L3:
    mov edx, dword ptr [esp + 40]
    sar edx, cl
    mov eax, 1
    sub eax, edx
    mov eax, 1
    jns L4
    mov eax, edx
L4:
    mov edx, dword ptr [esp + 44]
    sar edx, cl
    mov ecx, 1
    sub ecx, edx
    js L5
    mov edx, 1
L5:
    mov ecx, dword ptr [esp + 32]
    push esi
    push ecx
    call sub_1000F0A9
    mov edx, dword ptr [esp + 24]
    mov dword ptr [edx], eax
    movzx ecx, byte ptr [ebp + 12]
    add esp, 8
    test ecx, ecx
    jl L6
    cmp ecx, 1
    jle L7
    cmp ecx, 4
    je L7
L6:
    add dword ptr [edi*4 + 0101D0A74h], eax
L7:
    mov ecx, dword ptr [esp + 16]
    inc edi
    add ecx, 4
    cmp edi, 2
    mov dword ptr [esp + 16], ecx
    jl L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_1000ca70 ENDP
END
