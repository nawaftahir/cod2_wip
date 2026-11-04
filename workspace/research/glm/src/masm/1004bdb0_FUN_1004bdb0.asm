.686
.MODEL FLAT, C
.CODE
FUN_1004bdb0 PROC
    sub esp, 40
    mov ecx, dword ptr [esp + 44]
    mov edx, dword ptr [ecx + 100]
    mov eax, dword ptr [ecx + 0000001ACh]
    mov dword ptr [esp], edx
    mov edx, dword ptr [ecx + 000000128h]
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esp + 16], ecx
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [esp + 60]
    dec eax
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 24], ecx
    js L4
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 64]
    shl esi, 2
    inc eax
    push edi
    mov edi, dword ptr [esp + 64]
    mov dword ptr [esp + 76], eax
L0:
    mov ecx, dword ptr [edi]
    mov ebx, dword ptr [esi + ecx]
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + ecx]
    mov ebp, dword ptr [esp + 72]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [esi + eax]
    mov dword ptr [esp + 60], ecx
    mov ecx, dword ptr [edi + 12]
    mov ecx, dword ptr [esi + ecx]
    mov dword ptr [esp + 20], ecx
    mov ecx, dword ptr [ebp]
    add ebp, 4
    mov dword ptr [esp + 72], ebp
    mov ebp, dword ptr [esp + 16]
    add esi, 4
    test ebp, ebp
    mov dword ptr [esp + 52], esi
    jbe L3
    mov edi, dword ptr [esp + 20]
    mov esi, ebx
    mov ebx, dword ptr [esp + 60]
    sub esi, eax
    sub ebx, eax
    sub edi, eax
    mov dword ptr [esp + 24], esi
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 20], edi
    mov dword ptr [esp + 60], ebp
    jmp L2
L1:
    mov esi, dword ptr [esp + 24]
    mov ebx, dword ptr [esp + 28]
L2:
    movzx ebp, byte ptr [ebx + eax]
    movzx esi, byte ptr [esi + eax]
    mov ebx, dword ptr [esp + 32]
    sub edx, dword ptr [ebx + ebp*4]
    movzx edi, byte ptr [eax]
    sub edx, esi
    mov dl, byte ptr [edx + 0000000FFh]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [esp + 36]
    mov ebx, dword ptr [edx + edi*4]
    mov edx, dword ptr [esp + 40]
    add ebx, dword ptr [edx + ebp*4]
    mov edx, dword ptr [esp + 44]
    sar ebx, 16
    mov ebp, edx
    sub ebp, ebx
    sub ebp, esi
    mov bl, byte ptr [ebp + 0000000FFh]
    mov ebp, dword ptr [esp + 48]
    mov byte ptr [ecx + 1], bl
    mov ebx, edx
    sub ebx, dword ptr [ebp + edi*4]
    add ecx, 4
    sub ebx, esi
    mov bl, byte ptr [ebx + 0000000FFh]
    mov esi, dword ptr [esp + 20]
    mov byte ptr [ecx - 2], bl
    mov bl, byte ptr [esi + eax]
    mov esi, dword ptr [esp + 60]
    mov byte ptr [ecx - 1], bl
    inc eax
    dec esi
    mov dword ptr [esp + 60], esi
    jne L1
    mov edi, dword ptr [esp + 64]
    mov esi, dword ptr [esp + 52]
L3:
    dec dword ptr [esp + 76]
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
L4:
    add esp, 40
    ret
FUN_1004bdb0 ENDP
END
