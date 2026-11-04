.686
.MODEL FLAT, C
EXTRN g_1042E778:DWORD
.CODE
FUN_10029560 PROC
    push ecx
    mov eax, dword ptr [g_1042E778]
    push ebx
    push ebp
    push esi
    push edi
    mov edi, 010696C44h
    mov dword ptr [esp + 16], edi
    mov ebx, 8
    jmp L1
L0:
    mov edi, dword ptr [esp + 16]
    mov edi, edi
L1:
    mov esi, dword ptr [edi]
    cmp esi, -1
    je L4
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    cmp ecx, ebx
    jge L2
    xor ecx, ecx
    mov dword ptr [eax + 000030008h], ecx
    jmp L3
L2:
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], ebx
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 2
    mov word ptr [ecx + 2], bx
L3:
    lea edx, [eax + esi + 8]
    mov dword ptr [ecx + 4], edx
    mov dword ptr [edi], 0FFFFFFFFh
L4:
    lea esi, [edi + 4]
    mov ebp, 4
L5:
    mov edi, dword ptr [esi]
    cmp edi, -1
    je L8
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    cmp ecx, ebx
    jge L6
    xor ecx, ecx
    mov dword ptr [eax + 000030008h], ecx
    jmp L7
L6:
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], ebx
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 2
    mov word ptr [ecx + 2], bx
L7:
    lea edx, [eax + edi + 8]
    mov dword ptr [ecx + 4], edx
    mov dword ptr [esi], 0FFFFFFFFh
L8:
    add esi, 4
    dec ebp
    jne L5
    mov edi, dword ptr [esp + 16]
    mov esi, dword ptr [edi + 20]
    cmp esi, -1
    je L11
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    cmp ecx, ebx
    jge L9
    xor ecx, ecx
    mov dword ptr [eax + 000030008h], ecx
    jmp L10
L9:
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], ebx
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 2
    mov word ptr [ecx + 2], bx
L10:
    lea edx, [eax + esi + 8]
    mov dword ptr [ecx + 4], edx
    mov dword ptr [edi + 20], 0FFFFFFFFh
L11:
    add edi, 28
    cmp edi, 010696CD0h
    mov dword ptr [esp + 16], edi
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_10029560 ENDP
END
