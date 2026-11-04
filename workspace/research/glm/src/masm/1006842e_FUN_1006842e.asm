.686
.MODEL FLAT, C
EXTRN sub_10063862:PROC
EXTRN sub_10067A18:PROC
EXTRN sub_10068261:PROC
EXTRN sub_1006828B:PROC
EXTRN sub_100F8573:PROC
EXTRN sub_100F8585:PROC
.CODE
FUN_1006842e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    mov ebx, ecx
    test byte ptr [ebx + 40], 2
    jne L0
    xor eax, eax
    jmp L4
L0:
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    lea edi, [esi + 1]
    cmp edi, dword ptr [ebx + 4]
    jae L2
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8573
    test eax, eax
    pop ecx
    je L2
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F8585
    test eax, eax
    pop ecx
    je L2
    lea edi, [esi + 2]
    cmp edi, dword ptr [ebx + 4]
    jae L2
    cmp byte ptr [edi], 46
    jne L2
    lea eax, [ebp + 8]
    push eax
    inc edi
    push edi
    mov ecx, ebx
    call sub_10068261
    test eax, eax
    je L2
    cmp dword ptr [ebp + 8], 0000000FFh
    ja L2
    add edi, eax
    cmp edi, dword ptr [ebx + 4]
    jae L2
    cmp byte ptr [edi], 46
    jne L2
    lea eax, [ebp + 8]
    push eax
    inc edi
    push edi
    mov ecx, ebx
    call sub_1006828B
    test eax, eax
    jne L1
    lea eax, [ebp + 8]
    push eax
    push edi
    mov ecx, ebx
    call sub_10067A18
    test eax, eax
    je L2
    and dword ptr [ebp + 8], 0
L1:
    cmp dword ptr [ebp + 8], 0000000FFh
    ja L2
    add edi, eax
    mov ebx, edi
    sub ebx, esi
    cmp ebx, 32
    jae L2
    mov ecx, ebx
    mov eax, ecx
    shr ecx, 2
    lea edi, [ebp - 44]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    lea eax, [ebp - 12]
    push eax
    and ecx, 3
    push 1
    lea eax, [ebp - 44]
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push eax
    mov byte ptr [ebp + ebx - 44], 0
    call sub_10063862
    test eax, eax
    jl L2
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [eax], ecx
    mov eax, ebx
    jmp L3
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
L4:
    pop ebx
    leave
    ret 8
FUN_1006842e ENDP
END
