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
EXTRN sub_1009C5D3:PROC
EXTRN sub_1009C601:PROC
EXTRN sub_1009C602:PROC
EXTRN sub_1009C60C:PROC
EXTRN sub_1009C629:PROC
EXTRN sub_1009C67E:PROC
EXTRN sub_1009C699:PROC
EXTRN sub_1009C6A0:PROC
EXTRN sub_1009C6A6:PROC
EXTRN sub_1009C6CE:PROC
EXTRN sub_1009C6CF:PROC
EXTRN sub_1009C6E6:PROC
EXTRN sub_1009C733:PROC
EXTRN sub_1009C736:PROC
EXTRN sub_1009C73A:PROC
EXTRN sub_1009C73D:PROC
EXTRN sub_1009C774:PROC
EXTRN sub_1009C789:PROC
EXTRN sub_1009C78A:PROC
EXTRN sub_1009C78D:PROC
EXTRN sub_1009C78E:PROC
EXTRN sub_1009C794:PROC
EXTRN sub_1009C7A2:PROC
EXTRN sub_1009C7A7:PROC
EXTRN sub_1009C7AC:PROC
EXTRN sub_1009C7BF:PROC
EXTRN sub_1009C837:PROC
EXTRN sub_1009C84B:PROC
EXTRN sub_1009C88E:PROC
EXTRN sub_1009C8A1:PROC
EXTRN sub_1009C95A:PROC
EXTRN sub_1009C95E:PROC
EXTRN sub_1009C962:PROC
EXTRN sub_1009C965:PROC
EXTRN sub_1009C966:PROC
EXTRN sub_1009C970:PROC
EXTRN sub_1009C97C:PROC
EXTRN sub_1009C9C7:PROC
EXTRN sub_1009C9EF:PROC
.CODE
FUN_1009c137 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 52
    mov mov eax, dword ptr [ebp + 12]
    push push ebx
    push push esi
    xor xor esi, esi
    cmp cmp eax, esi
    push push edi
    mov mov dword ptr [ebp - 28], ecx
    je L2
    cmp cmp dword ptr [eax + 4], 3
    jne L3
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, esi
    je L4
    cmp cmp dword ptr [ecx + 4], 13
    jne L5
    mov mov edi, dword ptr [ecx + 16]
    lea lea ebx, [eax + 16]
    push push 80
    mov mov dword ptr [ebp - 52], edi
    mov mov dword ptr [ebp - 36], ebx
    call sub_100650BB
    cmp cmp eax, esi
    je L0
    push push ebx
    push push 1
    push push esi
    push push esi
    push push 23
    push push esi
    mov mov ecx, eax
    call sub_100832B5
    mov mov dword ptr [ebp - 8], eax
    jmp L1
    mov mov dword ptr [ebp - 8], esi
    cmp cmp dword ptr [ebp - 8], esi
    je L12
    cmp cmp edi, esi
    je L6
    mov mov eax, dword ptr [edi + 4]
    cmp cmp eax, 1
    jne L15
    mov mov dword ptr [ebp + 12], esi
    mov mov dword ptr [ebp - 24], edi
    mov mov eax, dword ptr [edi + 8]
    cmp cmp eax, esi
    je L9
    cmp cmp dword ptr [eax + 4], 6
    jne L11
    mov mov edi, dword ptr [eax + 24]
    mov mov eax, dword ptr [eax + 20]
    mov mov esi, dword ptr [eax + 24]
    mov mov eax, dword ptr [ebx + 8]
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne L8
    test test cl, cl
    je L8
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne L13
L0:
    inc inc eax
    inc inc eax
    inc inc esi
    inc inc esi
    test test cl, cl
    jne L7
    xor xor eax, eax
    jmp L14
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je L16
    push push dword ptr [edi + 32]
    mov mov ecx, dword ptr [ebp - 28]
    call sub_10099C25
    add add dword ptr [ebp + 12], eax
    mov mov edi, dword ptr [ebp - 24]
    xor xor esi, esi
    mov mov edi, dword ptr [edi + 12]
    cmp cmp edi, esi
    mov mov dword ptr [ebp - 24], edi
    jne L10
    mov mov eax, dword ptr [ebp - 36]
    push push dword ptr [eax + 8]
    push push 010114B00h
    push push 0BCAh
    push push eax
    push push dword ptr [ebp - 28]
    call sub_100995DE
    add add esp, 20
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    cmp cmp dword ptr [edi + 32], 0
    je L18
    mov mov ecx, dword ptr [edi + 32]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 16], eax
    je L17
    push push 64
    call sub_1006519A
    test test eax, eax
    je L20
    push push ebx
    push push dword ptr [ebp + 12]
L4:
    mov mov ecx, eax
    push push 2
    call sub_100834E0
    jmp L22
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 36], eax
    jmp sub_1009C6E6
    cmp cmp eax, 9
    jne L19
    mov mov eax, dword ptr [edi + 24]
    mov mov esi, dword ptr [edi + 32]
    mov mov ebx, dword ptr [ebx + 8]
    mov mov dword ptr [ebp - 40], eax
L6:
    mov mov eax, dword ptr [edi + 28]
    mov mov dword ptr [ebp - 32], eax
    and and esi, 0200h
    mov mov eax, ebx
    mov mov dword ptr [ebp - 48], esi
    lea lea ecx, [eax + 1]
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne L28
L13:
    sub sub eax, ecx
    lea lea ecx, [eax + ebx]
    mov mov al, byte ptr [ebx]
    cmp cmp al, 95
    push push 2
    mov mov dword ptr [ebp - 20], ecx
    pop pop edx
    je L36
L14:
    cmp cmp al, 96
    jle L21
    cmp cmp al, 98
    jle L32
    cmp cmp al, 103
    je L33
    cmp cmp al, 114
    je L35
    cmp cmp al, 118
    jle L23
    cmp cmp al, 122
    jg L24
    mov mov eax, dword ptr [edi + 16]
    test test eax, eax
    je L38
    cmp cmp eax, 1
    jne L25
    and and dword ptr [ebp - 16], 0
    jmp L45
    mov mov eax, dword ptr [edi + 16]
    test test eax, eax
    je L41
    cmp cmp eax, 1
L15:
    jne L26
    mov mov dword ptr [ebp - 16], 1
    jmp L48
    cmp cmp dword ptr [edi + 16], edx
    jne L27
    lea lea eax, [ebx + 1]
    cmp cmp eax, ecx
    jae L49
    cmp cmp byte ptr [eax], 109
    mov mov dword ptr [ebp - 16], 3
    je L50
    mov mov dword ptr [ebp - 16], edx
    mov mov eax, dword ptr [ebp - 8]
    and and dword ptr [ebp - 12], 0
    add add eax, 36
    cmp cmp ebx, ecx
    mov mov dword ptr [ebp - 24], eax
    jae sub_1009C73A
    mov mov edi, dword ptr [ebp + 8]
    mov mov esi, dword ptr [ebp + 8]
    lea lea eax, [ebx + 2]
    mov mov dword ptr [ebp + 12], eax
    lea lea eax, [ebx + 3]
    mov mov dword ptr [ebp - 4], eax
    cmp cmp dword ptr [ebp - 12], 4
    jae sub_1009C73D
    mov mov eax, dword ptr [ebp - 16]
    sub sub eax, 0
    je sub_1009C699
L18:
    dec dec eax
L19:
    je sub_1009C67E
    dec dec eax
    je sub_1009C629
    dec dec eax
    jne sub_1009C6CF
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp - 4], eax
    jae L29
    cmp cmp byte ptr [ebx], 95
    jne L30
    cmp cmp byte ptr [ebx + 1], 109
    jne L31
    mov mov eax, dword ptr [ebp + 12]
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 48
    jl L34
    cmp cmp cl, 57
L21:
    jg L37
    mov mov eax, dword ptr [ebp - 4]
    mov mov al, byte ptr [eax]
    cmp cmp al, 48
    jl L39
    cmp cmp al, 57
    jg L40
    add add dword ptr [ebp - 4], 4
    movsx movsx esi, cl
    movsx movsx edi, al
    sub sub esi, 48
    sub sub edi, 48
    add add ebx, 4
    add add dword ptr [ebp + 12], 4
    jmp sub_1009C736
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp + 12], eax
    jae L42
    cmp cmp byte ptr [ebx], 95
    jne L43
    mov mov cl, byte ptr [ebx + 1]
    cmp cmp cl, 49
    jl L44
    cmp cmp cl, 57
    jg L46
    mov mov eax, dword ptr [ebp + 12]
    mov mov al, byte ptr [eax]
    cmp cmp al, 49
    jl L47
    cmp cmp al, 57
L28:
    jg L48
    add add dword ptr [ebp - 4], 3
    movsx movsx esi, cl
    movsx movsx edi, al
    sub sub esi, 49
    sub sub edi, 49
    add add ebx, 3
    add add dword ptr [ebp + 12], 3
    jmp sub_1009C78E
    movsx movsx eax, byte ptr [ebx]
    sub sub eax, 97
    je sub_1009C78A
    dec dec eax
    je sub_1009C789
    sub sub eax, 5
    je sub_1009C774
    sub sub eax, 11
    jne L51
    xor xor edi, edi
    jmp sub_1009C7A2
    xor xor edi, edi
    inc inc edi
    jmp sub_1009C7A7
    movsx movsx eax, byte ptr [ebx]
    sub sub eax, 119
    je sub_1009C7AC
    dec dec eax
    je sub_1009C78D
    dec dec eax
    je sub_1009C794
    dec dec eax
    jne L52
    push push 2
    jmp sub_1009C7BF
    push push 3
    pop pop edi
L30:
    xor xor esi, esi
    inc inc ebx
    inc inc dword ptr [ebp - 4]
    inc inc dword ptr [ebp + 12]
    cmp cmp esi, dword ptr [ebp - 40]
    jae L53
L32:
    cmp cmp edi, dword ptr [ebp - 32]
    jae L54
    mov mov eax, esi
    imul imul eax, dword ptr [ebp - 32]
L37:
    add add eax, edi
    push push 20
    mov mov dword ptr [ebp - 44], eax
    call sub_100653E1
    test test eax, eax
    je sub_1009C837
    push push 010114AF8h
L40:
    push push 0
    push push 0
    mov mov ecx, eax
    call sub_10082BF9
    jmp sub_1009C84B
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 24]
    mov mov dword ptr [ecx], eax
    je sub_1009C5D3
    push push 64
    call sub_1006540D
    test test eax, eax
    je sub_1009C88E
    push push dword ptr [ebp - 36]
    mov mov ecx, eax
    push push dword ptr [ebp - 44]
    push push 2
L43:
    call sub_10083755
    jmp sub_1009C8A1
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 24]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [edx + 8], eax
    je sub_1009C601
    mov mov eax, dword ptr [ecx]
    add add eax, 12
    inc inc dword ptr [ebp - 12]
    cmp cmp ebx, dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 24], eax
    jb sub_1009C733
    cmp cmp ebx, dword ptr [ebp - 20]
    jb sub_1009C602
    cmp cmp dword ptr [ebp - 12], 4
    ja sub_1009C60C
    mov mov esi, dword ptr [ebp - 48]
    mov mov edi, dword ptr [ebp - 52]
L50:
    mov mov eax, dword ptr [ebp - 8]
    add add eax, 36
    mov mov eax, dword ptr [eax]
    jmp sub_1009C95A
    test test esi, esi
    jne sub_1009C962
    mov mov edx, dword ptr [eax + 12]
    mov mov ecx, edx
    test test ecx, ecx
    je sub_1009C965
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 24]
    mov mov ebx, dword ptr [ecx + 8]
    cmp cmp eax, dword ptr [ebx + 24]
    je sub_1009C970
    mov mov ecx, dword ptr [ecx + 12]
    test test ecx, ecx
    jne sub_1009C966
    jmp sub_1009C97C
    xor xor esi, esi
    inc inc esi
    mov mov eax, edx
    test test eax, eax
    jne sub_1009C95E
    push push 36
    call sub_1006549F
    test test eax, eax
    je sub_1009C9C7
    neg neg esi
    sbb sbb esi, esi
    xor xor ecx, ecx
    and and esi, 0200h
    cmp cmp dword ptr [ebp - 12], 1
    push push esi
    push push dword ptr [ebp - 12]
L54:
    setne setne cl
    push push 1
    push push dword ptr [edi + 20]
    push push ecx
    mov mov ecx, eax
    call sub_1008328F
    jmp sub_1009C9EF
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 16], eax
    test test eax, eax
    je sub_1009C6A6
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov esi, dword ptr [ebp - 8]
    mov mov dword ptr [esi + 32], eax
    je sub_1009C6A0
    mov mov ecx, dword ptr [ebp - 28]
    push push esi
    call sub_1009A9F2
    mov mov eax, esi
    jmp sub_1009C6CE
FUN_1009c137 ENDP
END
