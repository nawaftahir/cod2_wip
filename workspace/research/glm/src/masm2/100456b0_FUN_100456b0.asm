.686
.MODEL FLAT, C
EXTRN sub_10044E4F:PROC
EXTRN sub_10044ECC:PROC
EXTRN sub_1004505C:PROC
EXTRN sub_10045068:PROC
EXTRN sub_1004590C:PROC
EXTRN sub_10045917:PROC
EXTRN sub_10045972:PROC
EXTRN sub_1004597D:PROC
EXTRN sub_100459D8:PROC
EXTRN sub_100459E3:PROC
EXTRN sub_10045A64:PROC
EXTRN sub_10045A6F:PROC
EXTRN sub_10045AC0:PROC
EXTRN sub_10045ACB:PROC
.CODE
FUN_100456b0 PROC
    push push ebx
    push push esi
    push push edi
    mov mov esi, eax
    push push 0E0h
    call sub_10044E4F
    add add esp, 4
    mov mov ebx, 16
    call sub_10044ECC
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 74
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
    mov mov byte ptr [ecx], 70
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
    mov mov byte ptr [ecx], 73
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
    mov mov byte ptr [ecx], 70
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne L6
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L7
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 0
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
L3:
    jne L8
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L9
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [esi + 0CDh]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_1004590C
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045917
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov cl, byte ptr [esi + 0CEh]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
L5:
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045972
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_1004597D
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [esi + 0CFh]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_100459D8
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_100459E3
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
L6:
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    movzx movzx ebx, word ptr [esi + 0D0h]
    call sub_1004505C
    movzx movzx ebx, word ptr [esi + 0D2h]
    call sub_10045068
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], 0
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045A64
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045A6F
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], 0
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045AC0
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045ACB
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_100456b0 ENDP
END
