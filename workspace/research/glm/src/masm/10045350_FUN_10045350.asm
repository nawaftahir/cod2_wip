.686
.MODEL FLAT, C
EXTRN sub_10044E4C:PROC
EXTRN sub_10044ECB:PROC
EXTRN sub_10044F2F:PROC
EXTRN sub_10044F37:PROC
.CODE
FUN_10045350 PROC
    push ebx
    push ebp
    push esi
    push edi
    mov esi, ecx
    push eax
    call sub_10044E4C
    mov eax, dword ptr [esi + 68]
    add esp, 4
    lea ebx, [eax + eax*2 + 8]
    call sub_10044ECB
    mov ecx, dword ptr [esi + 40]
    mov eax, 00000FFFFh
    cmp ecx, eax
    jg L0
    cmp dword ptr [esi + 36], eax
    jle L1
L0:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 41
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L1:
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [esi + 64]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    mov ebp, 24
    jne L2
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L2
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L2:
    mov ebx, dword ptr [esi + 40]
    call sub_10044F2F
    mov ebx, dword ptr [esi + 36]
    call sub_10044F37
    mov eax, dword ptr [esi + 32]
    mov cl, byte ptr [esi + 68]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], cl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L3
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L3
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], ebp
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L3:
    mov eax, dword ptr [esi + 68]
    mov edi, dword ptr [esi + 76]
    xor ebx, ebx
    test eax, eax
    jle L8
L4:
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [edi]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L5
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L5
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L5:
    mov dl, byte ptr [edi + 8]
    mov eax, dword ptr [esi + 32]
    mov cl, byte ptr [edi + 12]
    shl dl, 4
    add dl, cl
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L6
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L6
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], ebp
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L6:
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [edi + 16]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L7
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L7
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L7:
    mov eax, dword ptr [esi + 68]
    inc ebx
    add edi, 84
    cmp ebx, eax
    jl L4
L8:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10045350 ENDP
END
