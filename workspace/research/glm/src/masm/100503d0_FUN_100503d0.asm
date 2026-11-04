.686
.MODEL FLAT, C
.CODE
FUN_100503d0 PROC
    sub esp, 28
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 40]
    mov ecx, dword ptr [ebp + 0000001A8h]
    mov edx, dword ptr [ecx + 16]
    mov ebx, dword ptr [ebp + 100]
    mov eax, dword ptr [ebp + 000000128h]
    mov dword ptr [esp + 20], edx
    mov edx, dword ptr [ecx + 20]
    mov dword ptr [esp + 32], edx
    mov edx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + 28]
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 24], ecx
    mov ecx, dword ptr [esp + 44]
    mov edx, dword ptr [ecx]
    push esi
    mov esi, dword ptr [esp + 52]
    lea edx, [edx + esi*8]
    push edi
    mov edi, dword ptr [edx]
    mov edx, dword ptr [edx + 4]
    mov dword ptr [esp + 16], edx
    mov edx, dword ptr [ecx + 4]
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [edx + esi*4]
    mov dword ptr [esp + 56], edi
    mov edi, dword ptr [ecx + esi*4]
    mov esi, dword ptr [esp + 60]
    mov ecx, dword ptr [esi]
    mov esi, dword ptr [esi + 4]
    shr ebx, 1
    test ebx, ebx
    jbe L1
    mov dword ptr [esp + 60], ebx
L0:
    movzx ebx, byte ptr [edx]
    mov dword ptr [esp + 52], ebx
    inc edx
    inc edi
    mov dword ptr [esp + 20], edx
    movzx edx, byte ptr [edi - 1]
    mov dword ptr [esp + 24], edi
    mov edi, dword ptr [esp + 28]
    mov ebp, dword ptr [edi + edx*4]
    mov edi, dword ptr [esp + 32]
    mov edi, dword ptr [edi + ebx*4]
    mov ebx, dword ptr [esp + 36]
    add edi, dword ptr [ebx + edx*4]
    mov ebx, dword ptr [esp + 52]
    mov edx, dword ptr [esp + 40]
    mov edx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [esp + 56]
    movzx ebx, byte ptr [ebx]
    mov dword ptr [esp + 52], ebx
    mov ebx, dword ptr [esp + 56]
    sar edi, 16
    inc ebx
    mov dword ptr [esp + 56], ebx
    mov ebx, dword ptr [esp + 52]
    add ebx, ebp
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx + 2], bl
    mov ebx, dword ptr [esp + 52]
    add ebx, edi
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx + 1], bl
    mov ebx, dword ptr [esp + 52]
    add ebx, edx
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx], bl
    mov ebx, dword ptr [esp + 56]
    movzx ebx, byte ptr [ebx]
    mov dword ptr [esp + 52], ebx
    mov ebx, dword ptr [esp + 56]
    add ecx, 3
    inc ebx
    mov dword ptr [esp + 56], ebx
    mov ebx, dword ptr [esp + 52]
    add ebx, ebp
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx + 2], bl
    mov ebx, dword ptr [esp + 52]
    add ebx, edi
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx + 1], bl
    mov ebx, dword ptr [esp + 52]
    add ebx, edx
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx], bl
    mov ebx, dword ptr [esp + 16]
    movzx ebx, byte ptr [ebx]
    mov dword ptr [esp + 52], ebx
    mov ebx, dword ptr [esp + 16]
    add ecx, 3
    inc ebx
    mov dword ptr [esp + 16], ebx
    mov ebx, dword ptr [esp + 52]
    add ebx, ebp
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [esi + 2], bl
    mov ebx, dword ptr [esp + 52]
    add ebx, edi
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [esi + 1], bl
    mov ebx, dword ptr [esp + 52]
    add ebx, edx
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [esi], bl
    mov ebx, dword ptr [esp + 16]
    movzx ebx, byte ptr [ebx]
    mov dword ptr [esp + 52], ebx
    mov ebx, dword ptr [esp + 16]
    add esi, 3
    inc ebx
    mov dword ptr [esp + 16], ebx
    mov ebx, dword ptr [esp + 52]
    add ebx, ebp
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [esi + 2], bl
    mov ebx, dword ptr [esp + 52]
    add ebx, edi
    mov bl, byte ptr [ebx + eax]
    mov edi, dword ptr [esp + 52]
    add edi, edx
    mov byte ptr [esi + 1], bl
    mov dl, byte ptr [edi + eax]
    mov edi, dword ptr [esp + 24]
    mov byte ptr [esi], dl
    mov edx, dword ptr [esp + 60]
    add esi, 3
    dec edx
    mov dword ptr [esp + 60], edx
    mov edx, dword ptr [esp + 20]
    jne L0
    mov ebp, dword ptr [esp + 48]
L1:
    test byte ptr [ebp + 100], 1
    je L2
    movzx ebx, byte ptr [edi]
    movzx edx, byte ptr [edx]
    mov edi, dword ptr [esp + 28]
    mov edi, dword ptr [edi + ebx*4]
    mov ebp, dword ptr [esp + 36]
    mov dword ptr [esp + 48], edi
    mov edi, dword ptr [esp + 32]
    mov edi, dword ptr [edi + edx*4]
    add edi, dword ptr [ebp + ebx*4]
    mov ebx, dword ptr [esp + 40]
    mov edx, dword ptr [ebx + edx*4]
    mov ebx, dword ptr [esp + 56]
    movzx ebp, byte ptr [ebx]
    mov ebx, dword ptr [esp + 48]
    add ebx, ebp
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx + 2], bl
    sar edi, 16
    lea ebx, [edi + ebp]
    mov bl, byte ptr [ebx + eax]
    mov byte ptr [ecx + 1], bl
    add ebp, edx
    mov bl, byte ptr [eax + ebp]
    mov byte ptr [ecx], bl
    mov ecx, dword ptr [esp + 16]
    movzx ecx, byte ptr [ecx]
    mov ebx, dword ptr [esp + 48]
    add ebx, ecx
    mov bl, byte ptr [ebx + eax]
    add edi, ecx
    mov byte ptr [esi + 2], bl
    mov bl, byte ptr [edi + eax]
    add ecx, edx
    mov byte ptr [esi + 1], bl
    mov dl, byte ptr [ecx + eax]
    mov byte ptr [esi], dl
L2:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 28
    ret
FUN_100503d0 ENDP
END
