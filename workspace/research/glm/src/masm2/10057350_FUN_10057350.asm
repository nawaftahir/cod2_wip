.686
.MODEL FLAT, C
EXTRN sub_10057320:PROC
EXTRN sub_10057674:PROC
EXTRN sub_1005768C:PROC
EXTRN sub_100576C3:PROC
EXTRN sub_100576E8:PROC
EXTRN sub_100576EA:PROC
.CODE
FUN_10057350 PROC
    sub sub esp, 96
    mov mov eax, dword ptr [esp + 100]
    mov mov edx, dword ptr [eax + 100]
    push push esi
    mov mov esi, dword ptr [eax + 01B0h]
    mov mov ecx, dword ptr [esi + 24]
    mov mov dword ptr [esp + 72], ecx
    mov mov ecx, dword ptr [eax + 0128h]
    mov mov eax, dword ptr [eax + 124]
    push push edi
    mov mov edi, dword ptr [eax]
    mov mov dword ptr [esp + 92], edi
    mov mov edi, dword ptr [eax + 4]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [esp + 96], edi
    mov mov dword ptr [esp + 100], eax
    mov mov eax, dword ptr [esp + 120]
    mov mov dword ptr [esp + 16], ecx
    mov mov ecx, dword ptr [esi + 40]
    xor xor edi, edi
    cmp cmp eax, edi
    mov mov dword ptr [esp + 64], esi
    mov mov dword ptr [esp + 56], edx
    mov mov dword ptr [esp + 60], ecx
    jle sub_10057674
    push push ebx
    mov mov ebx, dword ptr [esp + 120]
    push push ebp
    mov mov ebp, dword ptr [esp + 120]
    sub sub ebp, ebx
    mov mov dword ptr [esp + 40], ebx
    mov mov dword ptr [esp + 80], ebp
    mov mov dword ptr [esp + 76], eax
    jmp L0
    mov mov ebp, dword ptr [esp + 80]
    cmp cmp byte ptr [esi + 36], 0
    mov mov ebx, dword ptr [esp + 40]
    mov mov eax, dword ptr [ebx + ebp]
    mov mov ebx, dword ptr [ebx]
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], ebx
    je L1
    add add eax, edx
    lea lea eax, [eax + edx*2 - 3]
    mov mov dword ptr [esp + 16], eax
    lea lea eax, [ebx + edx - 1]
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [esi + 32]
    lea lea edx, [edx + edx*2 + 3]
    lea lea ebx, [eax + edx*2]
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [esp + 56], -1
    mov mov dword ptr [esp + 080h], -3
    mov mov byte ptr [esi + 36], 0
    jmp L2
    mov mov ebx, dword ptr [esi + 32]
    mov mov dword ptr [esp + 56], 1
    mov mov dword ptr [esp + 080h], 3
    mov mov byte ptr [esi + 36], 1
    mov mov edx, dword ptr [esp + 64]
    xor xor esi, esi
    xor xor ebp, ebp
    test test edx, edx
    mov mov dword ptr [esp + 52], edi
    mov mov dword ptr [esp + 48], edi
    mov mov dword ptr [esp + 44], edi
    mov mov dword ptr [esp + 36], esi
    mov mov dword ptr [esp + 32], esi
    mov mov dword ptr [esp + 28], esi
    jbe sub_100576E8
    mov mov dword ptr [esp + 60], edx
    jmp L3
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 080h]
    movsx movsx edx, word ptr [ebx + edx*2]
    lea lea edx, [edx + esi + 8]
    movzx movzx esi, byte ptr [eax]
    sar sar edx, 4
    mov mov edx, dword ptr [ecx + edx*4]
    add add edx, esi
    mov mov esi, dword ptr [esp + 24]
    movzx movzx esi, byte ptr [edx + esi]
    mov mov edx, dword ptr [esp + 080h]
    movsx movsx edx, word ptr [ebx + edx*2 + 2]
    lea lea edx, [edx + edi + 8]
    movzx movzx edi, byte ptr [eax + 1]
    movzx movzx eax, byte ptr [eax + 2]
    sar sar edx, 4
    mov mov edx, dword ptr [ecx + edx*4]
L1:
    add add edx, edi
    mov mov edi, dword ptr [esp + 24]
    movzx movzx edi, byte ptr [edx + edi]
    mov mov edx, dword ptr [esp + 080h]
    movsx movsx edx, word ptr [ebx + edx*2 + 4]
    lea lea edx, [edx + ebp + 8]
    sar sar edx, 4
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [esp + 24]
    add add ecx, eax
    movzx movzx ebp, byte ptr [ecx + edx]
    mov mov ecx, edi
    sar sar ecx, 2
    mov mov dword ptr [esp + 92], ecx
    mov mov edx, ebp
    sar sar edx, 3
    shl shl ecx, 5
    add add ecx, edx
    mov mov dword ptr [esp + 88], edx
    mov mov edx, dword ptr [esp + 84]
    mov mov eax, esi
    sar sar eax, 3
    mov mov edx, dword ptr [edx + eax*4]
    cmp cmp word ptr [edx + ecx*2], 0
    lea lea ecx, [edx + ecx*2]
    mov mov dword ptr [esp + 96], ecx
    jne sub_100576C3
    mov mov ecx, dword ptr [esp + 88]
    mov mov edx, dword ptr [esp + 116]
    push push ecx
    push push eax
    mov mov eax, dword ptr [esp + 100]
    push push edx
    call sub_10057320
    mov mov ecx, dword ptr [esp + 108]
    add add esp, 12
    movzx movzx eax, word ptr [ecx]
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 100]
    dec dec eax
    mov mov byte ptr [ecx], al
    movzx movzx ecx, byte ptr [eax + edx]
    mov mov edx, dword ptr [esp + 104]
    sub sub esi, ecx
    movzx movzx ecx, byte ptr [eax + edx]
    mov mov edx, dword ptr [esp + 108]
    movzx movzx eax, byte ptr [eax + edx]
    mov mov edx, dword ptr [esp + 28]
    sub sub edi, ecx
    sub sub ebp, eax
    mov mov ecx, esi
    lea lea eax, [esi + esi]
    add add esi, eax
    add add edx, esi
    mov mov word ptr [ebx], dx
    mov mov edx, dword ptr [esp + 44]
    add add esi, eax
    add add edx, esi
    mov mov dword ptr [esp + 28], edx
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [esp + 44], ecx
    add add esi, eax
    mov mov ecx, edi
    lea lea eax, [edi + edi]
    add add edi, eax
    add add edx, edi
L3:
    mov mov word ptr [ebx + 2], dx
    mov mov edx, dword ptr [esp + 48]
    add add edi, eax
    add add edx, edi
    mov mov dword ptr [esp + 32], edx
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [esp + 48], ecx
    add add edi, eax
    mov mov ecx, ebp
    lea lea eax, [ebp + ebp]
    add add ebp, eax
    add add edx, ebp
    mov mov word ptr [ebx + 4], dx
    mov mov edx, dword ptr [esp + 52]
    add add ebp, eax
    add add edx, ebp
    mov mov dword ptr [esp + 52], ecx
    mov mov ecx, dword ptr [esp + 16]
    add add ebp, eax
    mov mov eax, dword ptr [esp + 080h]
    add add ecx, eax
    mov mov dword ptr [esp + 36], edx
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [esp + 16], ecx
    mov mov ecx, dword ptr [esp + 56]
    lea lea ebx, [ebx + eax*2]
    mov mov eax, dword ptr [esp + 60]
    add add edx, ecx
    mov mov ecx, dword ptr [esp + 68]
    dec dec eax
    mov mov dword ptr [esp + 20], edx
    mov mov dword ptr [esp + 60], eax
    jne sub_100576EA
    mov mov edx, dword ptr [esp + 64]
    mov mov ax, word ptr [esp + 28]
    mov mov esi, dword ptr [esp + 72]
    mov mov word ptr [ebx], ax
    mov mov ax, word ptr [esp + 32]
    mov mov word ptr [ebx + 2], ax
    mov mov ax, word ptr [esp + 36]
    mov mov word ptr [ebx + 4], ax
    mov mov ebx, dword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 76]
    add add ebx, 4
    xor xor edi, edi
    dec dec eax
    mov mov dword ptr [esp + 40], ebx
    mov mov dword ptr [esp + 76], eax
    jne sub_1005768C
    pop pop ebp
    pop pop ebx
    pop pop edi
    pop pop esi
    add add esp, 96
    ret ret
FUN_10057350 ENDP
END
