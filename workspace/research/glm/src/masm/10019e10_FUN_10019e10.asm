.686
.MODEL FLAT, C
.CODE
FUN_10019e10 PROC
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [eax]
    push ebx
    push ebp
    xor edx, edx
    push esi
    xor ebp, ebp
    cmp ecx, edx
    push edi
    je L6
    mov edi, eax
L0:
    cmp dword ptr [eax + 8], edx
    jne L5
    mov esi, dword ptr [eax]
    mov eax, dword ptr [esp + 20]
    nop
L1:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L3
    cmp cl, dl
    je L2
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L3
    add eax, 2
    add esi, 2
    cmp cl, dl
    jne L1
L2:
    xor eax, eax
    jmp L4
L3:
    sbb eax, eax
    sbb eax, -1
L4:
    cmp eax, edx
    je L7
L5:
    mov ecx, dword ptr [edi + 20]
    add edi, 20
    inc ebp
    cmp ecx, edx
    mov eax, edi
    jne L0
L6:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L7:
    mov ecx, dword ptr [esp + 28]
    lea eax, [ebp + ebp*4]
    movzx eax, byte ptr [ecx + eax*4 + 4]
    cmp eax, 0000000BBh
    jge L8
    mov ecx, dword ptr [esp + 32]
    pop edi
    mov byte ptr [ecx + 6], dl
    mov edx, dword ptr [esp + 20]
    mov word ptr [ecx + 4], ax
    mov al, byte ptr [edx + 5]
    pop esi
    pop ebp
    mov byte ptr [ecx + 7], al
    mov al, 1
    pop ebx
    ret
L8:
    mov esi, dword ptr [esp + 24]
    mov ecx, dword ptr [esi + 12]
    cmp word ptr [ecx], 3
    jne L9
    xor eax, 2
L9:
    mov ecx, dword ptr [esp + 32]
    mov word ptr [ecx + 4], ax
    pop edi
    mov byte ptr [ecx + 6], dl
    mov edx, dword ptr [esi + 8]
    mov al, byte ptr [edx + 8]
    pop esi
    pop ebp
    mov byte ptr [ecx + 7], al
    mov al, 1
    pop ebx
    ret
FUN_10019e10 ENDP
END
