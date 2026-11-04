.686
.MODEL FLAT, C
EXTRN sub_10044E4F:PROC
EXTRN sub_10044ECC:PROC
EXTRN sub_10044FC1:PROC
EXTRN sub_10044FC8:PROC
EXTRN sub_10044FCD:PROC
EXTRN sub_10045A6A:PROC
EXTRN sub_10045A75:PROC
EXTRN sub_10045AC6:PROC
EXTRN sub_10045AD1:PROC
EXTRN sub_10045B2D:PROC
EXTRN sub_10045B32:PROC
EXTRN sub_10045B43:PROC
EXTRN sub_10045B48:PROC
EXTRN sub_10045B84:PROC
EXTRN sub_10045B8F:PROC
.CODE
FUN_100458d0 PROC
    push push ebx
    push push esi
    push push edi
    mov mov esi, eax
    push push 0EEh
    call sub_10044E4F
    add add esp, 4
    mov mov ebx, 14
    call sub_10044ECC
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 65
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    mov mov edi, 24
    jne L0
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L1
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 100
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne L2
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L3
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 111
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
L1:
    jne L4
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L5
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 98
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045A6A
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045A75
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 101
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
L3:
    jne sub_10045AC6
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045AD1
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov ebx, 100
    call sub_10044FC1
    xor xor ebx, ebx
    call sub_10044FC8
    call sub_10044FCD
    mov mov eax, dword ptr [esi + 72]
    sub sub eax, 3
    je sub_10045B2D
    sub sub eax, 2
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    je sub_10045B32
    mov mov byte ptr [ecx], bl
    jmp sub_10045B43
    mov mov byte ptr [ecx], 2
    jmp sub_10045B48
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 1
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
L5:
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045B84
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045B8F
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
FUN_100458d0 ENDP
END
