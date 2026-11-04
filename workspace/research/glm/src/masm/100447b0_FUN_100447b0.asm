.686
.MODEL FLAT, C
.CODE
FUN_100447b0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 000000834h
    push ebx
    mov ebx, eax
    xor eax, eax
    mov dword ptr [esp + 4], eax
    mov dword ptr [esp + 8], eax
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 24], eax
    push esi
    push edi
    mov dword ptr [esp + 36], eax
    mov dword ptr [esp + 40], eax
    mov ecx, 000000101h
    lea edi, [esp + 48]
    rep stosd dword ptr es:[edi], eax
    mov byte ptr [esp + 44], al
    mov ecx, 000000101h
    or eax, 0FFFFFFFFh
    lea edi, [esp + 000000438h]
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [ebx + 000000400h], 1
    lea ecx, [ecx]
L0:
    or eax, 0FFFFFFFFh
    mov esi, 03B9ACA00h
    xor ecx, ecx
    lea ebx, [ebx]
L1:
    mov edx, dword ptr [ebx + ecx*4]
    test edx, edx
    je L2
    cmp edx, esi
    jg L2
    mov esi, edx
    mov eax, ecx
L2:
    inc ecx
    cmp ecx, 000000100h
    jle L1
    or edx, 0FFFFFFFFh
    mov edi, 03B9ACA00h
    xor ecx, ecx
L3:
    mov esi, dword ptr [ebx + ecx*4]
    test esi, esi
    je L4
    cmp esi, edi
    jg L4
    cmp ecx, eax
    je L4
    mov edi, esi
    mov edx, ecx
L4:
    inc ecx
    cmp ecx, 000000100h
    jle L3
    test edx, edx
    jl L8
    mov ecx, dword ptr [ebx + edx*4]
    mov esi, dword ptr [ebx + eax*4]
    mov edi, dword ptr [esp + eax*4 + 48]
    add esi, ecx
    mov dword ptr [ebx + eax*4], esi
    mov esi, dword ptr [esp + eax*4 + 000000438h]
    lea ecx, [esp + eax*4 + 000000438h]
    inc edi
    test esi, esi
    mov dword ptr [ebx + edx*4], 0
    mov dword ptr [esp + eax*4 + 48], edi
    jl L6
L5:
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [esp + eax*4 + 48]
    mov esi, dword ptr [esp + eax*4 + 000000438h]
    lea ecx, [esp + eax*4 + 000000438h]
    inc edi
    test esi, esi
    mov dword ptr [esp + eax*4 + 48], edi
    jge L5
L6:
    mov esi, dword ptr [esp + edx*4 + 48]
    mov dword ptr [esp + eax*4 + 000000438h], edx
    mov ecx, dword ptr [esp + edx*4 + 000000438h]
    lea eax, [esp + edx*4 + 000000438h]
    inc esi
    test ecx, ecx
    mov dword ptr [esp + edx*4 + 48], esi
    jl L0
    jmp L7
    lea esp, [esp]
    nop
L7:
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esp + eax*4 + 48]
    mov ecx, dword ptr [esp + eax*4 + 000000438h]
    inc edx
    test ecx, ecx
    mov dword ptr [esp + eax*4 + 48], edx
    lea eax, [esp + eax*4 + 000000438h]
    jge L7
    jmp L0
L8:
    xor edi, edi
    mov ebx, 39
    lea esp, [esp]
L9:
    mov esi, dword ptr [esp + edi*4 + 48]
    test esi, esi
    je L11
    cmp esi, 32
    jle L10
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax]
    mov dword ptr [edx + 20], ebx
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L10:
    mov al, byte ptr [esp + esi + 12]
    lea esi, [esp + esi + 12]
    inc al
    mov byte ptr [esi], al
L11:
    inc edi
    cmp edi, 000000100h
    jle L9
    mov esi, 16
    mov ecx, 30
    mov edx, esi
    mov edi, edi
L12:
    mov al, byte ptr [esp + ecx + 14]
    test al, al
    jbe L16
L13:
    mov bl, byte ptr [esp + ecx + 12]
    test bl, bl
    mov eax, ecx
    jne L15
L14:
    mov bl, byte ptr [esp + eax + 11]
    dec eax
    test bl, bl
    je L14
L15:
    add byte ptr [esp + ecx + 14], 0000000FEh
    inc byte ptr [esp + ecx + 13]
    add byte ptr [esp + eax + 13], 2
    mov bl, byte ptr [esp + eax + 12]
    lea eax, [esp + eax + 12]
    dec bl
    mov byte ptr [eax], bl
    mov al, byte ptr [esp + ecx + 14]
    test al, al
    ja L13
L16:
    dec ecx
    dec esi
    jne L12
    mov al, byte ptr [esp + 28]
    test al, al
    jne L18
    lea esp, [esp]
L17:
    mov al, byte ptr [esp + edx + 11]
    dec edx
    test al, al
    je L17
L18:
    mov cl, byte ptr [esp + edx + 12]
    mov esi, dword ptr [ebp + 12]
    lea eax, [esp + edx + 12]
    dec cl
    mov byte ptr [eax], cl
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [esp + 16]
    mov edx, esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 20]
    mov dword ptr [edx + 4], ecx
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [edx + 8], eax
    mov al, byte ptr [esp + 28]
    mov dword ptr [edx + 12], ecx
    mov byte ptr [edx + 16], al
    xor ecx, ecx
    mov edx, 1
L19:
    xor eax, eax
L20:
    cmp dword ptr [esp + eax*4 + 48], edx
    jne L21
    mov byte ptr [ecx + esi + 17], al
    inc ecx
L21:
    inc eax
    cmp eax, 0000000FFh
    jle L20
    inc edx
    cmp edx, 32
    jle L19
    pop edi
FUN_100447b0 ENDP
END
