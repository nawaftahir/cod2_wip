.686
.MODEL FLAT, C
EXTRN sub_100650E1:PROC
EXTRN sub_10065105:PROC
EXTRN sub_10082923:PROC
EXTRN sub_1008299C:PROC
.CODE
FUN_100996af PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 12]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [eax + 20]
    add esi, 28
    add edi, 16
    cmp dword ptr [esi], 0
    je L8
L0:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [eax + 16]
L1:
    mov bl, byte ptr [ecx]
    mov dl, bl
    cmp bl, byte ptr [eax]
    jne L3
    test dl, dl
    je L2
    mov bl, byte ptr [ecx + 1]
    mov dl, bl
    cmp bl, byte ptr [eax + 1]
    jne L3
    inc ecx
    inc ecx
    inc eax
    inc eax
    test dl, dl
    jne L1
L2:
    xor eax, eax
    jmp L4
L3:
    sbb eax, eax
    sbb eax, -1
L4:
    test eax, eax
    jge L5
    mov esi, dword ptr [ebp + 8]
    add esi, 8
    jmp L6
L5:
    jle L7
    mov esi, dword ptr [ebp + 8]
    add esi, 12
L6:
    cmp dword ptr [esi], 0
    jne L0
L7:
    cmp dword ptr [esi], 0
    jne L11
L8:
    push 24
    call sub_100650E1
    xor ebx, ebx
    cmp eax, ebx
    je L9
    push ebx
    push ebx
    push ebx
    push dword ptr [edi + 8]
    mov ecx, eax
    call sub_1008299C
    jmp L10
L9:
    xor eax, eax
L10:
    cmp eax, ebx
    mov dword ptr [esi], eax
    je L14
L11:
    push 20
    call sub_10065105
    xor ebx, ebx
    cmp eax, ebx
    je L12
    mov ecx, dword ptr [esi]
    push 010114734h
    push dword ptr [ecx + 20]
    mov ecx, eax
    push dword ptr [ebp + 12]
    call sub_10082923
    jmp L13
L12:
    xor eax, eax
L13:
    cmp eax, ebx
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], eax
    jne L15
L14:
    mov eax, 08007000Eh
    jmp L23
L15:
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax + 20]
    cmp dword ptr [eax + 12], ebx
    jne L22
    cmp dword ptr [esi], 0
    mov edx, esi
    je L21
L16:
    mov eax, dword ptr [edx]
    test eax, eax
    je L17
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L17
    mov edi, dword ptr [ecx + 12]
    mov dword ptr [ecx + 12], eax
    mov dword ptr [eax + 8], edi
    mov dword ptr [edx], ecx
    jmp L16
L17:
    lea edx, [eax + 12]
    inc ebx
    cmp dword ptr [edx], 0
    jne L16
    jmp L21
L18:
    test ebx, ebx
    mov edx, esi
    jbe L21
    mov dword ptr [ebp + 12], ebx
L19:
    mov ecx, dword ptr [edx]
    test ecx, ecx
    je L20
    mov eax, dword ptr [ecx + 12]
    test eax, eax
    je L20
    mov edi, dword ptr [eax + 8]
    mov dword ptr [eax + 8], ecx
    mov dword ptr [ecx + 12], edi
    mov dword ptr [edx], eax
L20:
    mov edx, dword ptr [edx]
    add edx, 12
    dec dword ptr [ebp + 12]
    jne L19
L21:
    shr ebx, 1
    jne L18
L22:
    xor eax, eax
L23:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_100996af ENDP
END
