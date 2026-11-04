.686
.MODEL FLAT, C
EXTRN sub_10044E4F:PROC
EXTRN sub_10044ECC:PROC
EXTRN sub_10044FC1:PROC
EXTRN sub_10044FC8:PROC
EXTRN sub_10044FCD:PROC
.CODE
FUN_100458d0 PROC
    push ebx
    push esi
    push edi
    mov esi, eax
    push 0000000EEh
    call sub_10044E4F
    add esp, 4
    mov ebx, 14
    call sub_10044ECC
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 65
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
    mov byte ptr [ecx], 100
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
    mov byte ptr [ecx], 111
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
    mov byte ptr [ecx], 98
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
    mov byte ptr [ecx], 101
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
    mov ebx, 100
    call sub_10044FC1
    xor ebx, ebx
    call sub_10044FC8
    call sub_10044FCD
    mov eax, dword ptr [esi + 72]
    sub eax, 3
    je L6
    sub eax, 2
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    je L5
    mov byte ptr [ecx], bl
    jmp L7
L5:
    mov byte ptr [ecx], 2
    jmp L7
L6:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 1
L7:
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
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L8:
    pop edi
    pop esi
    pop ebx
    ret
FUN_100458d0 ENDP
END
