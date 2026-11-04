.686
.MODEL FLAT, C
EXTRN sub_10044E4F:PROC
EXTRN sub_10044ED1:PROC
EXTRN sub_100456DC:PROC
EXTRN sub_100456E7:PROC
EXTRN sub_10045776:PROC
EXTRN sub_10045781:PROC
EXTRN sub_100457DC:PROC
EXTRN sub_100457E7:PROC
EXTRN sub_10045858:PROC
EXTRN sub_10045863:PROC
.CODE
FUN_100454d0 PROC
    push push ebx
    push push esi
    push push edi
    mov mov esi, eax
    push push 0DAh
    call sub_10044E4F
    mov mov ebx, dword ptr [esi + 0ECh]
    add add esp, 4
    lea lea ebx, [ebx + ebx + 6]
    call sub_10044ED1
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [esi + 0ECh]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne L0
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L1
    mov mov eax, dword ptr [esi]
    mov mov edi, 24
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    jmp L2
    mov mov edi, 24
    mov mov eax, dword ptr [esi + 0ECh]
    push push ebp
    xor xor ebp, ebp
    test test eax, eax
    jle L6
    lea lea ebx, [esi + 0F0h]
    mov mov eax, dword ptr [esi + 32]
    mov mov edi, dword ptr [ebx]
    mov mov cl, byte ptr [edi]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne L3
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
L0:
    test test al, al
    jne L4
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 24
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov al, byte ptr [esi + 0DCh]
    test test al, al
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [edi + 24]
    je L5
    mov mov eax, dword ptr [esi + 0134h]
    test test eax, eax
    jne L8
    mov mov eax, dword ptr [esi + 013Ch]
    xor xor edx, edx
    test test eax, eax
    je L9
    mov mov al, byte ptr [esi + 0B9h]
    test test al, al
    jne L10
    xor xor ecx, ecx
    mov mov eax, dword ptr [esi + 32]
    shl shl cl, 4
    add add cl, dl
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_100456DC
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_100456E7
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 24
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 0ECh]
    inc inc ebp
    add add ebx, 4
    cmp cmp ebp, eax
    jl L7
    mov mov edi, 24
    mov mov eax, dword ptr [esi + 32]
    mov mov cl, byte ptr [esi + 0134h]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    pop pop ebp
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045776
L4:
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045781
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [esi + 0138h]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_100457DC
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_100457E7
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov dl, byte ptr [esi + 013Ch]
    mov mov eax, dword ptr [esi + 32]
    mov mov bl, byte ptr [esi + 0140h]
    mov mov ecx, dword ptr [eax]
    shl shl dl, 4
    add add dl, bl
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
L9:
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045858
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045863
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_100454d0 ENDP
END
