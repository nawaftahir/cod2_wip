.686
.MODEL FLAT, C
.CODE
FUN_100532c0 PROC
    sub esp, 20
    mov eax, dword ptr [esp + 24]
    push ebx
    push ebp
    push esi
    add eax, 8
    mov dword ptr [esp + 28], 8
    push edi
L0:
    mov ecx, dword ptr [eax + 20]
    mov edi, dword ptr [eax - 8]
    mov esi, dword ptr [eax + 16]
    lea edx, [edi + ecx]
    sub edi, ecx
    mov ecx, dword ptr [eax - 4]
    lea ebx, [ecx + esi]
    sub ecx, esi
    mov esi, dword ptr [eax + 12]
    mov ebp, ecx
    mov ecx, dword ptr [eax]
    add esi, ecx
    mov dword ptr [esp + 16], esi
    sub ecx, dword ptr [eax + 12]
    mov esi, dword ptr [eax + 8]
    mov dword ptr [esp + 28], ecx
    mov ecx, dword ptr [eax + 4]
    add esi, ecx
    mov dword ptr [esp + 20], esi
    sub ecx, dword ptr [eax + 8]
    mov esi, dword ptr [esp + 20]
    mov dword ptr [esp + 24], ecx
    lea ecx, [esi + edx]
    sub edx, esi
    mov esi, dword ptr [esp + 16]
    add esi, ebx
    add esi, ecx
    mov dword ptr [eax - 8], esi
    mov esi, dword ptr [esp + 16]
    add esi, ebx
    sub ecx, esi
    mov esi, dword ptr [esp + 16]
    mov dword ptr [eax + 8], ecx
    mov ecx, edx
    sub ecx, esi
    add ecx, ebx
    mov ebx, dword ptr [esp + 28]
    imul ecx, ecx, 0000000B5h
    sar ecx, 8
    lea esi, [ecx + edx]
    sub edx, ecx
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [eax + 16], edx
    lea edx, [ecx + ebx]
    mov dword ptr [eax], esi
    mov ecx, edx
    imul edx, edx, 00000008Bh
    lea esi, [edi + ebp]
    sub ecx, esi
    imul esi, esi, 00000014Eh
    imul ecx, ecx, 98
    sar ecx, 8
    sar edx, 8
    add edx, ecx
    sar esi, 8
    add esi, ecx
    lea ecx, [ebx + ebp]
    imul ecx, ecx, 0000000B5h
    sar ecx, 8
    lea ebx, [ecx + edi]
    sub edi, ecx
    lea ecx, [edi + edx]
    sub edi, edx
    lea edx, [ebx + esi]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [esp + 32]
    sub ebx, esi
    mov dword ptr [eax + 4], edi
    mov dword ptr [eax - 4], edx
    mov dword ptr [eax + 20], ebx
    add eax, 32
    dec ecx
    mov dword ptr [esp + 32], ecx
    jne L0
    mov eax, dword ptr [esp + 40]
    add eax, 64
    mov dword ptr [esp + 40], 8
    jmp L1
    lea esp, [esp]
    mov edi, edi
L1:
    mov ecx, dword ptr [eax + 0000000A0h]
    mov edi, dword ptr [eax - 64]
    mov esi, dword ptr [eax + 000000080h]
    lea edx, [edi + ecx]
    sub edi, ecx
    mov ecx, dword ptr [eax - 32]
    lea ebx, [ecx + esi]
    sub ecx, esi
    mov esi, dword ptr [eax + 96]
    mov ebp, ecx
    mov ecx, dword ptr [eax]
    add esi, ecx
    mov dword ptr [esp + 16], esi
    sub ecx, dword ptr [eax + 96]
    mov esi, dword ptr [eax + 64]
    mov dword ptr [esp + 28], ecx
    mov ecx, dword ptr [eax + 32]
    add esi, ecx
    mov dword ptr [esp + 20], esi
    sub ecx, dword ptr [eax + 64]
    mov esi, dword ptr [esp + 20]
    mov dword ptr [esp + 24], ecx
    lea ecx, [esi + edx]
    sub edx, esi
    mov esi, dword ptr [esp + 16]
    add esi, ebx
    add esi, ecx
    mov dword ptr [eax - 64], esi
    mov esi, dword ptr [esp + 16]
    add esi, ebx
    sub ecx, esi
    mov esi, dword ptr [esp + 16]
    mov dword ptr [eax + 64], ecx
    mov ecx, edx
    sub ecx, esi
    add ecx, ebx
    mov ebx, dword ptr [esp + 28]
    imul ecx, ecx, 0000000B5h
    sar ecx, 8
    lea esi, [ecx + edx]
    sub edx, ecx
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [eax + 000000080h], edx
    lea edx, [ecx + ebx]
    mov dword ptr [eax], esi
    mov ecx, edx
    imul edx, edx, 00000008Bh
    lea esi, [edi + ebp]
    sub ecx, esi
    imul esi, esi, 00000014Eh
    imul ecx, ecx, 98
    sar ecx, 8
    sar edx, 8
    add edx, ecx
    sar esi, 8
    add esi, ecx
    lea ecx, [ebx + ebp]
    imul ecx, ecx, 0000000B5h
    sar ecx, 8
    lea ebx, [ecx + edi]
    sub edi, ecx
    lea ecx, [edi + edx]
    sub edi, edx
    lea edx, [ebx + esi]
    mov dword ptr [eax + 96], ecx
    mov ecx, dword ptr [esp + 40]
    sub ebx, esi
    mov dword ptr [eax + 32], edi
    mov dword ptr [eax - 32], edx
    mov dword ptr [eax + 0000000A0h], ebx
    add eax, 4
    dec ecx
    mov dword ptr [esp + 40], ecx
FUN_100532c0 ENDP
END
