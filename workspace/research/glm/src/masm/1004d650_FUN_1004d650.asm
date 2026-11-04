.686
.MODEL FLAT, C
.CODE
FUN_1004d650 PROC
    sub esp, 32
    push ebp
    push esi
    mov esi, dword ptr [esp + 44]
    mov eax, dword ptr [esi + 000000120h]
    mov edx, dword ptr [esi + 44]
    mov ecx, dword ptr [esi + 00000018Ch]
    xor ebp, ebp
    test edx, edx
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [esi + 0000000CCh]
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 8], ebp
    jle L8
    lea edx, [eax + 12]
    push ebx
    lea eax, [ecx + 8]
    push edi
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 20], eax
    jmp L1
L0:
    mov ecx, dword ptr [esp + 40]
    mov esi, dword ptr [esp + 52]
    mov edx, dword ptr [esp + 24]
L1:
    mov eax, dword ptr [edx + 24]
    imul eax, dword ptr [edx]
    cdq
    idiv dword ptr [esi + 000000120h]
    mov esi, dword ptr [esp + 32]
    mov edx, dword ptr [ecx + 56]
    mov ebx, dword ptr [edx + ebp*4]
    mov ecx, dword ptr [ecx + 60]
    mov edx, dword ptr [esp + 20]
    mov ecx, dword ptr [ecx + ebp*4]
    mov edi, dword ptr [edx]
    add esi, 2
    mov dword ptr [esp + 36], ebx
    imul esi, eax
    test esi, esi
    jle L3
    mov ebp, edi
    sub ebp, ecx
    sub ebx, ecx
    mov edx, ecx
    mov dword ptr [esp + 44], ebx
    mov dword ptr [esp + 28], esi
L2:
    mov ebx, dword ptr [edx + ebp]
    mov esi, dword ptr [esp + 44]
    mov dword ptr [edx], ebx
    mov dword ptr [esi + edx], ebx
    mov esi, dword ptr [esp + 28]
    add edx, 4
    dec esi
    mov dword ptr [esp + 28], esi
    jne L2
    mov ebx, dword ptr [esp + 36]
    mov ebp, dword ptr [esp + 16]
L3:
    lea edx, [eax + eax]
    test edx, edx
    jle L5
    mov edx, dword ptr [esp + 32]
    mov esi, eax
    imul esi, edx
    add edx, -2
    imul edx, eax
    mov ebx, edi
    lea esi, [ecx + esi*4]
    sub ebx, ecx
    lea edx, [edi + edx*4]
    sub ecx, edi
    lea edi, [eax + eax]
    lea ebx, [ebx]
L4:
    mov ebp, dword ptr [esi + ebx]
    mov dword ptr [ecx + edx], ebp
    mov ebp, dword ptr [edx]
    mov dword ptr [esi], ebp
    add edx, 4
    add esi, 4
    dec edi
    jne L4
    mov ebx, dword ptr [esp + 36]
    mov ebp, dword ptr [esp + 16]
L5:
    test eax, eax
    jle L7
    lea ecx, [eax*4]
    mov edx, ecx
    mov ecx, ebx
    sub ecx, edx
    lea esp, [esp]
L6:
    mov edx, dword ptr [ebx]
    mov dword ptr [ecx], edx
    add ecx, 4
    dec eax
    jne L6
L7:
    mov esi, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 52]
    mov ecx, dword ptr [eax + 44]
    inc ebp
    add esi, 4
    add edx, 84
    cmp ebp, ecx
    mov dword ptr [esp + 16], ebp
    mov dword ptr [esp + 20], esi
    mov dword ptr [esp + 24], edx
    jl L0
    pop edi
    pop ebx
L8:
    pop esi
    pop ebp
    add esp, 32
    ret
FUN_1004d650 ENDP
END
