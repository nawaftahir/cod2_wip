.686
.MODEL FLAT, C
EXTRN sub_100638B8:PROC
EXTRN sub_10067E80:PROC
EXTRN sub_10067EFE:PROC
EXTRN sub_10084162:PROC
EXTRN sub_100843E3:PROC
EXTRN sub_100843FC:PROC
EXTRN sub_100847C0:PROC
EXTRN sub_1008482B:PROC
EXTRN sub_1009E1C1:PROC
EXTRN sub_100C40F9:PROC
EXTRN sub_100F7649:PROC
EXTRN sub_100F76FE:PROC
EXTRN sub_100F773B:PROC
EXTRN sub_100F7786:PROC
EXTRN sub_100F87E9:PROC
EXTRN sub_100F87FD:PROC
.CODE
FUN_100845fb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 92
    or byte ptr [ebp + 27], 000000080h
    push ebx
    push esi
    mov eax, 01010F238h
    mov ax, word ptr [eax]
    push edi
    mov edi, dword ptr [ebp + 16]
    xor ebx, ebx
    cmp ax, word ptr [edi]
    mov dword ptr [ebp - 28], ecx
    mov dword ptr [ebp - 4], ebx
    je L0
    mov eax, 01010F234h
    mov ax, word ptr [eax]
    cmp ax, word ptr [edi]
    je L0
    mov eax, 01010F230h
    mov ax, word ptr [eax]
    cmp ax, word ptr [edi]
    je L0
    mov eax, 01010F22Ch
    mov ax, word ptr [eax]
    cmp ax, word ptr [edi]
    je L0
    mov esi, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 8]
    lea eax, [esi + 12]
    push eax
    push 6
    xor edi, edi
    inc edi
    push 16
    lea eax, [ebp - 60]
    push eax
    mov word ptr [ebp - 60], di
    mov word ptr [ebp - 58], 3
    mov word ptr [ebp - 56], di
    mov word ptr [ebp - 54], 4
    mov word ptr [ebp - 52], di
    mov word ptr [ebp - 50], bx
    mov dword ptr [ebp - 48], ebx
    call sub_10084162
    cmp eax, ebx
    jl L25
    mov dword ptr [ebp - 8], edi
    jmp L22
L0:
    push ebx
    lea eax, [edi + 2]
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 84], eax
    lea eax, [ebp - 4]
    push eax
    push 2
    push dword ptr [ecx + 4]
    mov ecx, dword ptr [ecx]
    push ebx
    push ebx
    lea eax, [ebp - 92]
    push eax
    push 1
    mov dword ptr [ebp - 92], 10
    mov dword ptr [ebp - 76], ebx
    mov dword ptr [ebp - 72], ebx
    call sub_1009E1C1
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 8]
    push eax
    mov eax, dword ptr [ebp - 4]
    push dword ptr [eax + 32]
    call sub_100843FC
    cmp eax, ebx
    jl L25
    mov eax, dword ptr [ebp - 4]
    cmp dword ptr [eax + 48], ebx
    mov esi, dword ptr [ebp + 12]
    je L15
    mov eax, dword ptr [eax + 48]
    cmp eax, ebx
    mov dword ptr [ebp + 12], ebx
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 20], ebx
    mov dword ptr [ebp - 12], eax
    je L9
L1:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 8]
    cmp dword ptr [eax + 4], 17
    jne L8
    mov ecx, dword ptr [eax + 16]
    cmp ecx, ebx
    jne L2
    xor ecx, ecx
    jmp L3
L2:
    mov ecx, dword ptr [ecx + 24]
L3:
    mov eax, dword ptr [eax + 20]
    cmp eax, ebx
    jne L4
    xor edi, edi
    jmp L5
L4:
    mov edi, dword ptr [eax + 24]
L5:
    cmp ecx, ebx
    je L7
    lea eax, [ebp - 44]
    push eax
    push ebx
    push ecx
    call sub_100638B8
    test eax, eax
    jl L8
    cmp edi, ebx
    je L8
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F76FE
    pop ecx
    mov ecx, dword ptr [ebp + 16]
    movsx ecx, byte ptr [ecx]
    cmp eax, ecx
    jne L8
    mov eax, dword ptr [ebp - 40]
    cmp dword ptr [ebp + 24], eax
    jne L6
    mov dword ptr [ebp + 12], edi
    jmp L8
L6:
    mov ecx, eax
    xor ecx, dword ptr [ebp + 24]
    test ecx, 0FFFF0000h
    jne L8
    test ax, 00000FFFFh
    jne L8
    mov dword ptr [ebp - 16], edi
    jmp L8
L7:
    cmp edi, ebx
    je L8
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F773B
    pop ecx
    mov ecx, dword ptr [ebp + 16]
    movsx ecx, byte ptr [ecx]
    cmp eax, ecx
    jne L8
    mov dword ptr [ebp - 20], edi
L8:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 12]
    cmp eax, ebx
    mov dword ptr [ebp - 12], eax
    jne L1
    cmp dword ptr [ebp + 12], ebx
    mov edi, dword ptr [ebp + 16]
    jne L10
L9:
    mov eax, dword ptr [ebp - 16]
    cmp eax, ebx
    mov dword ptr [ebp + 12], eax
    jne L10
    mov eax, dword ptr [ebp - 20]
    cmp eax, ebx
    mov dword ptr [ebp + 12], eax
    je L15
L10:
    mov eax, dword ptr [ebp + 12]
    movsx eax, byte ptr [eax]
    push eax
    call sub_100F7786
    pop ecx
    movsx ecx, byte ptr [edi]
    cmp ecx, eax
    jne L15
    mov edi, dword ptr [ebp + 12]
    lea eax, [edi + 1]
    mov dword ptr [ebp + 24], eax
    movsx eax, byte ptr [eax]
    push eax
    call sub_100F87E9
    test eax, eax
    pop ecx
    je L15
    add edi, 2
    jmp L12
L11:
    inc edi
L12:
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F87FD
    test eax, eax
    pop ecx
    jne L11
    cmp byte ptr [edi], bl
    jne L15
    push dword ptr [ebp + 24]
    call sub_100F7649
    cmp eax, 000001FFFh
    pop ecx
    jbe L14
    push eax
    push dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    push 010110338h
    push 000000B56h
    add eax, 24
    push ebx
    push eax
    call sub_10067E80
    add esp, 24
L13:
    mov eax, 080004005h
    jmp L25
L14:
    shl eax, 2
    or eax, 2
    or word ptr [esi + 10], ax
L15:
    mov ecx, dword ptr [ebp - 4]
    test byte ptr [ecx + 28], 2
    je L16
    or byte ptr [esi + 10], 1
L16:
    mov eax, dword ptr [ecx + 40]
    cmp eax, ebx
    jne L20
    cmp dword ptr [ecx + 36], ebx
    jne L19
    test byte ptr [esi + 10], 1
    je L18
    lea eax, [esi + 16]
    push eax
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1008482B
L17:
    cmp eax, ebx
    jl L25
L18:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ecx + 32]
    cmp dword ptr [eax + 4], 9
    jne L21
    cmp dword ptr [eax + 20], 20
    jne L21
    push dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    push 0101102C8h
    push 000000B59h
    add eax, 24
    push ebx
    push eax
    call sub_10067EFE
    add esp, 20
    jmp L13
L19:
    cmp eax, ebx
    jne L20
    mov eax, dword ptr [ecx + 36]
L20:
    lea ecx, [esi + 16]
    push ecx
    push eax
    push dword ptr [ebp - 32]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_100847C0
    jmp L17
L21:
    lea eax, [esi + 12]
    push eax
    push ebx
    push 1
    push dword ptr [ecx + 32]
    push dword ptr [ebp + 8]
    call sub_100C40F9
    cmp eax, ebx
    jl L25
L22:
    mov edi, dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp + 8]
    push esi
    push 7
    push -1
    push edi
    call sub_100843E3
    cmp eax, ebx
    jl L25
    mov ecx, 01010F234h
    mov cx, word ptr [ecx]
    cmp cx, word ptr [edi]
    jne L23
    mov word ptr [esi + 4], bx
    jmp L24
L23:
    mov ecx, 01010F230h
    mov cx, word ptr [ecx]
    xor edx, edx
    cmp cx, word ptr [edi]
    setne dl
    inc edx
    mov word ptr [esi + 4], dx
L24:
    mov cx, word ptr [ebp + 20]
    mov word ptr [esi + 6], cx
    mov cx, word ptr [ebp - 8]
    mov word ptr [esi + 8], cx
L25:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_100845fb ENDP
END
