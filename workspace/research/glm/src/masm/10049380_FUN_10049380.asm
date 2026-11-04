.686
.MODEL FLAT, C
EXTRN sub_10048D01:PROC
.CODE
FUN_10049380 PROC
    sub esp, 24
    push ebx
    mov ebx, dword ptr [esp + 36]
    push ebp
    mov ebp, dword ptr [esp + 44]
    push esi
    mov esi, dword ptr [ebx + 28]
    push edi
    mov edi, dword ptr [esp + 44]
    mov eax, dword ptr [edi + 36]
    mov ecx, dword ptr [edi + 0000000E4h]
    shl esi, 3
    push esi
    push eax
    add ecx, 2
    push ecx
    lea edx, [ebp - 4]
    push edx
    call sub_10048D01
    mov eax, dword ptr [edi + 0000000BCh]
    mov ecx, 000000080h
    sub ecx, eax
    shl eax, 6
    shl ecx, 9
    mov dword ptr [esp + 32], eax
    mov eax, dword ptr [ebx + 12]
    mov dword ptr [esp + 36], ecx
    xor ecx, ecx
    add esp, 16
    test eax, eax
    mov dword ptr [esp + 28], ecx
    jle L3
    add esi, -2
    lea eax, [ebp + 4]
    mov dword ptr [esp + 36], esi
    mov dword ptr [esp + 32], eax
    mov edi, edi
L0:
    mov edx, dword ptr [esp + 56]
    mov ecx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [eax - 8]
    mov ebp, dword ptr [eax]
    movzx edx, byte ptr [edi]
    movzx ebx, byte ptr [edi + 1]
    mov dword ptr [esp + 52], ecx
    mov ecx, dword ptr [eax - 4]
    movzx esi, byte ptr [ecx]
    movzx eax, byte ptr [ebp]
    add eax, esi
    add edx, eax
    movzx eax, byte ptr [ebp + 1]
    inc ebp
    inc edi
    mov dword ptr [esp + 44], edx
    add eax, ebx
    movzx ebx, byte ptr [ecx + 1]
    add edx, edx
    inc ecx
    sub edx, esi
    imul esi, dword ptr [esp + 20]
    add eax, ebx
    mov ebx, dword ptr [esp + 36]
    add edx, eax
    imul edx, dword ptr [esp + 16]
    lea edx, [edx + esi + 000008000h]
    mov esi, dword ptr [esp + 52]
    sar edx, 16
    mov byte ptr [esi], dl
    mov edx, dword ptr [esp + 44]
    inc esi
    test ebx, ebx
    mov dword ptr [esp + 52], esi
    mov dword ptr [esp + 44], eax
    jbe L2
    mov dword ptr [esp + 24], ebx
L1:
    movzx esi, byte ptr [ecx]
    movzx ebx, byte ptr [edi + 1]
    movzx eax, byte ptr [ebp + 1]
    inc ecx
    inc edi
    inc ebp
    add eax, ebx
    movzx ebx, byte ptr [ecx]
    sub edx, esi
    imul esi, dword ptr [esp + 20]
    add eax, ebx
    mov ebx, dword ptr [esp + 44]
    add edx, eax
    add edx, ebx
    imul edx, dword ptr [esp + 16]
    lea edx, [edx + esi + 000008000h]
    mov esi, dword ptr [esp + 52]
    sar edx, 16
    mov byte ptr [esi], dl
    mov edx, ebx
    mov ebx, dword ptr [esp + 24]
    inc esi
    dec ebx
    mov dword ptr [esp + 52], esi
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 24], ebx
    jne L1
L2:
    movzx ecx, byte ptr [ecx]
    add eax, eax
    sub eax, ecx
    imul ecx, dword ptr [esp + 20]
    add eax, edx
    imul eax, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 48]
    lea ecx, [eax + ecx + 000008000h]
    mov eax, dword ptr [esp + 32]
    sar ecx, 16
    mov byte ptr [esi], cl
    mov ecx, dword ptr [esp + 28]
    mov esi, dword ptr [edx + 12]
    inc ecx
    add eax, 4
    cmp ecx, esi
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esp + 32], eax
    jl L0
L3:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
FUN_10049380 ENDP
END
