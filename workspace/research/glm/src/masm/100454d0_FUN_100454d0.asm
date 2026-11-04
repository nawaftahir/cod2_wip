.686
.MODEL FLAT, C
EXTRN sub_10044E4F:PROC
EXTRN sub_10044ED1:PROC
.CODE
FUN_100454d0 PROC
    push ebx
    push esi
    push edi
    mov esi, eax
    push 0000000DAh
    call sub_10044E4F
    mov ebx, dword ptr [esi + 0000000ECh]
    add esp, 4
    lea ebx, [ebx + ebx + 6]
    call sub_10044ED1
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [esi + 0000000ECh]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L0
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L0
    mov eax, dword ptr [esi]
    mov edi, 24
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    jmp L1
L0:
    mov edi, 24
L1:
    mov eax, dword ptr [esi + 0000000ECh]
    push ebp
    xor ebp, ebp
    test eax, eax
    jle L7
    lea ebx, [esi + 0000000F0h]
L2:
    mov eax, dword ptr [esi + 32]
    mov edi, dword ptr [ebx]
    mov cl, byte ptr [edi]
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
    mov dword ptr [edx + 20], 24
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L3:
    mov al, byte ptr [esi + 0000000DCh]
    test al, al
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [edi + 24]
    je L5
    mov eax, dword ptr [esi + 000000134h]
    test eax, eax
    jne L4
    mov eax, dword ptr [esi + 00000013Ch]
    xor edx, edx
    test eax, eax
    je L5
    mov al, byte ptr [esi + 0000000B9h]
    test al, al
    jne L5
L4:
    xor ecx, ecx
L5:
    mov eax, dword ptr [esi + 32]
    shl cl, 4
    add cl, dl
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
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 24
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L6:
    mov eax, dword ptr [esi + 0000000ECh]
    inc ebp
    add ebx, 4
    cmp ebp, eax
    jl L2
    mov edi, 24
L7:
    mov eax, dword ptr [esi + 32]
    mov cl, byte ptr [esi + 000000134h]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], cl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    pop ebp
    mov dword ptr [eax + 4], ecx
    jne L8
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L8
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L8:
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [esi + 000000138h]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], dl
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
    mov dl, byte ptr [esi + 00000013Ch]
    mov eax, dword ptr [esi + 32]
    mov bl, byte ptr [esi + 000000140h]
    mov ecx, dword ptr [eax]
    shl dl, 4
    add dl, bl
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L10
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L10
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L10:
    pop edi
    pop esi
    pop ebx
    ret
FUN_100454d0 ENDP
END
