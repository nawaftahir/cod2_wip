.686
.MODEL FLAT, C
EXTRN sub_1008621C:PROC
EXTRN sub_1008B1CB:PROC
.CODE
FUN_100ad36d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 84
    push ebx
    push esi
    push edi
    mov esi, ecx
    push 18
    mov eax, 001010101h
    pop ecx
    lea edi, [ebp - 84]
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi + 76]
    test eax, eax
    jbe L7
    lea ecx, [ebp - 84]
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [esi + 000000230h]
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 12], eax
L0:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    test ecx, ecx
    je L6
    mov edx, dword ptr [ecx]
    test edx, edx
    je L6
    mov eax, edx
    and eax, 0FFF00000h
    cmp eax, 072100000h
    jne L1
    xor edx, edx
    jmp L2
L1:
    and edx, 0000FFFFFh
L2:
    mov eax, dword ptr [ecx + 4]
    cmp edx, eax
    jae L5
    mov ecx, dword ptr [ecx + 8]
    mov ebx, dword ptr [esi + 20]
    lea edi, [ecx + edx*4]
    sub eax, edx
L3:
    mov ecx, dword ptr [edi]
    mov ecx, dword ptr [ebx + ecx*4]
    mov edx, dword ptr [esi + 000000088h]
    cmp dword ptr [ecx + 4], edx
    jne L4
    mov edx, dword ptr [ecx + 16]
    cmp edx, 3
    jae L4
    mov ecx, dword ptr [ecx + 12]
    lea edx, [edx + ecx*2]
    add edx, ecx
    and dword ptr [ebp + edx*4 - 84], 0
L4:
    add edi, 4
    dec eax
    jne L3
L5:
    mov edi, dword ptr [ebp - 8]
    xor eax, eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
L6:
    add dword ptr [ebp - 4], 4
    add dword ptr [ebp - 8], 12
    dec dword ptr [ebp - 12]
    jne L0
L7:
    xor edi, edi
    xor ebx, ebx
L8:
    cmp dword ptr [ebp + ebx*4 - 84], 0
    je L9
    push 3
    xor edx, edx
    pop ecx
    mov eax, ebx
    div ecx
    mov ecx, dword ptr [ebp + 12]
    cmp dword ptr [ecx + eax*4], 0
    jne L9
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push edx
    push eax
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_1008621C
    cmp eax, -1
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx + edi*4], eax
    je L11
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    and dword ptr [eax + 60], 0
    inc edi
    cmp edi, dword ptr [ebp + 16]
    je L12
L9:
    inc ebx
    cmp ebx, 18
    jb L8
    push 010117320h
    push 0000011A9h
    push 0
    push esi
    call sub_1008B1CB
    add esp, 16
    mov eax, 080004005h
L10:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L11:
    mov eax, 08007000Eh
    jmp L10
L12:
    xor eax, eax
    jmp L10
FUN_100ad36d ENDP
END
