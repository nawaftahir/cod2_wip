.686
.MODEL FLAT, C
EXTRN sub_10041AFB:PROC
.CODE
FUN_100418c0 PROC
    mov eax, dword ptr [esi + 20]
    cmp eax, 101
    je L0
    cmp eax, 102
    je L0
    cmp eax, 103
    je L3
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    jmp L2
L0:
    mov ecx, dword ptr [esi + 0000000D8h]
    cmp ecx, dword ptr [esi + 40]
    jae L1
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 67
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L1:
    mov ecx, dword ptr [esi + 000000144h]
    push esi
    call dword ptr [ecx + 8]
L2:
    add esp, 4
L3:
    mov edx, dword ptr [esi + 000000144h]
    mov al, byte ptr [edx + 13]
    test al, al
    jne L9
    push ebx
    push edi
    mov ebx, 24
    jmp L4
    lea ecx, [ecx]
L4:
    mov eax, dword ptr [esi + 000000144h]
    push esi
    call dword ptr [eax]
    mov eax, dword ptr [esi + 0000000E8h]
    add esp, 4
    xor edi, edi
    test eax, eax
    jbe L8
L5:
    mov eax, dword ptr [esi + 8]
    test eax, eax
    je L6
    mov dword ptr [eax + 4], edi
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [esi + 0000000E8h]
    mov dword ptr [ecx + 8], edx
    mov eax, dword ptr [esi + 8]
    push esi
    call dword ptr [eax]
    add esp, 4
L6:
    mov ecx, dword ptr [esi + 000000150h]
    push 0
    push esi
    call dword ptr [ecx + 4]
    add esp, 8
    test al, al
    jne L7
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], ebx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L7:
    mov eax, dword ptr [esi + 0000000E8h]
    inc edi
    cmp edi, eax
    jb L5
L8:
    mov ecx, dword ptr [esi + 000000144h]
    push esi
    call dword ptr [ecx + 8]
    mov edx, dword ptr [esi + 000000144h]
    mov al, byte ptr [edx + 13]
    add esp, 4
    test al, al
    je L4
    pop edi
    pop ebx
L9:
    mov eax, dword ptr [esi + 000000154h]
    push esi
    call dword ptr [eax + 0xc]
    mov ecx, dword ptr [esi + 32]
    push esi
    call dword ptr [ecx + 0x10]
    mov eax, dword ptr [esi + 4]
    add esp, 8
    test eax, eax
    je sub_10041AFB
    push 1
    push esi
    call dword ptr [eax + 0x24]
    mov al, byte ptr [esi + 16]
    add esp, 8
    test al, al
    je L10
    mov dword ptr [esi + 20], 0000000C8h
    mov dword ptr [esi + 000000114h], 0
    ret
FUN_100418c0 ENDP
END
