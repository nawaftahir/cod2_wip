.686
.MODEL FLAT, C
.CODE
FUN_10050280 PROC
    sub esp, 20
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 32]
    mov eax, dword ptr [ebp + 0000001A8h]
    mov edx, dword ptr [eax + 16]
    mov ecx, dword ptr [ebp + 000000128h]
    mov dword ptr [esp + 24], edx
    mov edx, dword ptr [eax + 20]
    mov dword ptr [esp + 20], edx
    mov edx, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 28]
    mov dword ptr [esp + 16], edx
    mov edx, dword ptr [esp + 36]
    push esi
    mov esi, dword ptr [edx]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 44]
    push edi
    mov edi, dword ptr [esi + eax*4]
    mov esi, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov ebx, dword ptr [edx + eax*4]
    mov edx, dword ptr [ebp + 100]
    mov esi, dword ptr [esi + eax*4]
    mov eax, dword ptr [esp + 52]
    mov eax, dword ptr [eax]
    shr edx, 1
    test edx, edx
    jbe L1
    mov dword ptr [esp + 44], edx
L0:
    movzx ebp, byte ptr [ebx]
    movzx edx, byte ptr [esi]
    inc esi
    inc ebx
    mov dword ptr [esp + 16], esi
    mov esi, dword ptr [esp + 32]
    mov esi, dword ptr [esi + ebp*4]
    mov dword ptr [esp + 52], ebx
    mov ebx, dword ptr [esp + 24]
    mov dword ptr [esp + 48], esi
    mov esi, dword ptr [esp + 20]
    mov esi, dword ptr [esi + edx*4]
    add esi, dword ptr [ebx + ebp*4]
    movzx ebp, byte ptr [edi]
    mov ebx, dword ptr [esp + 28]
    mov edx, dword ptr [ebx + edx*4]
    mov ebx, dword ptr [esp + 48]
    add ebx, ebp
    mov bl, byte ptr [ebx + ecx]
    mov byte ptr [eax + 2], bl
    sar esi, 16
    lea ebx, [esi + ebp]
    mov bl, byte ptr [ebx + ecx]
    mov byte ptr [eax + 1], bl
    add ebp, edx
    mov bl, byte ptr [ecx + ebp]
    mov byte ptr [eax], bl
    movzx ebp, byte ptr [edi + 1]
    mov ebx, dword ptr [esp + 48]
    inc edi
    add ebx, ebp
    mov bl, byte ptr [ebx + ecx]
    add eax, 3
    add esi, ebp
    mov byte ptr [eax + 2], bl
    mov bl, byte ptr [esi + ecx]
    mov esi, dword ptr [esp + 16]
    add ebp, edx
    mov byte ptr [eax + 1], bl
    mov dl, byte ptr [ecx + ebp]
    mov ebx, dword ptr [esp + 52]
    mov byte ptr [eax], dl
    mov edx, dword ptr [esp + 44]
    inc edi
    add eax, 3
    dec edx
    mov dword ptr [esp + 44], edx
    jne L0
    mov ebp, dword ptr [esp + 40]
L1:
    test byte ptr [ebp + 100], 1
    je L2
    movzx edx, byte ptr [esi]
    movzx ebx, byte ptr [ebx]
    mov esi, dword ptr [esp + 20]
    mov esi, dword ptr [esi + edx*4]
    mov ebp, dword ptr [esp + 24]
    add esi, dword ptr [ebp + ebx*4]
    movzx edi, byte ptr [edi]
    mov ebp, dword ptr [esp + 28]
    mov ebp, dword ptr [ebp + edx*4]
    mov edx, dword ptr [esp + 32]
    mov edx, dword ptr [edx + ebx*4]
    add edx, edi
    mov dl, byte ptr [edx + ecx]
    sar esi, 16
    mov byte ptr [eax + 2], dl
    lea edx, [edi + esi]
    mov dl, byte ptr [edx + ecx]
    add edi, ebp
    mov byte ptr [eax + 1], dl
    mov cl, byte ptr [edi + ecx]
    mov byte ptr [eax], cl
L2:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 20
    ret
FUN_10050280 ENDP
END
