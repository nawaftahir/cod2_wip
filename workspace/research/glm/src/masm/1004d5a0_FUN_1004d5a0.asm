.686
.MODEL FLAT, C
.CODE
FUN_1004d5a0 PROC
    sub esp, 12
    mov ecx, dword ptr [esi + 44]
    mov eax, dword ptr [esi + 4]
    push ebx
    push ebp
    mov ebp, dword ptr [esi + 000000120h]
    push edi
    mov edi, dword ptr [esi + 00000018Ch]
    shl ecx, 3
    push ecx
    push 1
    push esi
    mov dword ptr [esp + 32], edi
    call dword ptr [eax]
    mov dword ptr [edi + 56], eax
    mov edx, dword ptr [esi + 44]
    lea eax, [eax + edx*4]
    mov dword ptr [edi + 60], eax
    mov ecx, dword ptr [esi + 44]
    mov eax, dword ptr [esi + 0000000CCh]
    add esp, 12
    xor ebx, ebx
    test ecx, ecx
    jle L1
    add ebp, 4
    mov dword ptr [esp + 12], ebp
    lea ebp, [eax + 12]
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [ebp + 24]
    imul eax, dword ptr [ebp]
    cdq
    idiv dword ptr [esi + 000000120h]
    mov edi, dword ptr [esp + 12]
    mov ecx, dword ptr [esi + 4]
    imul edi, eax
    lea edx, [edi*8]
    push edx
    push 1
    push esi
    mov dword ptr [esp + 28], eax
    call dword ptr [ecx]
    mov ecx, dword ptr [esp + 28]
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [esp + 32]
    mov edx, dword ptr [ecx + 56]
    mov dword ptr [edx + ebx*4], eax
    mov ecx, dword ptr [ecx + 60]
    lea eax, [eax + edi*4]
    add esp, 12
    mov dword ptr [ecx + ebx*4], eax
    mov eax, dword ptr [esi + 44]
    inc ebx
    add ebp, 84
    cmp ebx, eax
    jl L0
L1:
    pop edi
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_1004d5a0 ENDP
END
