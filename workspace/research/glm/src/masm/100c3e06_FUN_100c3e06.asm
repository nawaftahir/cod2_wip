.686
.MODEL FLAT, C
EXTRN sub_10084257:PROC
EXTRN sub_100842CD:PROC
EXTRN sub_10084313:PROC
EXTRN sub_10084353:PROC
EXTRN sub_100C3F45:PROC
EXTRN sub_100F7A2E:PROC
EXTRN sub_100F7AA7:PROC
EXTRN sub_100F7AB8:PROC
EXTRN sub_100F7AC6:PROC
.CODE
FUN_100c3e06 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    xor ebx, ebx
    cmp dword ptr [ebp + 24], ebx
    je L3
    mov ecx, dword ptr [ebp + 16]
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
L1:
    mov eax, dword ptr [esi + 4]
    dec eax
    je L13
    sub eax, 7
    jne L2
    mov eax, dword ptr [esi + 20]
    mov esi, dword ptr [esi + 16]
    imul ecx, eax
    jmp L1
L2:
    dec eax
    je L4
    mov eax, 080004005h
    jmp L20
L3:
    xor eax, eax
    jmp L21
L4:
    xor eax, eax
    lea edi, [ebp - 16]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi + 16]
    sub eax, ebx
    push 2
    pop edi
    je L7
    dec eax
    je L6
    dec eax
    je L5
    dec eax
    jne L8
    mov word ptr [ebp - 16], 4
    jmp L8
L5:
    mov eax, dword ptr [esi + 32]
    shr eax, 10
    not al
    and eax, 1
    or eax, edi
    mov word ptr [ebp - 16], ax
    jmp L8
L6:
    mov word ptr [ebp - 16], 1
    jmp L8
L7:
    mov word ptr [ebp - 16], bx
L8:
    mov eax, dword ptr [esi + 20]
    cmp eax, 28
    ja L11
    jmp dword ptr [eax*4 + 0x100c408b]
    mov word ptr [ebp - 14], 1
    jmp L12
    mov word ptr [ebp - 14], 3
    jmp L12
    mov word ptr [ebp - 14], di
    jmp L12
    mov word ptr [ebp - 14], 4
    jmp L12
    mov word ptr [ebp - 14], 5
    jmp L12
    mov word ptr [ebp - 14], 6
    jmp L12
    mov word ptr [ebp - 14], 7
    jmp L12
    mov word ptr [ebp - 14], 8
    jmp L12
    mov word ptr [ebp - 14], 9
    jmp L12
    mov eax, dword ptr [ebp + 20]
    test eax, 000200000h
    je L9
    mov word ptr [ebp - 14], 12
    jmp L12
L9:
    test eax, 000400000h
    je L10
    mov word ptr [ebp - 14], 13
    jmp L12
L10:
    shr eax, 22
    and ax, di
    or ax, 12
    mov word ptr [ebp - 14], ax
    jmp L12
    mov word ptr [ebp - 14], 11
    jmp L12
    mov word ptr [ebp - 14], 14
    jmp L12
    mov word ptr [ebp - 14], 15
    jmp L12
    mov word ptr [ebp - 14], 16
    jmp L12
    mov word ptr [ebp - 14], 17
    jmp L12
    mov word ptr [ebp - 14], 18
    jmp L12
L11:
    mov word ptr [ebp - 14], bx
L12:
    mov ax, word ptr [esi + 24]
    push dword ptr [ebp + 24]
    mov word ptr [ebp - 12], ax
    mov ax, word ptr [esi + 28]
    push edi
    mov word ptr [ebp - 10], ax
    push 16
    lea eax, [ebp - 16]
    mov word ptr [ebp - 8], cx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_10084257
    cmp eax, ebx
    jmp L19
L13:
    xor eax, eax
    lea edi, [ebp - 16]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push esi
    mov word ptr [ebp - 16], 5
    mov word ptr [ebp - 14], bx
    mov word ptr [ebp - 12], 1
    call sub_100C3F45
    mov word ptr [ebp - 10], ax
    mov word ptr [ebp - 8], cx
    mov eax, esi
L14:
    inc word ptr [ebp - 6]
    mov eax, dword ptr [eax + 12]
    cmp eax, ebx
    jne L14
    movzx eax, word ptr [ebp - 6]
    shl eax, 3
    push eax
    call sub_100F7A2E
    mov ebx, eax
    test ebx, ebx
    pop ecx
    mov dword ptr [ebp + 16], ebx
    jne L15
    mov eax, 08007000Eh
    jmp L20
L15:
    mov eax, dword ptr [esi + 8]
    mov edi, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 24]
    mov ecx, dword ptr [ebp + 8]
    push ebx
    push 7
    push -1
    push eax
    call sub_100842CD
    test eax, eax
    mov dword ptr [ebp + 12], eax
    jl L16
    lea eax, [ebx + 4]
    push eax
    push dword ptr [ebp + 20]
    push 1
    push dword ptr [edi + 32]
    push dword ptr [ebp + 8]
    call L0
    mov edi, eax
    test edi, edi
    jl L17
    mov esi, dword ptr [esi + 12]
    add ebx, 8
    test esi, esi
    jne L15
    mov ecx, dword ptr [ebp + 8]
    lea eax, [ebp - 4]
    push eax
    movzx eax, word ptr [ebp - 6]
    push 2
    pop edi
    push edi
    shl eax, 3
    push eax
    push dword ptr [ebp + 16]
    call sub_10084313
    push dword ptr [ebp + 16]
    mov esi, eax
    call sub_100F7AA7
    test esi, esi
    pop ecx
    jge L18
    mov eax, esi
    jmp L20
L16:
    push dword ptr [ebp + 16]
    call sub_100F7AB8
    mov eax, dword ptr [ebp + 12]
    pop ecx
    jmp L20
L17:
    push dword ptr [ebp + 16]
    call sub_100F7AC6
    pop ecx
    mov eax, edi
    jmp L20
L18:
    push dword ptr [ebp + 24]
    mov ecx, dword ptr [ebp + 8]
    push edi
    push 16
    lea eax, [ebp - 16]
    push eax
    call sub_10084353
    test eax, eax
L19:
    jl L20
    xor eax, eax
L20:
    pop edi
    pop esi
L21:
    pop ebx
    leave
    ret 20
FUN_100c3e06 ENDP
END
