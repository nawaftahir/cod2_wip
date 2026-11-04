.686
.MODEL FLAT, C
.CODE
FUN_10056c00 PROC
    sub esp, 56
    push ebx
    mov ebx, dword ptr [esp + 64]
    mov ecx, dword ptr [ebx + 0000001B0h]
    mov edx, dword ptr [ecx + 24]
    mov ecx, dword ptr [eax + 4]
    push ebp
    mov ebp, dword ptr [eax + 16]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [eax + 12]
    push esi
    mov esi, dword ptr [eax + 8]
    mov dword ptr [esp + 28], edx
    mov edx, dword ptr [eax + 20]
    mov eax, dword ptr [eax]
    push edi
    xor edi, edi
    cmp eax, ecx
    mov dword ptr [esp + 20], edi
    mov dword ptr [esp + 24], edi
    mov dword ptr [esp + 28], edi
    mov dword ptr [esp + 68], ecx
    mov dword ptr [esp + 64], esi
    mov dword ptr [esp + 56], ebp
    mov dword ptr [esp + 52], edx
    mov dword ptr [esp + 44], eax
    jg L6
    lea edx, [eax*8 + 4]
    mov dword ptr [esp + 16], edx
L0:
    cmp esi, dword ptr [esp + 32]
    jg L5
    mov ebx, dword ptr [esp + 48]
    mov eax, dword ptr [ebx + eax*4]
    mov ecx, esi
    shl ecx, 5
    add ecx, ebp
    lea ebx, [eax + ecx*2]
    mov ecx, dword ptr [esp + 32]
    sub ecx, esi
    inc ecx
    lea edx, [esi*4 + 2]
    mov dword ptr [esp + 36], ebx
    mov dword ptr [esp + 40], ecx
L1:
    mov eax, dword ptr [esp + 52]
    cmp ebp, eax
    jg L4
    mov esi, eax
    sub esi, ebp
    lea ecx, [ebp*8 + 4]
    inc esi
L2:
    movzx eax, word ptr [ebx]
    add ebx, 2
    test eax, eax
    mov dword ptr [esp + 60], ebx
    je L3
    mov ebx, dword ptr [esp + 16]
    mov ebp, dword ptr [esp + 20]
    imul ebx, eax
    add ebp, ebx
    mov ebx, edx
    imul ebx, eax
    mov dword ptr [esp + 20], ebp
    mov ebp, dword ptr [esp + 24]
    add ebp, ebx
    mov ebx, ecx
    imul ebx, eax
    add edi, eax
    mov eax, dword ptr [esp + 28]
    add eax, ebx
    mov ebx, dword ptr [esp + 60]
    mov dword ptr [esp + 24], ebp
    mov ebp, dword ptr [esp + 56]
    mov dword ptr [esp + 28], eax
L3:
    add ecx, 8
    dec esi
    jne L2
    mov ecx, dword ptr [esp + 40]
    mov esi, dword ptr [esp + 64]
L4:
    mov ebx, dword ptr [esp + 36]
    add ebx, 64
    add edx, 4
    dec ecx
    mov dword ptr [esp + 36], ebx
    mov dword ptr [esp + 40], ecx
    jne L1
    mov ebx, dword ptr [esp + 76]
    mov ecx, dword ptr [esp + 68]
    mov eax, dword ptr [esp + 44]
L5:
    mov edx, dword ptr [esp + 16]
    inc eax
    add edx, 8
    cmp eax, ecx
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 16], edx
    jle L0
L6:
    mov edx, dword ptr [esp + 20]
    mov ecx, edi
    sar ecx, 1
    lea eax, [ecx + edx]
    cdq
    idiv edi
    mov edx, dword ptr [ebx + 124]
    mov edx, dword ptr [edx]
    mov esi, dword ptr [esp + 80]
    mov byte ptr [esi + edx], al
    mov eax, dword ptr [esp + 24]
    add eax, ecx
    cdq
    idiv edi
    mov edx, dword ptr [ebx + 124]
    mov edx, dword ptr [edx + 4]
    mov byte ptr [esi + edx], al
    mov eax, dword ptr [esp + 28]
    add eax, ecx
    cdq
    idiv edi
    mov ecx, dword ptr [ebx + 124]
    mov edx, dword ptr [ecx + 8]
    pop edi
    mov byte ptr [esi + edx], al
    pop esi
    pop ebp
    pop ebx
    add esp, 56
    ret
FUN_10056c00 ENDP
END
