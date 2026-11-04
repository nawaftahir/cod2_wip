.686
.MODEL FLAT, C
.CODE
FUN_100534d0 PROC
    sub esp, 24
    mov eax, dword ptr [esp + 28]
    push ebx
    push ebp
    push esi
    add eax, 8
    mov dword ptr [esp + 32], 8
    push edi
L0:
    mov esi, dword ptr [eax + 20]
    mov edx, dword ptr [eax - 8]
    mov edi, dword ptr [eax + 16]
    lea ecx, [edx + esi]
    sub edx, esi
    mov esi, dword ptr [eax - 4]
    lea ebx, [esi + edi]
    mov dword ptr [esp + 24], ebx
    mov ebx, dword ptr [eax + 12]
    sub esi, edi
    mov edi, dword ptr [eax]
    lea ebp, [ebx + edi]
    mov dword ptr [esp + 20], ebp
    mov ebp, dword ptr [eax + 8]
    sub edi, ebx
    mov ebx, dword ptr [eax + 4]
    add ebp, ebx
    mov dword ptr [esp + 16], ebp
    sub ebx, dword ptr [eax + 8]
    mov ebp, dword ptr [esp + 16]
    add ebp, ecx
    mov dword ptr [esp + 28], ebp
    sub ecx, dword ptr [esp + 16]
    mov ebp, dword ptr [esp + 20]
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [esp + 24]
    add ebp, ecx
    mov dword ptr [esp + 16], ebp
    sub ecx, dword ptr [esp + 20]
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [esp + 20], ecx
    mov ecx, dword ptr [esp + 28]
    add ebp, ecx
    shl ebp, 2
    mov dword ptr [eax - 8], ebp
    sub ecx, dword ptr [esp + 16]
    mov ebp, dword ptr [esp + 32]
    shl ecx, 2
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esp + 20]
    add ecx, ebp
    imul ebp, ebp, 00000187Eh
    imul ecx, ecx, 000001151h
    lea ebp, [ecx + ebp + 000000400h]
    sar ebp, 11
    mov dword ptr [eax], ebp
    mov ebp, dword ptr [esp + 20]
    imul ebp, ebp, 000003B21h
    sub ecx, ebp
    add ecx, 000000400h
    sar ecx, 11
    mov dword ptr [eax + 16], ecx
    lea ecx, [ebx + esi]
    lea ebp, [edi + edx]
    mov dword ptr [esp + 32], ebp
    add ebp, ecx
    imul ecx, ecx, 000003EC5h
    imul ebp, ebp, 0000025A1h
    mov dword ptr [esp + 20], ebp
    lea ebp, [ebx + edx]
    imul ebx, ebx, 00000098Eh
    imul ebp, ebp, 0FFFFE333h
    mov dword ptr [esp + 28], ebp
    lea ebp, [edi + esi]
    imul ebp, ebp, 0FFFFADFDh
    mov dword ptr [esp + 24], ebp
    mov ebp, dword ptr [esp + 20]
    sub ebp, ecx
    mov ecx, dword ptr [esp + 32]
    imul ecx, ecx, 000000C7Ch
    mov dword ptr [esp + 16], ebp
    mov ebp, dword ptr [esp + 20]
    sub ebp, ecx
    add ebx, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 28]
    lea ebx, [ebx + ecx + 000000400h]
    imul edi, edi, 0000041B3h
    imul esi, esi, 000006254h
    imul edx, edx, 00000300Bh
    sar ebx, 11
    add edi, ebp
    mov dword ptr [eax + 20], ebx
    mov ebx, dword ptr [esp + 24]
    lea edi, [edi + ebx + 000000400h]
    sar edi, 11
    mov dword ptr [eax + 12], edi
    add esi, dword ptr [esp + 16]
    add edx, ebp
    lea edx, [edx + ecx + 000000400h]
    mov ecx, dword ptr [esp + 36]
    lea esi, [esi + ebx + 000000400h]
    sar esi, 11
    sar edx, 11
    mov dword ptr [eax + 4], esi
    mov dword ptr [eax - 4], edx
    add eax, 32
    dec ecx
    mov dword ptr [esp + 36], ecx
    jne L0
    mov eax, dword ptr [esp + 44]
    add eax, 64
    mov dword ptr [esp + 44], 8
    lea ebx, [ebx]
L1:
    mov esi, dword ptr [eax + 0000000A0h]
    mov edx, dword ptr [eax - 64]
    mov edi, dword ptr [eax + 000000080h]
    lea ecx, [edx + esi]
    sub edx, esi
    mov esi, dword ptr [eax - 32]
    lea ebx, [esi + edi]
    mov dword ptr [esp + 24], ebx
    mov ebx, dword ptr [eax + 96]
    sub esi, edi
    mov edi, dword ptr [eax]
    lea ebp, [ebx + edi]
    mov dword ptr [esp + 20], ebp
    mov ebp, dword ptr [eax + 64]
    sub edi, ebx
    mov ebx, dword ptr [eax + 32]
    add ebp, ebx
    mov dword ptr [esp + 16], ebp
    sub ebx, dword ptr [eax + 64]
    mov ebp, dword ptr [esp + 16]
    add ebp, ecx
    mov dword ptr [esp + 28], ebp
    sub ecx, dword ptr [esp + 16]
    mov ebp, dword ptr [esp + 20]
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [esp + 24]
    add ebp, ecx
    mov dword ptr [esp + 16], ebp
    sub ecx, dword ptr [esp + 20]
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [esp + 20], ecx
    mov ecx, dword ptr [esp + 28]
    lea ebp, [ecx + ebp + 2]
    sar ebp, 2
    mov dword ptr [eax - 64], ebp
    sub ecx, dword ptr [esp + 16]
    mov ebp, dword ptr [esp + 32]
    add ecx, 2
    sar ecx, 2
    mov dword ptr [eax + 64], ecx
    mov ecx, dword ptr [esp + 20]
    add ecx, ebp
    imul ebp, ebp, 00000187Eh
    imul ecx, ecx, 000001151h
    lea ebp, [ecx + ebp + 000004000h]
    sar ebp, 15
    mov dword ptr [eax], ebp
    mov ebp, dword ptr [esp + 20]
    imul ebp, ebp, 000003B21h
    sub ecx, ebp
    add ecx, 000004000h
    sar ecx, 15
    mov dword ptr [eax + 000000080h], ecx
    lea ecx, [ebx + esi]
    lea ebp, [edi + edx]
    mov dword ptr [esp + 32], ebp
    add ebp, ecx
    imul ecx, ecx, 000003EC5h
    imul ebp, ebp, 0000025A1h
    mov dword ptr [esp + 20], ebp
    lea ebp, [ebx + edx]
    imul ebx, ebx, 00000098Eh
    imul ebp, ebp, 0FFFFE333h
    mov dword ptr [esp + 28], ebp
    lea ebp, [edi + esi]
    imul ebp, ebp, 0FFFFADFDh
    mov dword ptr [esp + 24], ebp
    mov ebp, dword ptr [esp + 20]
    sub ebp, ecx
    mov ecx, dword ptr [esp + 32]
    imul ecx, ecx, 000000C7Ch
    mov dword ptr [esp + 16], ebp
    mov ebp, dword ptr [esp + 20]
    sub ebp, ecx
    add ebx, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 28]
    imul edi, edi, 0000041B3h
    imul esi, esi, 000006254h
    imul edx, edx, 00000300Bh
    lea ebx, [ebx + ecx + 000004000h]
    sar ebx, 15
    add edi, ebp
    mov dword ptr [eax + 0000000A0h], ebx
    mov ebx, dword ptr [esp + 24]
    lea edi, [edi + ebx + 000004000h]
    sar edi, 15
    mov dword ptr [eax + 96], edi
    add esi, dword ptr [esp + 16]
    add edx, ebp
    lea edx, [edx + ecx + 000004000h]
    mov ecx, dword ptr [esp + 44]
    lea esi, [esi + ebx + 000004000h]
    sar esi, 15
    sar edx, 15
    mov dword ptr [eax + 32], esi
    mov dword ptr [eax - 32], edx
    add eax, 4
    dec ecx
    mov dword ptr [esp + 44], ecx
    jne L1
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
FUN_100534d0 ENDP
END
