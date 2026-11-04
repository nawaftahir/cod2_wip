.686
.MODEL FLAT, C
EXTRN sub_10044E4C:PROC
EXTRN sub_10044ECB:PROC
EXTRN sub_10044F2F:PROC
EXTRN sub_10044F37:PROC
EXTRN sub_10045524:PROC
EXTRN sub_1004552F:PROC
EXTRN sub_10045584:PROC
EXTRN sub_10045594:PROC
EXTRN sub_1004559F:PROC
EXTRN sub_100455F4:PROC
EXTRN sub_100455FF:PROC
.CODE
FUN_10045350 PROC
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov esi, ecx
    push push eax
    call sub_10044E4C
    mov mov eax, dword ptr [esi + 68]
    add add esp, 4
    lea lea ebx, [eax + eax*2 + 8]
    call sub_10044ECB
    mov mov ecx, dword ptr [esi + 40]
    mov mov eax, 0FFFFh
    cmp cmp ecx, eax
    jg L0
    cmp cmp dword ptr [esi + 36], eax
    jle L1
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 41
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 24], eax
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [esi + 64]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
L0:
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    mov mov ebp, 24
    jne L2
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L3
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], ebp
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov ebx, dword ptr [esi + 40]
    call sub_10044F2F
    mov mov ebx, dword ptr [esi + 36]
    call sub_10044F37
    mov mov eax, dword ptr [esi + 32]
    mov mov cl, byte ptr [esi + 68]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne L4
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L5
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], ebp
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 68]
    mov mov edi, dword ptr [esi + 76]
    xor xor ebx, ebx
    test test eax, eax
    jle sub_10045584
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [edi]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
L2:
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045524
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_1004552F
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], ebp
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov dl, byte ptr [edi + 8]
    mov mov eax, dword ptr [esi + 32]
    mov mov cl, byte ptr [edi + 12]
    shl shl dl, 4
    add add dl, cl
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045594
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_1004559F
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], ebp
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [edi + 16]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_100455F4
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_100455FF
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], ebp
L4:
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 68]
L5:
    inc inc ebx
    add add edi, 84
    cmp cmp ebx, eax
    jl sub_10045584
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10045350 ENDP
END
