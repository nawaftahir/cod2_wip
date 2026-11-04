.686
.MODEL FLAT, C
EXTRN sub_10048D04:PROC
.CODE
FUN_100490f0 PROC
    sub esp, 40
    push ebx
    mov ebx, dword ptr [esp + 56]
    push ebp
    mov ebp, dword ptr [esp + 56]
    push esi
    mov esi, dword ptr [ebp + 28]
    push edi
    mov edi, dword ptr [esp + 60]
    mov ecx, dword ptr [edi + 36]
    mov edx, dword ptr [edi + 0000000E4h]
    shl esi, 3
    lea eax, [esi + esi]
    push eax
    push ecx
    add edx, 2
    push edx
    add ebx, -4
    push ebx
    call sub_10048D04
    mov eax, dword ptr [edi + 0000000BCh]
    lea ecx, [eax + eax*4]
    shl ecx, 4
    mov edx, ecx
    shl eax, 4
    mov ecx, 000004000h
    sub ecx, edx
    mov dword ptr [esp + 84], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [esp + 76], ecx
    xor ecx, ecx
    add esp, 16
    test eax, eax
    mov dword ptr [esp + 44], ecx
    jle L3
    add esi, -2
    mov eax, ebx
    mov dword ptr [esp + 52], esi
    mov dword ptr [esp + 40], eax
L0:
    mov ebx, dword ptr [eax + 8]
    mov edx, dword ptr [esp + 72]
    mov esi, dword ptr [edx + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 12]
    lea ebp, [edx + 2]
    mov dword ptr [esp + 28], ebp
    movzx ebp, byte ptr [eax]
    mov dword ptr [esp + 16], ebp
    movzx ebp, byte ptr [ecx]
    mov dword ptr [esp + 48], ebp
    movzx ebp, byte ptr [ebx]
    mov dword ptr [esp + 24], ebp
    movzx ebp, byte ptr [edx]
    mov dword ptr [esp + 20], ebp
    lea ebp, [eax + 2]
    movzx eax, byte ptr [eax + 1]
    mov dword ptr [esp + 36], ebp
    lea ebp, [ecx + 2]
    movzx ecx, byte ptr [ecx + 1]
    add eax, ecx
    movzx ecx, byte ptr [ebx + 2]
    mov dword ptr [esp + 32], ebp
    add ecx, dword ptr [esp + 20]
    mov ebp, dword ptr [esp + 28]
    movzx ebp, byte ptr [ebp]
    add ecx, eax
    mov eax, dword ptr [esp + 24]
    lea edi, [ebx + 2]
    add ebp, ecx
    mov ecx, dword ptr [esp + 16]
    movzx edx, byte ptr [edx + 1]
    add ebp, eax
    mov eax, dword ptr [esp + 48]
    add ebp, eax
    add ebp, ecx
    mov ecx, dword ptr [esp + 32]
    movzx ecx, byte ptr [ecx]
    add ecx, eax
    mov eax, dword ptr [esp + 36]
    movzx eax, byte ptr [eax]
    lea ecx, [ecx + ebp*2]
    mov ebp, dword ptr [esp + 16]
    add eax, ecx
    movzx ecx, byte ptr [ebx + 1]
    add ecx, dword ptr [esp + 20]
    mov ebx, dword ptr [esp + 24]
    add edx, ecx
    add eax, ebp
    imul eax, dword ptr [esp + 68]
    add edx, ebx
    imul edx, dword ptr [esp + 60]
    lea eax, [eax + edx + 000008000h]
    mov edx, dword ptr [esp + 52]
    sar eax, 16
    mov byte ptr [esi], al
    mov eax, dword ptr [esp + 28]
    inc esi
    test edx, edx
    mov dword ptr [esp + 16], esi
    mov esi, dword ptr [esp + 32]
    mov ecx, edi
    mov edi, dword ptr [esp + 36]
    jbe L2
    mov dword ptr [esp + 36], edx
L1:
    movzx ebx, byte ptr [esi + 1]
    movzx edx, byte ptr [edi + 1]
    add edx, ebx
    movzx ebx, byte ptr [ecx - 1]
    add edx, ebx
    movzx ebx, byte ptr [eax - 1]
    add edx, ebx
    movzx ebx, byte ptr [edi]
    add edx, ebx
    movzx ebx, byte ptr [ecx + 2]
    add edx, ebx
    movzx ebx, byte ptr [esi]
    add edx, ebx
    movzx ebx, byte ptr [eax + 2]
    add edx, ebx
    movzx ebx, byte ptr [edi - 1]
    movzx ebp, byte ptr [eax + 1]
    lea edx, [ebx + edx*2]
    movzx ebx, byte ptr [esi - 1]
    add edx, ebx
    movzx ebx, byte ptr [esi + 2]
    add edx, ebx
    movzx ebx, byte ptr [edi + 2]
    add edx, ebx
    movzx ebx, byte ptr [ecx + 1]
    imul edx, dword ptr [esp + 68]
    add ebx, ebp
    movzx ebp, byte ptr [ecx]
    add ebx, ebp
    movzx ebp, byte ptr [eax]
    add ebx, ebp
    imul ebx, dword ptr [esp + 60]
    mov ebp, dword ptr [esp + 16]
    lea edx, [edx + ebx + 000008000h]
    sar edx, 16
    mov byte ptr [ebp], dl
    mov edx, dword ptr [esp + 36]
    inc ebp
    add eax, 2
    add ecx, 2
    add esi, 2
    add edi, 2
    dec edx
    mov dword ptr [esp + 16], ebp
    mov dword ptr [esp + 36], edx
    jne L1
L2:
    movzx ebx, byte ptr [ecx - 1]
    movzx ebp, byte ptr [eax - 1]
    movzx edx, byte ptr [eax + 1]
    add ebx, ebp
    movzx ebp, byte ptr [edi]
    add ebp, edx
    mov dword ptr [esp + 36], edx
    movzx edx, byte ptr [esi]
    add ebp, ebx
    movzx ebx, byte ptr [esi + 1]
    movzx esi, byte ptr [esi - 1]
    add edx, ebp
    mov ebp, edx
    movzx edx, byte ptr [ecx + 1]
    movzx ecx, byte ptr [ecx]
    add ebp, edx
    mov dword ptr [esp + 32], edx
    movzx edx, byte ptr [edi + 1]
    movzx edi, byte ptr [edi - 1]
    add ebp, ebx
    add ebp, edx
    add edi, ebx
    lea edi, [edi + ebp*2]
    mov ebp, dword ptr [esp + 32]
    add esi, edi
    mov edi, dword ptr [esp + 36]
    add esi, edx
    movzx edx, byte ptr [eax]
    imul esi, dword ptr [esp + 68]
    add ecx, edi
    add edx, ecx
    mov ecx, dword ptr [esp + 16]
    add edx, ebp
    imul edx, dword ptr [esp + 60]
    lea eax, [esi + edx + 000008000h]
    mov edx, dword ptr [esp + 64]
    sar eax, 16
    mov byte ptr [ecx], al
    mov eax, dword ptr [esp + 40]
    mov ecx, dword ptr [esp + 44]
    mov esi, dword ptr [edx + 12]
    add eax, 8
    inc ecx
    cmp ecx, esi
    mov dword ptr [esp + 40], eax
    mov dword ptr [esp + 44], ecx
    jl L0
L3:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 40
    ret
FUN_100490f0 ENDP
END
