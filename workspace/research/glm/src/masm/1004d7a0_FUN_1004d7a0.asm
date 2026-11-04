.686
.MODEL FLAT, C
.CODE
FUN_1004d7a0 PROC
    sub esp, 16
    push ebx
    mov ebx, dword ptr [esp + 24]
    mov eax, dword ptr [ebx + 000000120h]
    push ebp
    mov ebp, dword ptr [ebx + 0000000CCh]
    push esi
    mov esi, dword ptr [ebx + 00000018Ch]
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [ebx + 44]
    push edi
    xor edi, edi
    test eax, eax
    mov dword ptr [esp + 24], esi
    mov dword ptr [esp + 16], edi
    jle L4
    add ebp, 12
    mov dword ptr [esp + 20], ebp
    jmp L1
L0:
    mov esi, dword ptr [esp + 24]
L1:
    mov eax, dword ptr [ebp + 24]
    imul eax, dword ptr [ebp]
    cdq
    idiv dword ptr [ebx + 000000120h]
    mov ecx, dword ptr [esi + 56]
    mov edx, dword ptr [esi + 60]
    mov ecx, dword ptr [ecx + edi*4]
    mov esi, dword ptr [edx + edi*4]
    test eax, eax
    jle L3
    mov edi, dword ptr [esp + 28]
    lea edx, [edi + 2]
    imul edx, eax
    lea ebx, [esi + edx*4]
    lea edx, [eax*4]
    mov ebp, edx
    mov edx, esi
    sub edx, ebp
    inc edi
    imul edi, eax
    lea edi, [esi + edi*4]
    sub ecx, esi
L2:
    mov ebp, dword ptr [ecx + edi]
    mov dword ptr [ecx + edx], ebp
    mov ebp, dword ptr [edi]
    mov dword ptr [edx], ebp
    mov ebp, dword ptr [ecx + esi]
    mov dword ptr [ecx + ebx], ebp
    mov ebp, dword ptr [esi]
    mov dword ptr [ebx], ebp
    add edi, 4
    add edx, 4
    add esi, 4
    add ebx, 4
    dec eax
    jne L2
    mov ebp, dword ptr [esp + 20]
    mov edi, dword ptr [esp + 16]
    mov ebx, dword ptr [esp + 36]
L3:
    mov eax, dword ptr [ebx + 44]
    inc edi
    add ebp, 84
    cmp edi, eax
    mov dword ptr [esp + 16], edi
    mov dword ptr [esp + 20], ebp
    jl L0
L4:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 16
    ret
FUN_1004d7a0 ENDP
END
