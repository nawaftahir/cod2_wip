.686
.MODEL FLAT, C
EXTRN sub_100650BB:PROC
EXTRN sub_1006519A:PROC
EXTRN sub_100653E1:PROC
EXTRN sub_1006540D:PROC
EXTRN sub_1006549F:PROC
EXTRN sub_10082BF9:PROC
EXTRN sub_1008328F:PROC
EXTRN sub_100832B5:PROC
EXTRN sub_100834E0:PROC
EXTRN sub_10083755:PROC
EXTRN sub_100995DE:PROC
EXTRN sub_10099C25:PROC
EXTRN sub_1009A9F2:PROC
.CODE
FUN_1009c137 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 52
    mov eax, dword ptr [ebp + 12]
    push ebx
    push esi
    xor esi, esi
    cmp eax, esi
    push edi
    mov dword ptr [ebp - 28], ecx
    je L9
    cmp dword ptr [eax + 4], 3
    jne L9
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, esi
    je L9
    cmp dword ptr [ecx + 4], 13
    jne L9
    mov edi, dword ptr [ecx + 16]
    lea ebx, [eax + 16]
    push 80
    mov dword ptr [ebp - 52], edi
    mov dword ptr [ebp - 36], ebx
    call sub_100650BB
    cmp eax, esi
    je L0
    push ebx
    push 1
    push esi
    push esi
    push 23
    push esi
    mov ecx, eax
    call sub_100832B5
    mov dword ptr [ebp - 8], eax
    jmp L1
L0:
    mov dword ptr [ebp - 8], esi
L1:
    cmp dword ptr [ebp - 8], esi
    je L9
    cmp edi, esi
    je L8
    mov eax, dword ptr [edi + 4]
    cmp eax, 1
    jne L15
    mov dword ptr [ebp + 12], esi
    mov dword ptr [ebp - 24], edi
L2:
    mov eax, dword ptr [edi + 8]
    cmp eax, esi
    je L7
    cmp dword ptr [eax + 4], 6
    jne L7
    mov edi, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 20]
    mov esi, dword ptr [eax + 24]
    mov eax, dword ptr [ebx + 8]
L3:
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L5
    test cl, cl
    je L4
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L5
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L3
L4:
    xor eax, eax
    jmp L6
L5:
    sbb eax, eax
    sbb eax, -1
L6:
    test eax, eax
    je L11
    push dword ptr [edi + 32]
    mov ecx, dword ptr [ebp - 28]
    call sub_10099C25
    add dword ptr [ebp + 12], eax
    mov edi, dword ptr [ebp - 24]
    xor esi, esi
L7:
    mov edi, dword ptr [edi + 12]
    cmp edi, esi
    mov dword ptr [ebp - 24], edi
    jne L2
L8:
    mov eax, dword ptr [ebp - 36]
    push dword ptr [eax + 8]
    push 010114B00h
    push 000000BCAh
    push eax
    push dword ptr [ebp - 28]
    call sub_100995DE
    add esp, 20
L9:
    xor eax, eax
L10:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L11:
    cmp dword ptr [edi + 32], 0
    je L12
    mov ecx, dword ptr [edi + 32]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ecx + 16], eax
    je L9
L12:
    push 64
    call sub_1006519A
    test eax, eax
    je L13
    push ebx
    push dword ptr [ebp + 12]
    mov ecx, eax
    push 2
    call sub_100834E0
    jmp L14
L13:
    xor eax, eax
L14:
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ecx + 36], eax
    jmp L48
L15:
    cmp eax, 9
    jne L8
    mov eax, dword ptr [edi + 24]
    mov esi, dword ptr [edi + 32]
    mov ebx, dword ptr [ebx + 8]
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [edi + 28]
    mov dword ptr [ebp - 32], eax
    and esi, 000000200h
    mov eax, ebx
    mov dword ptr [ebp - 48], esi
    lea ecx, [eax + 1]
L16:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L16
    sub eax, ecx
    lea ecx, [eax + ebx]
    mov al, byte ptr [ebx]
    cmp al, 95
    push 2
    mov dword ptr [ebp - 20], ecx
    pop edx
    je L20
    cmp al, 96
    jle L8
    cmp al, 98
    jle L18
    cmp al, 103
    je L18
    cmp al, 114
    je L18
    cmp al, 118
    jle L8
    cmp al, 122
    jg L8
    mov eax, dword ptr [edi + 16]
    test eax, eax
    je L17
    cmp eax, 1
    jne L8
L17:
    and dword ptr [ebp - 16], 0
    jmp L22
L18:
    mov eax, dword ptr [edi + 16]
    test eax, eax
    je L19
    cmp eax, 1
    jne L8
L19:
    mov dword ptr [ebp - 16], 1
    jmp L22
L20:
    cmp dword ptr [edi + 16], edx
    jne L8
    lea eax, [ebx + 1]
    cmp eax, ecx
    jae L21
    cmp byte ptr [eax], 109
    mov dword ptr [ebp - 16], 3
    je L22
L21:
    mov dword ptr [ebp - 16], edx
L22:
    mov eax, dword ptr [ebp - 8]
    and dword ptr [ebp - 12], 0
    add eax, 36
    cmp ebx, ecx
    mov dword ptr [ebp - 24], eax
    jae L39
    mov edi, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 8]
    lea eax, [ebx + 2]
    mov dword ptr [ebp + 12], eax
    lea eax, [ebx + 3]
    mov dword ptr [ebp - 4], eax
L23:
    cmp dword ptr [ebp - 12], 4
    jae L38
    mov eax, dword ptr [ebp - 16]
    sub eax, 0
    je L28
    dec eax
    je L25
    dec eax
    je L24
    dec eax
    jne L33
    mov eax, dword ptr [ebp - 20]
    cmp dword ptr [ebp - 4], eax
    jae L8
    cmp byte ptr [ebx], 95
    jne L8
    cmp byte ptr [ebx + 1], 109
    jne L8
    mov eax, dword ptr [ebp + 12]
    mov cl, byte ptr [eax]
    cmp cl, 48
    jl L8
    cmp cl, 57
    jg L8
    mov eax, dword ptr [ebp - 4]
    mov al, byte ptr [eax]
    cmp al, 48
    jl L8
    cmp al, 57
    jg L8
    add dword ptr [ebp - 4], 4
    movsx esi, cl
    movsx edi, al
    sub esi, 48
    sub edi, 48
    add ebx, 4
    add dword ptr [ebp + 12], 4
    jmp L33
L24:
    mov eax, dword ptr [ebp - 20]
    cmp dword ptr [ebp + 12], eax
    jae L8
    cmp byte ptr [ebx], 95
    jne L8
    mov cl, byte ptr [ebx + 1]
    cmp cl, 49
    jl L8
    cmp cl, 57
    jg L8
    mov eax, dword ptr [ebp + 12]
    mov al, byte ptr [eax]
    cmp al, 49
    jl L8
    cmp al, 57
    jg L8
    add dword ptr [ebp - 4], 3
    movsx esi, cl
    movsx edi, al
    sub esi, 49
    sub edi, 49
    add ebx, 3
    add dword ptr [ebp + 12], 3
    jmp L33
L25:
    movsx eax, byte ptr [ebx]
    sub eax, 97
    je L30
    dec eax
    je L29
    sub eax, 5
    je L27
    sub eax, 11
    jne L8
L26:
    xor edi, edi
    jmp L32
L27:
    xor edi, edi
    inc edi
    jmp L32
L28:
    movsx eax, byte ptr [ebx]
    sub eax, 119
    je L30
    dec eax
    je L26
    dec eax
    je L27
    dec eax
    jne L8
L29:
    push 2
    jmp L31
L30:
    push 3
L31:
    pop edi
L32:
    xor esi, esi
    inc ebx
    inc dword ptr [ebp - 4]
    inc dword ptr [ebp + 12]
L33:
    cmp esi, dword ptr [ebp - 40]
    jae L8
    cmp edi, dword ptr [ebp - 32]
    jae L8
    mov eax, esi
    imul eax, dword ptr [ebp - 32]
    add eax, edi
    push 20
    mov dword ptr [ebp - 44], eax
    call sub_100653E1
    test eax, eax
    je L34
    push 010114AF8h
    push 0
    push 0
    mov ecx, eax
    call sub_10082BF9
    jmp L35
L34:
    xor eax, eax
L35:
    test eax, eax
    mov ecx, dword ptr [ebp - 24]
    mov dword ptr [ecx], eax
    je L9
    push 64
    call sub_1006540D
    test eax, eax
    je L36
    push dword ptr [ebp - 36]
    mov ecx, eax
    push dword ptr [ebp - 44]
    push 2
    call sub_10083755
    jmp L37
L36:
    xor eax, eax
L37:
    test eax, eax
    mov ecx, dword ptr [ebp - 24]
    mov edx, dword ptr [ecx]
    mov dword ptr [edx + 8], eax
    je L9
    mov eax, dword ptr [ecx]
    add eax, 12
    inc dword ptr [ebp - 12]
    cmp ebx, dword ptr [ebp - 20]
    mov dword ptr [ebp - 24], eax
    jb L23
L38:
    cmp ebx, dword ptr [ebp - 20]
    jb L8
    cmp dword ptr [ebp - 12], 4
    ja L8
    mov esi, dword ptr [ebp - 48]
    mov edi, dword ptr [ebp - 52]
L39:
    mov eax, dword ptr [ebp - 8]
    add eax, 36
    mov eax, dword ptr [eax]
    jmp L44
L40:
    test esi, esi
    jne L45
    mov edx, dword ptr [eax + 12]
    mov ecx, edx
    test ecx, ecx
    je L43
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 24]
L41:
    mov ebx, dword ptr [ecx + 8]
    cmp eax, dword ptr [ebx + 24]
    je L42
    mov ecx, dword ptr [ecx + 12]
    test ecx, ecx
    jne L41
    jmp L43
L42:
    xor esi, esi
    inc esi
L43:
    mov eax, edx
L44:
    test eax, eax
    jne L40
L45:
    push 36
    call sub_1006549F
    test eax, eax
    je L46
    neg esi
    sbb esi, esi
    xor ecx, ecx
    and esi, 000000200h
    cmp dword ptr [ebp - 12], 1
    push esi
    push dword ptr [ebp - 12]
    setne cl
    push 1
    push dword ptr [edi + 20]
    push ecx
    mov ecx, eax
    call sub_1008328F
    jmp L47
L46:
    xor eax, eax
L47:
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ecx + 16], eax
L48:
    test eax, eax
    je L9
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov esi, dword ptr [ebp - 8]
    mov dword ptr [esi + 32], eax
    je L8
    mov ecx, dword ptr [ebp - 28]
    push esi
    call sub_1009A9F2
    mov eax, esi
    jmp L10
FUN_1009c137 ENDP
END
