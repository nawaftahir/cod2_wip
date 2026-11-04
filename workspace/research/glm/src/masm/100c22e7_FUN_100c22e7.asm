.686
.MODEL FLAT, C
EXTRN sub_10085630:PROC
EXTRN sub_100931C6:PROC
EXTRN sub_100BA0B4:PROC
EXTRN sub_100C23E8:PROC
.CODE
FUN_100c22e7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    xor eax, eax
    push edi
    mov edi, dword ptr [ebp + 20]
    inc eax
    test edi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 16], eax
    je L19
    mov eax, dword ptr [ebx + 24]
    push esi
    mov esi, dword ptr [eax + edi*4 - 4]
    mov ecx, esi
    call sub_10085630
    test eax, eax
    jne L17
    mov eax, dword ptr [esi]
    mov ecx, eax
    and ecx, 0F0000000h
    cmp ecx, 060000000h
    je L17
    mov edx, 0FFF00000h
    and eax, edx
    cmp eax, 011000000h
    je L17
    lea eax, [edi - 1]
    test eax, eax
    mov dword ptr [ebp - 12], eax
    jl L16
    jmp L1
L0:
    mov edx, 0FFF00000h
L1:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 12]
    mov esi, dword ptr [eax + ecx*4]
    cmp dword ptr [esi + 36], edi
    je L14
    mov eax, dword ptr [esi]
    mov ecx, eax
    and ecx, edx
    je L14
    and eax, 0F0000000h
    cmp eax, 060000000h
    je L16
    cmp ecx, 011000000h
    je L16
    push edi
    push esi
    push dword ptr [ebp + 16]
    mov ecx, ebx
    call sub_100BA0B4
    mov eax, dword ptr [esi]
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 8], 0
    and eax, edx
    cmp eax, 050000000h
    jne L2
    mov dword ptr [ebp - 4], 1
L2:
    mov ecx, dword ptr [esi + 12]
    test ecx, ecx
    jbe L8
    mov eax, dword ptr [ebx + 108]
    mov edx, dword ptr [esi + 16]
    shl eax, 3
    sar eax, 31
    mov dword ptr [ebp - 20], ecx
L3:
    test eax, eax
    mov edi, dword ptr [edx]
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + edi*4]
    jne L4
    mov edi, dword ptr [ecx + 12]
    mov ecx, dword ptr [ecx + 16]
    lea ecx, [ecx + edi*4]
    mov edi, dword ptr [ebp + 8]
    mov edi, dword ptr [edi + 20]
    mov ecx, dword ptr [edi + ecx*4]
    jmp L5
L4:
    mov ecx, dword ptr [ecx + 16]
L5:
    cmp ecx, 3
    jne L6
    mov dword ptr [ebp - 8], 1
    jmp L7
L6:
    mov dword ptr [ebp - 4], 1
L7:
    add edx, 4
    dec dword ptr [ebp - 20]
    jne L3
    mov edi, dword ptr [ebp + 20]
L8:
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 24]
    je L14
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 28]
    je L14
    push dword ptr [ebp - 12]
    dec edi
    push edi
    mov ecx, ebx
    call sub_100C23E8
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jl L18
    test byte ptr [ebx + 111], 16
    jne L15
    mov edi, dword ptr [ebp + 8]
    push 0
    push edi
    call sub_100931C6
    test eax, eax
    jl L13
    mov eax, dword ptr [esi + 12]
    test eax, eax
    jbe L12
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [edi + 20]
    mov esi, dword ptr [esi + 16]
    mov dword ptr [ebp - 20], eax
L9:
    mov eax, dword ptr [esi]
    mov eax, dword ptr [ecx + eax*4]
    mov edi, dword ptr [eax + 12]
    mov eax, dword ptr [eax + 16]
    lea eax, [eax + edi*4]
    cmp dword ptr [edx + eax*4], 3
    jne L10
    mov dword ptr [ebp - 8], 1
    jmp L11
L10:
    mov dword ptr [ebp - 4], 1
L11:
    add esi, 4
    dec dword ptr [ebp - 20]
    jne L9
L12:
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 24]
    je L13
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 28]
    jne L15
L13:
    mov ecx, dword ptr [ebx + 12]
    mov edi, dword ptr [ebx + 24]
    mov esi, dword ptr [ebp + 12]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp + 20]
L14:
    dec dword ptr [ebp - 12]
    jns L0
    jmp L16
L15:
    and dword ptr [ebp - 16], 0
L16:
    mov eax, dword ptr [ebp - 16]
    jmp L18
L17:
    xor eax, eax
    inc eax
L18:
    pop esi
L19:
    pop edi
    pop ebx
    leave
    ret 24
FUN_100c22e7 ENDP
END
