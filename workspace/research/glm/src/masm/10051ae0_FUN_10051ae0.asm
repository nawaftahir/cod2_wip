.686
.MODEL FLAT, C
.CODE
FUN_10051ae0 PROC
    sub esp, 16
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [esp + 20]
    mov dword ptr [esp + 12], ecx
    mov ecx, dword ptr [edx + 00000011Ch]
    xor eax, eax
    test ecx, ecx
    jle L6
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 40]
    push edi
    mov dword ptr [esp + 48], esi
    lea ecx, [ecx]
L0:
    xor ecx, ecx
    mov dword ptr [esp + 20], ecx
L1:
    test ecx, ecx
    mov ebp, dword ptr [esi]
    jne L2
    mov edi, dword ptr [esi - 4]
    jmp L3
L2:
    mov edi, dword ptr [esi + 4]
L3:
    movzx esi, byte ptr [ebp]
    movzx edx, byte ptr [edi]
    mov ecx, dword ptr [esp + 28]
    mov ecx, dword ptr [ecx + eax*4]
    inc eax
    lea esi, [esi + esi*2]
    add esi, edx
    movzx edx, byte ptr [edi + 1]
    inc edi
    inc ebp
    mov dword ptr [esp + 24], eax
    movzx eax, byte ptr [ebp]
    lea eax, [eax + eax*2]
    add eax, edx
    lea edx, [esi*4 + 8]
    sar edx, 4
    mov byte ptr [ecx], dl
    inc edi
    lea edx, [eax + esi*2]
    lea edx, [esi + edx + 7]
    sar edx, 4
    inc ebp
    inc ecx
    mov byte ptr [ecx], dl
    mov edx, dword ptr [esp + 40]
    mov edx, dword ptr [edx + 40]
    inc ecx
    sub edx, 2
    mov ebx, esi
    mov esi, eax
    je L5
    mov dword ptr [esp + 16], edx
    jmp L4
    lea ecx, [ecx]
L4:
    movzx eax, byte ptr [ebp]
    movzx edx, byte ptr [edi]
    lea eax, [eax + eax*2]
    add eax, edx
    lea edx, [esi + esi*2]
    lea ebx, [edx + ebx + 8]
    sar ebx, 4
    inc edi
    mov byte ptr [ecx], bl
    lea edx, [edx + eax + 7]
    inc ebp
    sar edx, 4
    inc ecx
    mov byte ptr [ecx], dl
    mov edx, dword ptr [esp + 16]
    inc ecx
    dec edx
    mov ebx, esi
    mov esi, eax
    mov dword ptr [esp + 16], edx
    jne L4
L5:
    mov esi, dword ptr [esp + 48]
    lea edx, [ebx + eax*2]
    lea edx, [eax + edx + 8]
    sar edx, 4
    lea eax, [eax*4 + 7]
    sar eax, 4
    mov byte ptr [ecx], dl
    mov byte ptr [ecx + 1], al
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 24]
    inc ecx
    cmp ecx, 2
    mov dword ptr [esp + 20], ecx
    jl L1
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [ecx + 00000011Ch]
    add esi, 4
    cmp eax, edx
    mov dword ptr [esp + 48], esi
    jl L0
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10051ae0 ENDP
END
