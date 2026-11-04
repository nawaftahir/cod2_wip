.686
.MODEL FLAT, C
.CODE
FUN_1004bb80 PROC
    sub esp, 36
    mov ecx, dword ptr [esp + 40]
    mov edx, dword ptr [ecx + 100]
    mov eax, dword ptr [ecx + 0000001ACh]
    mov dword ptr [esp], edx
    mov edx, dword ptr [ecx + 000000128h]
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esp + 12], ecx
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [esp + 28], ecx
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 56]
    dec eax
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 20], ecx
    js L4
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 56]
    push edi
    mov edi, dword ptr [esp + 64]
    shl edi, 2
    inc eax
    mov dword ptr [esp + 72], eax
L0:
    mov ecx, dword ptr [esi]
    mov ebx, dword ptr [edi + ecx]
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [edi + ecx]
    mov ebp, dword ptr [esp + 68]
    mov eax, dword ptr [esi + 4]
    mov eax, dword ptr [edi + eax]
    mov dword ptr [esp + 56], ecx
    mov ecx, dword ptr [ebp]
    add ebp, 4
    mov dword ptr [esp + 68], ebp
    mov ebp, dword ptr [esp + 16]
    add edi, 4
    test ebp, ebp
    mov dword ptr [esp + 48], edi
    jbe L3
    mov esi, ebx
    mov ebx, dword ptr [esp + 56]
    sub esi, eax
    sub ebx, eax
    mov dword ptr [esp + 20], esi
    mov dword ptr [esp + 24], ebx
    mov dword ptr [esp + 56], ebp
    jmp L2
L1:
    mov esi, dword ptr [esp + 20]
    mov ebx, dword ptr [esp + 24]
    mov edi, edi
L2:
    movzx ebp, byte ptr [ebx + eax]
    movzx esi, byte ptr [esi + eax]
    mov ebx, dword ptr [esp + 28]
    mov ebx, dword ptr [ebx + ebp*4]
    movzx edi, byte ptr [eax]
    add ebx, esi
    mov dl, byte ptr [ebx + edx]
    mov byte ptr [ecx + 2], dl
    mov edx, dword ptr [esp + 32]
    mov ebx, dword ptr [edx + edi*4]
    mov edx, dword ptr [esp + 36]
    add ebx, dword ptr [edx + ebp*4]
    mov edx, dword ptr [esp + 40]
    sar ebx, 16
    add ebx, esi
    mov bl, byte ptr [ebx + edx]
    mov byte ptr [ecx + 1], bl
    mov ebx, dword ptr [esp + 44]
    mov edi, dword ptr [ebx + edi*4]
    add edi, esi
    mov bl, byte ptr [edi + edx]
    mov esi, dword ptr [esp + 56]
    mov byte ptr [ecx], bl
    add ecx, 3
    inc eax
    dec esi
    mov dword ptr [esp + 56], esi
    jne L1
    mov esi, dword ptr [esp + 60]
    mov edi, dword ptr [esp + 48]
L3:
    dec dword ptr [esp + 72]
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
L4:
    add esp, 36
    ret
FUN_1004bb80 ENDP
END
