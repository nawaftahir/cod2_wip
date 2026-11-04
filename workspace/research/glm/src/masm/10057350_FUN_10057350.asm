.686
.MODEL FLAT, C
EXTRN sub_10057320:PROC
.CODE
FUN_10057350 PROC
    sub esp, 96
    mov eax, dword ptr [esp + 100]
    mov edx, dword ptr [eax + 100]
    push esi
    mov esi, dword ptr [eax + 0000001B0h]
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [esp + 72], ecx
    mov ecx, dword ptr [eax + 000000128h]
    mov eax, dword ptr [eax + 124]
    push edi
    mov edi, dword ptr [eax]
    mov dword ptr [esp + 92], edi
    mov edi, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 96], edi
    mov dword ptr [esp + 100], eax
    mov eax, dword ptr [esp + 120]
    mov dword ptr [esp + 16], ecx
    mov ecx, dword ptr [esi + 40]
    xor edi, edi
    cmp eax, edi
    mov dword ptr [esp + 64], esi
    mov dword ptr [esp + 56], edx
    mov dword ptr [esp + 60], ecx
    jle L8
    push ebx
    mov ebx, dword ptr [esp + 120]
    push ebp
    mov ebp, dword ptr [esp + 120]
    sub ebp, ebx
    mov dword ptr [esp + 40], ebx
    mov dword ptr [esp + 80], ebp
    mov dword ptr [esp + 76], eax
    jmp L1
L0:
    mov ebp, dword ptr [esp + 80]
L1:
    cmp byte ptr [esi + 36], 0
    mov ebx, dword ptr [esp + 40]
    mov eax, dword ptr [ebx + ebp]
    mov ebx, dword ptr [ebx]
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], ebx
    je L2
    add eax, edx
    lea eax, [eax + edx*2 - 3]
    mov dword ptr [esp + 16], eax
    lea eax, [ebx + edx - 1]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [esi + 32]
    lea edx, [edx + edx*2 + 3]
    lea ebx, [eax + edx*2]
    mov eax, dword ptr [esp + 16]
    mov dword ptr [esp + 56], 0FFFFFFFFh
    mov dword ptr [esp + 000000080h], 0FFFFFFFDh
    mov byte ptr [esi + 36], 0
    jmp L3
L2:
    mov ebx, dword ptr [esi + 32]
    mov dword ptr [esp + 56], 1
    mov dword ptr [esp + 000000080h], 3
    mov byte ptr [esi + 36], 1
L3:
    mov edx, dword ptr [esp + 64]
    xor esi, esi
    xor ebp, ebp
    test edx, edx
    mov dword ptr [esp + 52], edi
    mov dword ptr [esp + 48], edi
    mov dword ptr [esp + 44], edi
    mov dword ptr [esp + 36], esi
    mov dword ptr [esp + 32], esi
    mov dword ptr [esp + 28], esi
    jbe L7
    mov dword ptr [esp + 60], edx
    jmp L5
L4:
    mov eax, dword ptr [esp + 16]
L5:
    mov edx, dword ptr [esp + 000000080h]
    movsx edx, word ptr [ebx + edx*2]
    lea edx, [edx + esi + 8]
    movzx esi, byte ptr [eax]
    sar edx, 4
    mov edx, dword ptr [ecx + edx*4]
    add edx, esi
    mov esi, dword ptr [esp + 24]
    movzx esi, byte ptr [edx + esi]
    mov edx, dword ptr [esp + 000000080h]
    movsx edx, word ptr [ebx + edx*2 + 2]
    lea edx, [edx + edi + 8]
    movzx edi, byte ptr [eax + 1]
    movzx eax, byte ptr [eax + 2]
    sar edx, 4
    mov edx, dword ptr [ecx + edx*4]
    add edx, edi
    mov edi, dword ptr [esp + 24]
    movzx edi, byte ptr [edx + edi]
    mov edx, dword ptr [esp + 000000080h]
    movsx edx, word ptr [ebx + edx*2 + 4]
    lea edx, [edx + ebp + 8]
    sar edx, 4
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [esp + 24]
    add ecx, eax
    movzx ebp, byte ptr [ecx + edx]
    mov ecx, edi
    sar ecx, 2
    mov dword ptr [esp + 92], ecx
    mov edx, ebp
    sar edx, 3
    shl ecx, 5
    add ecx, edx
    mov dword ptr [esp + 88], edx
    mov edx, dword ptr [esp + 84]
    mov eax, esi
    sar eax, 3
    mov edx, dword ptr [edx + eax*4]
    cmp word ptr [edx + ecx*2], 0
    lea ecx, [edx + ecx*2]
    mov dword ptr [esp + 96], ecx
    jne L6
    mov ecx, dword ptr [esp + 88]
    mov edx, dword ptr [esp + 116]
    push ecx
    push eax
    mov eax, dword ptr [esp + 100]
    push edx
    call sub_10057320
    mov ecx, dword ptr [esp + 108]
    add esp, 12
L6:
    movzx eax, word ptr [ecx]
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 100]
    dec eax
    mov byte ptr [ecx], al
    movzx ecx, byte ptr [eax + edx]
    mov edx, dword ptr [esp + 104]
    sub esi, ecx
    movzx ecx, byte ptr [eax + edx]
    mov edx, dword ptr [esp + 108]
    movzx eax, byte ptr [eax + edx]
    mov edx, dword ptr [esp + 28]
    sub edi, ecx
    sub ebp, eax
    mov ecx, esi
    lea eax, [esi + esi]
    add esi, eax
    add edx, esi
    mov word ptr [ebx], dx
    mov edx, dword ptr [esp + 44]
    add esi, eax
    add edx, esi
    mov dword ptr [esp + 28], edx
    mov edx, dword ptr [esp + 32]
    mov dword ptr [esp + 44], ecx
    add esi, eax
    mov ecx, edi
    lea eax, [edi + edi]
    add edi, eax
    add edx, edi
    mov word ptr [ebx + 2], dx
    mov edx, dword ptr [esp + 48]
    add edi, eax
    add edx, edi
    mov dword ptr [esp + 32], edx
    mov edx, dword ptr [esp + 36]
    mov dword ptr [esp + 48], ecx
    add edi, eax
    mov ecx, ebp
    lea eax, [ebp + ebp]
    add ebp, eax
    add edx, ebp
    mov word ptr [ebx + 4], dx
    mov edx, dword ptr [esp + 52]
    add ebp, eax
    add edx, ebp
    mov dword ptr [esp + 52], ecx
    mov ecx, dword ptr [esp + 16]
    add ebp, eax
    mov eax, dword ptr [esp + 000000080h]
    add ecx, eax
    mov dword ptr [esp + 36], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [esp + 16], ecx
    mov ecx, dword ptr [esp + 56]
    lea ebx, [ebx + eax*2]
    mov eax, dword ptr [esp + 60]
    add edx, ecx
    mov ecx, dword ptr [esp + 68]
    dec eax
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 60], eax
    jne L4
    mov edx, dword ptr [esp + 64]
L7:
    mov ax, word ptr [esp + 28]
    mov esi, dword ptr [esp + 72]
    mov word ptr [ebx], ax
    mov ax, word ptr [esp + 32]
    mov word ptr [ebx + 2], ax
    mov ax, word ptr [esp + 36]
    mov word ptr [ebx + 4], ax
    mov ebx, dword ptr [esp + 40]
    mov eax, dword ptr [esp + 76]
    add ebx, 4
    xor edi, edi
    dec eax
    mov dword ptr [esp + 40], ebx
    mov dword ptr [esp + 76], eax
    jne L0
    pop ebp
    pop ebx
L8:
    pop edi
    pop esi
    add esp, 96
    ret
FUN_10057350 ENDP
END
