.686
.MODEL FLAT, C
.CODE
FUN_1000de10 PROC
    sub esp, 40
    cmp edx, 1
    push ebx
    push esi
    mov esi, dword ptr [esp + 56]
    mov ebx, eax
    jne L0
    cmp esi, edx
    je L11
L0:
    mov eax, edx
    imul edx, ecx
    sar eax, 1
    push ebp
    mov ebp, eax
    imul ebp, ecx
    sar esi, 1
    test eax, eax
    push edi
    mov edi, dword ptr [esp + 60]
    mov dword ptr [esp + 16], ebx
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 48], edx
    mov dword ptr [esp + 52], ebp
    je L6
    test esi, esi
    je L6
    jle L10
    mov ebp, edi
    mov dword ptr [esp + 36], ebx
    mov dword ptr [esp + 32], ebp
    mov dword ptr [esp + 40], esi
L1:
    test eax, eax
    mov esi, ebx
    mov dword ptr [esp + 24], ebp
    mov dword ptr [esp + 16], esi
    jle L5
    mov dword ptr [esp + 28], eax
L2:
    test ecx, ecx
    jle L4
    mov edi, ecx
    lea eax, [edx + ebp]
    sub edi, edx
    sub ebp, esi
    mov dword ptr [esp + 20], ecx
L3:
    movzx ebx, byte ptr [esi + ebp]
    movzx edx, byte ptr [edi + eax]
    add edx, ebx
    movzx ebx, byte ptr [eax + ecx]
    add edx, ebx
    movzx ebx, byte ptr [eax]
    add edx, ebx
    sar edx, 2
    mov byte ptr [esi], dl
    mov edx, dword ptr [esp + 20]
    inc eax
    inc esi
    dec edx
    mov dword ptr [esp + 20], edx
    jne L3
    mov ebp, dword ptr [esp + 24]
    mov esi, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 44]
    mov edx, dword ptr [esp + 48]
L4:
    lea edi, [ecx + ecx]
    add ebp, edi
    mov edi, dword ptr [esp + 28]
    add esi, ecx
    dec edi
    mov dword ptr [esp + 16], esi
    mov dword ptr [esp + 24], ebp
    mov dword ptr [esp + 28], edi
    jne L2
    mov ebx, dword ptr [esp + 36]
L5:
    mov ebp, dword ptr [esp + 32]
    mov edi, dword ptr [esp + 52]
    lea esi, [edx + edx]
    add ebp, esi
    mov esi, dword ptr [esp + 40]
    add ebx, edi
    dec esi
    mov dword ptr [esp + 32], ebp
    mov dword ptr [esp + 36], ebx
    mov dword ptr [esp + 40], esi
    jne L1
    pop edi
    pop ebp
    pop esi
    pop ebx
    add esp, 40
    ret
L6:
    add eax, esi
    test eax, eax
    jle L10
    mov dword ptr [esp + 40], eax
L7:
    test ecx, ecx
    jle L9
    mov esi, dword ptr [esp + 16]
    mov eax, edi
    sub esi, edi
    mov ebp, ecx
    mov edi, edi
L8:
    movzx edx, byte ptr [eax + ecx]
    movzx ebx, byte ptr [eax]
    add edx, ebx
    sar edx, 1
    mov byte ptr [esi + eax], dl
    inc eax
    dec ebp
    jne L8
L9:
    mov esi, dword ptr [esp + 16]
    lea eax, [ecx + ecx]
    add edi, eax
    mov eax, dword ptr [esp + 40]
    add esi, ecx
    dec eax
    mov dword ptr [esp + 16], esi
    mov dword ptr [esp + 40], eax
    jne L7
L10:
    pop edi
    pop ebp
L11:
    pop esi
    pop ebx
    add esp, 40
    ret
FUN_1000de10 ENDP
END
