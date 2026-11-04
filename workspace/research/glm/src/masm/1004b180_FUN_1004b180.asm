.686
.MODEL FLAT, C
.CODE
FUN_1004b180 PROC
    sub esp, 8
    mov al, byte ptr [edi + 0000000D0h]
    test al, al
    push esi
    mov esi, dword ptr [edi + 000000190h]
    mov byte ptr [esp + 7], 0
    je L9
    mov eax, dword ptr [edi + 000000094h]
    test eax, eax
    je L9
    mov eax, dword ptr [esi + 112]
    test eax, eax
    push ebx
    mov ebx, 1
    jne L0
    mov eax, dword ptr [edi + 44]
    mov ecx, dword ptr [edi + 4]
    lea edx, [eax + eax*2]
    shl edx, 3
    push edx
    push ebx
    push edi
    call dword ptr [ecx]
    add esp, 12
    mov dword ptr [esi + 112], eax
L0:
    mov edx, dword ptr [esi + 112]
    mov ecx, dword ptr [edi + 44]
    mov eax, dword ptr [edi + 0000000CCh]
    xor esi, esi
    test ecx, ecx
    push ebp
    jle L7
    xor ebp, ebp
    add eax, 76
    mov dword ptr [esp + 16], eax
    nop
L1:
    mov eax, dword ptr [eax]
    test eax, eax
    je L8
    cmp word ptr [eax], 0
    je L8
    cmp word ptr [eax + 2], 0
    je L8
    cmp word ptr [eax + 16], 0
    je L8
    cmp word ptr [eax + 32], 0
    je L8
    cmp word ptr [eax + 18], 0
    je L8
    cmp word ptr [eax + 4], 0
    je L8
    mov eax, dword ptr [edi + 000000094h]
    mov ecx, dword ptr [eax + ebp]
    add eax, ebp
    test ecx, ecx
    jl L8
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [edx + 4], ecx
    mov ecx, dword ptr [eax + 4]
    test ecx, ecx
    je L2
    mov byte ptr [esp + 15], bl
L2:
    mov ecx, 8
    mov ebx, dword ptr [ecx + eax]
    mov dword ptr [ecx + edx], ebx
    cmp dword ptr [ecx + eax], 0
    mov ebx, 1
    je L3
    mov byte ptr [esp + 15], bl
L3:
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [edx + 12], ecx
    mov ecx, dword ptr [eax + 12]
    test ecx, ecx
    je L4
    mov byte ptr [esp + 15], bl
L4:
    mov ecx, dword ptr [eax + 16]
    mov dword ptr [edx + 16], ecx
    mov ecx, dword ptr [eax + 16]
    test ecx, ecx
    je L5
    mov byte ptr [esp + 15], bl
L5:
    mov ecx, dword ptr [eax + 20]
    mov dword ptr [edx + 20], ecx
    mov ecx, dword ptr [eax + 20]
    test ecx, ecx
    je L6
    mov byte ptr [esp + 15], bl
L6:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [edi + 44]
    add edx, 24
    inc esi
    add eax, 84
    add ebp, 000000100h
    cmp esi, ecx
    mov dword ptr [esp + 16], eax
    jl L1
L7:
    mov al, byte ptr [esp + 15]
    pop ebp
    pop ebx
    pop esi
    add esp, 8
    ret
L8:
    pop ebp
    pop ebx
    xor al, al
    pop esi
    add esp, 8
    ret
L9:
    xor al, al
    pop esi
    add esp, 8
    ret
FUN_1004b180 ENDP
END
