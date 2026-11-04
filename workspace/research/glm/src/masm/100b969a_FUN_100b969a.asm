.686
.MODEL FLAT, C
.CODE
FUN_100b969a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebp + 8]
    push ebx
    mov ebx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + ecx*4]
    push esi
    push edi
    mov edi, dword ptr [ebx + 96]
    mov ecx, dword ptr [edi + 32]
    test ecx, ecx
    mov dword ptr [ebp + 16], eax
    mov eax, dword ptr [eax + 96]
    mov esi, 01019166Eh
    jne L0
    mov ecx, esi
L0:
    mov edx, dword ptr [eax + 32]
    test edx, edx
    je L1
    mov esi, edx
L1:
    mov al, byte ptr [ecx]
    mov dl, al
    cmp al, byte ptr [esi]
    jne L3
    test dl, dl
    je L2
    mov al, byte ptr [ecx + 1]
    mov dl, al
    cmp al, byte ptr [esi + 1]
    jne L3
    inc ecx
    inc ecx
    inc esi
    inc esi
    test dl, dl
    jne L1
L2:
    xor ecx, ecx
    jmp L4
L3:
    sbb ecx, ecx
    sbb ecx, -1
L4:
    test ecx, ecx
    jle L6
L5:
    xor eax, eax
    inc eax
    jmp L13
L6:
    jge L8
L7:
    or eax, 0FFFFFFFFh
    jmp L13
L8:
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 96]
    mov eax, dword ptr [eax + 20]
    mov esi, dword ptr [eax + 24]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + 24]
L9:
    mov al, byte ptr [ecx]
    mov dl, al
    cmp al, byte ptr [esi]
    jne L11
    test dl, dl
    je L10
    mov al, byte ptr [ecx + 1]
    mov dl, al
    cmp al, byte ptr [esi + 1]
    jne L11
    inc ecx
    inc ecx
    inc esi
    inc esi
    test dl, dl
    jne L9
L10:
    xor ecx, ecx
    jmp L12
L11:
    sbb ecx, ecx
    sbb ecx, -1
L12:
    test ecx, ecx
    jg L5
    jl L7
    mov eax, dword ptr [ebp + 16]
    mov ecx, dword ptr [eax + 96]
    cmp edi, ecx
    ja L5
    jb L7
    mov ecx, dword ptr [ebx + 116]
    mov edx, dword ptr [eax + 116]
    cmp ecx, edx
    jb L7
    ja L5
    mov ecx, dword ptr [ebx + 16]
    mov edx, dword ptr [eax + 16]
    cmp edx, ecx
    ja L7
    sbb eax, eax
    neg eax
L13:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
FUN_100b969a ENDP
END
