.686
.MODEL FLAT, C
EXTRN sub_100638B8:PROC
EXTRN sub_10067E80:PROC
EXTRN sub_10067EFE:PROC
EXTRN sub_10084162:PROC
EXTRN sub_100843E3:PROC
EXTRN sub_100843FC:PROC
EXTRN sub_10084981:PROC
EXTRN sub_10084989:PROC
EXTRN sub_1008498B:PROC
EXTRN sub_100849CE:PROC
EXTRN sub_100849FA:PROC
EXTRN sub_10084A08:PROC
EXTRN sub_10084A20:PROC
EXTRN sub_10084A23:PROC
EXTRN sub_10084A37:PROC
EXTRN sub_10084A4E:PROC
EXTRN sub_10084A66:PROC
EXTRN sub_10084A6C:PROC
EXTRN sub_10084AC3:PROC
EXTRN sub_10084B02:PROC
EXTRN sub_10084B05:PROC
EXTRN sub_10084B32:PROC
EXTRN sub_10084B34:PROC
EXTRN sub_10084B63:PROC
EXTRN sub_10084B77:PROC
EXTRN sub_10084B7D:PROC
EXTRN sub_10084B8E:PROC
EXTRN sub_10084B90:PROC
EXTRN sub_10084BCE:PROC
EXTRN sub_10084C33:PROC
EXTRN sub_10084C36:PROC
EXTRN sub_10084C4B:PROC
EXTRN sub_10084C4E:PROC
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
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 92
    or or byte ptr [ebp + 27], 080h
    push push ebx
    push push esi
    mov mov eax, 01010F238h
    mov mov ax, word ptr [eax]
    push push edi
    mov mov edi, dword ptr [ebp + 16]
    xor xor ebx, ebx
    cmp cmp ax, word ptr [edi]
    mov mov dword ptr [ebp - 28], ecx
    mov mov dword ptr [ebp - 4], ebx
    je L0
    mov mov eax, 01010F234h
    mov mov ax, word ptr [eax]
    cmp cmp ax, word ptr [edi]
    je L1
    mov mov eax, 01010F230h
    mov mov ax, word ptr [eax]
    cmp cmp ax, word ptr [edi]
    je L2
    mov mov eax, 01010F22Ch
    mov mov ax, word ptr [eax]
    cmp cmp ax, word ptr [edi]
    je L3
    mov mov esi, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + 8]
    lea lea eax, [esi + 12]
    push push eax
    push push 6
    xor xor edi, edi
    inc inc edi
    push push 16
    lea lea eax, [ebp - 60]
    push push eax
    mov mov word ptr [ebp - 60], di
    mov mov word ptr [ebp - 58], 3
    mov mov word ptr [ebp - 56], di
    mov mov word ptr [ebp - 54], 4
    mov mov word ptr [ebp - 52], di
    mov mov word ptr [ebp - 50], bx
    mov mov dword ptr [ebp - 48], ebx
    call sub_10084162
    cmp cmp eax, ebx
    jl sub_100849CE
    mov mov dword ptr [ebp - 8], edi
    jmp sub_10084989
    push push ebx
    lea lea eax, [edi + 2]
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 84], eax
    lea lea eax, [ebp - 4]
    push push eax
    push push 2
    push push dword ptr [ecx + 4]
    mov mov ecx, dword ptr [ecx]
    push push ebx
    push push ebx
    lea lea eax, [ebp - 92]
    push push eax
    push push 1
    mov mov dword ptr [ebp - 92], 10
    mov mov dword ptr [ebp - 76], ebx
L0:
    mov mov dword ptr [ebp - 72], ebx
    call sub_1009E1C1
    lea lea eax, [ebp - 32]
    push push eax
    lea lea eax, [ebp - 8]
    push push eax
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax + 32]
    call sub_100843FC
    cmp cmp eax, ebx
    jl sub_10084A20
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp dword ptr [eax + 48], ebx
    mov mov esi, dword ptr [ebp + 12]
    je L24
    mov mov eax, dword ptr [eax + 48]
    cmp cmp eax, ebx
    mov mov dword ptr [ebp + 12], ebx
    mov mov dword ptr [ebp - 16], ebx
    mov mov dword ptr [ebp - 20], ebx
    mov mov dword ptr [ebp - 12], eax
    je L13
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 8]
    cmp cmp dword ptr [eax + 4], 17
    jne L10
    mov mov ecx, dword ptr [eax + 16]
    cmp cmp ecx, ebx
    jne L6
    xor xor ecx, ecx
    jmp L7
    mov mov ecx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [eax + 20]
    cmp cmp eax, ebx
    jne L8
    xor xor edi, edi
    jmp L9
    mov mov edi, dword ptr [eax + 24]
    cmp cmp ecx, ebx
    je L12
    lea lea eax, [ebp - 44]
    push push eax
    push push ebx
    push push ecx
    call sub_100638B8
    test test eax, eax
    jl L15
    cmp cmp edi, ebx
    je L16
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F76FE
    pop pop ecx
    mov mov ecx, dword ptr [ebp + 16]
    movsx movsx ecx, byte ptr [ecx]
    cmp cmp eax, ecx
    jne L17
    mov mov eax, dword ptr [ebp - 40]
    cmp cmp dword ptr [ebp + 24], eax
    jne L14
    mov mov dword ptr [ebp + 12], edi
    jmp L18
    mov mov ecx, eax
    xor xor ecx, dword ptr [ebp + 24]
    test test ecx, 0FFFF0000h
    jne L19
    test test ax, 0FFFFh
    jne L20
    mov mov dword ptr [ebp - 16], edi
    jmp L21
    cmp cmp edi, ebx
    je L22
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F773B
    pop pop ecx
    mov mov ecx, dword ptr [ebp + 16]
    movsx movsx ecx, byte ptr [ecx]
    cmp cmp eax, ecx
    jne L23
    mov mov dword ptr [ebp - 20], edi
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 12], eax
    jne L11
    cmp cmp dword ptr [ebp + 12], ebx
    mov mov edi, dword ptr [ebp + 16]
    jne sub_10084981
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, ebx
    mov mov dword ptr [ebp + 12], eax
    jne sub_1008498B
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, ebx
    mov mov dword ptr [ebp + 12], eax
    je sub_10084A23
    mov mov eax, dword ptr [ebp + 12]
    movsx movsx eax, byte ptr [eax]
    push push eax
    call sub_100F7786
    pop pop ecx
    movsx movsx ecx, byte ptr [edi]
    cmp cmp ecx, eax
    jne sub_10084A37
    mov mov edi, dword ptr [ebp + 12]
    lea lea eax, [edi + 1]
    mov mov dword ptr [ebp + 24], eax
    movsx movsx eax, byte ptr [eax]
    push push eax
    call sub_100F87E9
    test test eax, eax
    pop pop ecx
    je sub_10084A4E
    add add edi, 2
    jmp sub_100849FA
    inc inc edi
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F87FD
    test test eax, eax
    pop pop ecx
    jne sub_10084A08
    cmp cmp byte ptr [edi], bl
    jne sub_10084A66
    push push dword ptr [ebp + 24]
    call sub_100F7649
    cmp cmp eax, 01FFFh
    pop pop ecx
    jbe sub_10084A6C
    push push eax
    push push dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [eax + 4]
    push push 010110338h
    push push 0B56h
    add add eax, 24
    push push ebx
    push push eax
    call sub_10067E80
    add add esp, 24
    mov mov eax, 080004005h
    jmp sub_10084B8E
    shl shl eax, 2
    or or eax, 2
    or or word ptr [esi + 10], ax
    mov mov ecx, dword ptr [ebp - 4]
L8:
    test test byte ptr [ecx + 28], 2
    je sub_10084AC3
    or or byte ptr [esi + 10], 1
    mov mov eax, dword ptr [ecx + 40]
    cmp cmp eax, ebx
    jne sub_10084B34
    cmp cmp dword ptr [ecx + 36], ebx
    jne sub_10084B32
    test test byte ptr [esi + 10], 1
    je sub_10084B02
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call L5
    cmp cmp eax, ebx
    jl sub_10084BCE
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ecx + 32]
    cmp cmp dword ptr [eax + 4], 9
    jne sub_10084B77
    cmp cmp dword ptr [eax + 20], 20
    jne sub_10084B7D
    push push dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [eax + 4]
    push push 0101102C8h
    push push 0B59h
L11:
    add add eax, 24
    push push ebx
L12:
    push push eax
    call sub_10067EFE
    add add esp, 20
    jmp sub_10084B05
    cmp cmp eax, ebx
    jne sub_10084B90
    mov mov eax, dword ptr [ecx + 36]
    lea lea ecx, [esi + 16]
    push push ecx
    push push eax
L14:
    push push dword ptr [ebp - 32]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call L4
    jmp sub_10084B63
    lea lea eax, [esi + 12]
L15:
    push push eax
    push push ebx
    push push 1
L16:
    push push dword ptr [ecx + 32]
    push push dword ptr [ebp + 8]
    call sub_100C40F9
    cmp cmp eax, ebx
    jl sub_10084C36
    mov mov edi, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp + 8]
    push push esi
    push push 7
    push push -1
    push push edi
    call sub_100843E3
    cmp cmp eax, ebx
    jl sub_10084C4B
    mov mov ecx, 01010F234h
    mov mov cx, word ptr [ecx]
    cmp cmp cx, word ptr [edi]
    jne sub_10084C33
    mov mov word ptr [esi + 4], bx
    jmp sub_10084C4E
    mov mov ecx, 01010F230h
    mov mov cx, word ptr [ecx]
    xor xor edx, edx
    cmp cmp cx, word ptr [edi]
    setne setne dl
    inc inc edx
    mov mov word ptr [esi + 4], dx
    mov mov cx, word ptr [ebp + 20]
    mov mov word ptr [esi + 6], cx
    mov mov cx, word ptr [ebp - 8]
    mov mov word ptr [esi + 8], cx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_100845fb ENDP
END
