.686
.MODEL FLAT, C
EXTRN sub_10044E4F:PROC
EXTRN sub_10044ECC:PROC
EXTRN sub_1004505C:PROC
EXTRN sub_10045068:PROC
.CODE
FUN_100456b0 PROC
    push ebx
    push esi
    push edi
    mov esi, eax
    push 0000000E0h
    call sub_10044E4F
    add esp, 4
    mov ebx, 16
    call sub_10044ECC
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 74
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    mov edi, 24
    jne L0
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L0
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L0:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 70
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L1
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L1
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L1:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 73
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L2
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L2
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L2:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 70
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
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L3:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 0
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L4
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L4
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L4:
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [esi + 0000000CDh]
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
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L5:
    mov eax, dword ptr [esi + 32]
    mov cl, byte ptr [esi + 0000000CEh]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], cl
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
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L6:
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [esi + 0000000CFh]
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
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L7:
    movzx ebx, word ptr [esi + 0000000D0h]
    call sub_1004505C
    movzx ebx, word ptr [esi + 0000000D2h]
    call sub_10045068
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], 0
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L8
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L8
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L8:
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], 0
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L9
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L9
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L9:
    pop edi
    pop esi
    pop ebx
    ret
FUN_100456b0 ENDP
END
