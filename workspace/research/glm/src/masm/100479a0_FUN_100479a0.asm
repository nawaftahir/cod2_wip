.686
.MODEL FLAT, C
.CODE
FUN_100479a0 PROC
    push ecx
    push ebx
    mov ebx, eax
    test ebx, ebx
    push ebp
    mov ebp, dword ptr [esi + 28]
    jne L0
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 40
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
L0:
    mov al, byte ptr [esi + 12]
    test al, al
    jne L7
    mov eax, dword ptr [esp + 16]
    push edi
    mov ecx, ebx
    mov edi, 1
    shl edi, cl
    add ebp, ebx
    mov ecx, 24
    sub ecx, ebp
    dec edi
    and edi, eax
    shl edi, cl
    or edi, dword ptr [esi + 24]
    cmp ebp, 8
    mov dword ptr [esp + 20], edi
    jl L6
    mov eax, ebp
    shr eax, 3
    mov dword ptr [esp + 12], eax
    neg eax
    lea ebp, [ebp + eax*8]
    lea esp, [esp]
L1:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esi + 16]
    shr eax, 16
    movzx eax, al
    mov byte ptr [ecx], al
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [esi + 20]
    inc ecx
    dec eax
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], eax
    jne L3
    mov eax, dword ptr [esi + 32]
    mov ebx, dword ptr [eax + 32]
    push eax
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    jne L2
    mov edx, dword ptr [esi + 32]
    mov eax, dword ptr [edx]
    mov dword ptr [eax + 20], 24
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L2:
    mov edx, dword ptr [ebx]
    mov dword ptr [esi + 16], edx
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [esi + 20], eax
L3:
    movzx eax, byte ptr [esp + 22]
    cmp eax, 0000000FFh
    jne L5
    mov ecx, dword ptr [esi + 16]
    mov byte ptr [ecx], 0
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [esi + 20]
    inc ecx
    dec eax
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], eax
    jne L5
    mov eax, dword ptr [esi + 32]
    mov ebx, dword ptr [eax + 32]
    push eax
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    jne L4
    mov edx, dword ptr [esi + 32]
    mov eax, dword ptr [edx]
    mov dword ptr [eax + 20], 24
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L4:
    mov edx, dword ptr [ebx]
    mov dword ptr [esi + 16], edx
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [esi + 20], eax
L5:
    mov eax, dword ptr [esp + 12]
    shl edi, 8
    dec eax
    mov dword ptr [esp + 20], edi
    mov dword ptr [esp + 12], eax
    jne L1
L6:
    mov dword ptr [esi + 24], edi
    mov dword ptr [esi + 28], ebp
    pop edi
L7:
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_100479a0 ENDP
END
