.686
.MODEL FLAT, C
.CODE
FUN_10056200 PROC
    sub esp, 56
    mov eax, dword ptr [esp + 60]
    mov ecx, dword ptr [eax + 100]
    mov edx, dword ptr [eax + 000000128h]
    push ebx
    mov ebx, dword ptr [eax + 0000001B0h]
    push ebp
    mov ebp, dword ptr [eax + 108]
    mov eax, dword ptr [esp + 80]
    test eax, eax
    mov dword ptr [esp + 12], ebx
    mov dword ptr [esp + 32], ebp
    mov dword ptr [esp + 68], ecx
    mov dword ptr [esp + 48], edx
    jle L8
    mov ecx, dword ptr [esp + 72]
    push esi
    mov esi, dword ptr [esp + 80]
    sub ecx, esi
    push edi
    mov dword ptr [esp + 24], esi
    mov dword ptr [esp + 52], ecx
    mov dword ptr [esp + 48], eax
    nop
L0:
    mov ecx, dword ptr [esp + 76]
    mov edi, dword ptr [esi]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    xor edx, edx
    test ebp, ebp
    rep stosb byte ptr es:[edi], al
    mov dword ptr [esp + 44], edx
    jle L7
    lea ecx, [ebx + 68]
    mov dword ptr [esp + 16], ecx
    jmp L2
L1:
    mov ecx, dword ptr [esp + 16]
L2:
    mov eax, dword ptr [esp + 52]
    mov ebx, dword ptr [eax + esi]
    mov eax, dword ptr [esp + 20]
    mov edi, dword ptr [esi]
    mov ecx, dword ptr [ecx]
    add ebx, edx
    cmp byte ptr [eax + 84], 0
    je L3
    mov eax, dword ptr [esp + 76]
    dec eax
    mov esi, eax
    imul esi, ebp
    add edi, eax
    add ebx, esi
    mov eax, ebp
    or esi, 0FFFFFFFFh
    neg eax
    mov dword ptr [esp + 32], eax
    mov eax, dword ptr [esp + 76]
    lea ecx, [ecx + eax*2 + 2]
    jmp L4
L3:
    mov esi, 1
    mov dword ptr [esp + 32], ebp
L4:
    mov eax, dword ptr [esp + 20]
    mov ebp, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 16]
    mov ebp, dword ptr [ebp + edx*4]
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [esp + 60], ebp
    mov ebp, dword ptr [esp + 76]
    mov dword ptr [esp + 64], eax
    xor eax, eax
    test ebp, ebp
    mov dword ptr [esp + 88], eax
    mov dword ptr [esp + 28], eax
    jbe L6
    mov dword ptr [esp + 36], ebp
L5:
    movsx edx, word ptr [ecx + esi*2]
    mov ebp, dword ptr [esp + 56]
    lea eax, [edx + eax + 8]
    movzx edx, byte ptr [ebx]
    sar eax, 4
    add eax, ebp
    movzx eax, byte ptr [edx + eax]
    mov edx, dword ptr [esp + 60]
    movzx edx, byte ptr [eax + edx]
    add byte ptr [edi], dl
    mov ebp, dword ptr [esp + 64]
    movzx edx, byte ptr [edx + ebp]
    mov ebp, dword ptr [esp + 88]
    sub eax, edx
    lea edx, [eax + eax]
    mov dword ptr [esp + 68], eax
    add eax, edx
    add ebp, eax
    mov word ptr [ecx], bp
    mov ebp, dword ptr [esp + 28]
    add eax, edx
    add ebp, eax
    add eax, edx
    add ebx, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 36]
    mov dword ptr [esp + 88], ebp
    mov ebp, dword ptr [esp + 68]
    add edi, esi
    dec edx
    mov dword ptr [esp + 28], ebp
    lea ecx, [ecx + esi*2]
    mov dword ptr [esp + 36], edx
    jne L5
    mov edx, dword ptr [esp + 44]
L6:
    mov ax, word ptr [esp + 88]
    mov ebp, dword ptr [esp + 40]
    mov esi, dword ptr [esp + 24]
    mov word ptr [ecx], ax
    mov ecx, dword ptr [esp + 16]
    inc edx
    add ecx, 4
    cmp edx, ebp
    mov dword ptr [esp + 44], edx
    mov dword ptr [esp + 16], ecx
    jl L1
    mov ebx, dword ptr [esp + 20]
L7:
    mov dl, byte ptr [ebx + 84]
    mov eax, dword ptr [esp + 48]
    test dl, dl
    sete cl
    add esi, 4
    dec eax
    mov byte ptr [ebx + 84], cl
    mov dword ptr [esp + 24], esi
    mov dword ptr [esp + 48], eax
    jne L0
    pop edi
    pop esi
L8:
    pop ebp
    pop ebx
    add esp, 56
    ret
FUN_10056200 ENDP
END
