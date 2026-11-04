.686
.MODEL FLAT, C
EXTRN sub_1006509D:PROC
EXTRN sub_10065218:PROC
EXTRN sub_10065275:PROC
EXTRN sub_10065401:PROC
EXTRN sub_10065437:PROC
EXTRN sub_100654AC:PROC
EXTRN sub_1006551A:PROC
EXTRN sub_10065561:PROC
EXTRN sub_10067BB2:PROC
EXTRN sub_10067BE9:PROC
EXTRN sub_10067C47:PROC
EXTRN sub_10067D18:PROC
EXTRN sub_10067D55:PROC
EXTRN sub_10067D89:PROC
EXTRN sub_10067DBB:PROC
EXTRN sub_10067F43:PROC
EXTRN sub_100682F7:PROC
EXTRN sub_100687D1:PROC
EXTRN sub_10068847:PROC
EXTRN sub_10068BA4:PROC
EXTRN sub_10068D12:PROC
EXTRN sub_10082A30:PROC
EXTRN sub_10082AB9:PROC
EXTRN sub_10082AFA:PROC
EXTRN sub_10082C87:PROC
EXTRN sub_10082C8E:PROC
EXTRN sub_10082E1D:PROC
EXTRN sub_10082E50:PROC
EXTRN sub_10082F7D:PROC
.CODE
FUN_1006541e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 120
    and dword ptr [ebp - 28], 0
    and dword ptr [ebp - 12], 0
    cmp dword ptr [ebp + 12], 0
    push ebx
    push esi
    mov eax, ecx
    push edi
    mov dword ptr [ebp - 4], eax
    jne L5
    mov esi, dword ptr [ebp + 16]
    test esi, esi
    lea edi, [ebp - 12]
    je L3
L0:
    push 48
    call sub_1006509D
    test eax, eax
    je L1
    lea ecx, [esi + 16]
    push ecx
    mov ecx, eax
    call sub_10082AB9
    jmp L2
L1:
    xor eax, eax
L2:
    test eax, eax
    mov dword ptr [edi], eax
    je L65
    mov esi, dword ptr [esi + 12]
    test esi, esi
    lea edi, [eax + 12]
    jne L0
    mov eax, dword ptr [ebp - 4]
L3:
    mov ecx, dword ptr [eax + 100]
    mov dword ptr [edi], ecx
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax + 100], ecx
L4:
    xor eax, eax
    inc eax
    jmp L66
L5:
    mov edx, dword ptr [eax + 100]
    test edx, edx
    je L6
    add eax, 000000278h
    push 8
    lea esi, [edx + 16]
    pop ecx
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    cmp dword ptr [eax], 1
    mov dword ptr [ebp - 16], eax
    jne L65
    mov esi, dword ptr [ebp - 4]
    add esi, 000000280h
    push 2
    mov edi, 010195544h
    pop ecx
    xor eax, eax
    mov dword ptr [ebp - 24], esi
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L65
    mov eax, dword ptr [edx + 12]
    mov ebx, dword ptr [ebp - 4]
    mov dword ptr [ebx + 100], eax
    and dword ptr [edx + 12], 0
    jmp L11
L6:
    mov esi, dword ptr [eax + 00000026Ch]
    mov edx, dword ptr [esi]
    mov edi, dword ptr [esi + 4]
    cmp edx, edi
    jae L10
L7:
    mov cl, byte ptr [edx]
    cmp cl, 32
    je L8
    cmp cl, 9
    jl L9
    cmp cl, 13
    jg L9
L8:
    mov ecx, dword ptr [eax + 00000026Ch]
    inc edx
    cmp edx, dword ptr [ecx + 4]
    jb L7
L9:
    cmp edx, edi
    jae L10
    cmp byte ptr [edx], 40
    jne L65
    mov eax, dword ptr [ebp - 4]
L10:
    lea edi, [eax + 000000278h]
    push edi
    push dword ptr [eax + 000000298h]
    mov ecx, esi
    mov dword ptr [ebp - 16], edi
    call sub_100687D1
    test eax, eax
    jl L65
    cmp dword ptr [edi], 1
    jne L65
    mov esi, dword ptr [ebp - 4]
    add esi, 000000280h
    push 2
    mov edi, 010195544h
    pop ecx
    xor eax, eax
    mov dword ptr [ebp - 24], esi
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L65
    mov ebx, dword ptr [ebp - 4]
L11:
    and dword ptr [ebp - 20], 0
    lea eax, [ebp - 28]
    mov dword ptr [ebp - 8], 1
    mov dword ptr [ebp - 32], eax
L12:
    mov eax, dword ptr [ebx + 100]
    test eax, eax
    mov edi, dword ptr [ebp - 16]
    je L13
    push 8
    lea esi, [eax + 16]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [eax + 12]
    mov edi, dword ptr [ebp - 16]
    mov dword ptr [ebx + 100], ecx
    and dword ptr [eax + 12], 0
    jmp L14
L13:
    mov ecx, dword ptr [ebx + 00000026Ch]
    push edi
    push dword ptr [ebx + 000000298h]
    call sub_10068847
    test eax, eax
    jl L65
    mov ebx, dword ptr [ebp - 4]
L14:
    cmp dword ptr [edi], 13
    je L29
    mov esi, dword ptr [ebp - 32]
    cmp dword ptr [esi], 0
    jne L17
    push 20
    call sub_10065218
    test eax, eax
    je L15
    push 01010C874h
    push 0
    push 0
    mov ecx, eax
    call sub_10082A30
    jmp L16
L15:
    xor eax, eax
L16:
    test eax, eax
    mov dword ptr [esi], eax
    je L65
    mov ebx, dword ptr [ebp - 4]
    add eax, 8
    mov dword ptr [ebp - 20], eax
L17:
    cmp dword ptr [ebp - 8], 1
    jne L19
    cmp dword ptr [edi], 1
    jne L19
    mov eax, dword ptr [ebp - 24]
    mov al, byte ptr [eax]
    cmp al, 44
    je L18
    cmp al, 41
    jne L19
L18:
    cmp byte ptr [ebx + 000000281h], 0
    jne L19
    mov eax, dword ptr [esi]
    add eax, 12
    mov dword ptr [ebp - 32], eax
    jmp L22
L19:
    push 48
    call sub_10065275
    test eax, eax
    je L20
    push edi
    mov ecx, eax
    call sub_10082C8E
    jmp L21
L20:
    xor eax, eax
L21:
    test eax, eax
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [ecx], eax
    je L65
    mov ebx, dword ptr [ebp - 4]
    add eax, 12
    mov dword ptr [ebp - 20], eax
L22:
    cmp dword ptr [edi], 1
    jne L25
    cmp byte ptr [ebx + 000000281h], 0
    jne L25
    mov eax, dword ptr [ebp - 24]
    movsx eax, byte ptr [eax]
    sub eax, 40
    je L24
    dec eax
    je L23
    sub eax, 50
    je L24
    dec eax
    dec eax
    je L23
    sub eax, 30
    je L24
    dec eax
    dec eax
    jne L25
L23:
    dec dword ptr [ebp - 8]
    jmp L25
L24:
    inc dword ptr [ebp - 8]
L25:
    cmp dword ptr [ebp - 8], 0
    jne L12
    mov ecx, dword ptr [ebp + 12]
    mov eax, dword ptr [ebp - 28]
    xor edx, edx
L26:
    cmp eax, edx
    je L27
    cmp dword ptr [eax + 8], edx
    je L27
    mov ecx, dword ptr [ecx + 12]
    cmp ecx, edx
    mov eax, dword ptr [eax + 12]
    jne L26
L27:
    cmp ecx, edx
    jne L64
    cmp eax, edx
    jne L64
    lea eax, [ebp - 12]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [ebp + 16]
    cmp eax, edx
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 24], edx
    mov dword ptr [ebp - 32], eax
    je L56
L28:
    cmp dword ptr [ebp - 8], 0
    lea ebx, [eax + 16]
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 20], eax
    jne L31
    cmp dword ptr [ebp - 16], 0
    jne L31
    mov ecx, dword ptr [ebx]
    xor eax, eax
    inc eax
    cmp ecx, eax
    jne L30
    push 2
    mov edi, 01010C870h
    lea esi, [ebx + 8]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L30
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 8], eax
    jmp L55
L29:
    push 01010C844h
    push 0000005EBh
    push dword ptr [ebp + 8]
    add ebx, 24
    push ebx
    call sub_10067F43
    add esp, 16
    jmp L65
L30:
    cmp dword ptr [ebx], eax
    jne L31
    push 3
    mov edi, 01010C840h
    lea esi, [ebx + 8]
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L31
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 16], eax
    jmp L55
L31:
    cmp dword ptr [ebx], 9
    jne L42
    mov ecx, dword ptr [ebp - 28]
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [ebp + 16], ecx
L32:
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [eax + 24]
L33:
    mov dl, byte ptr [esi]
    mov cl, dl
    cmp dl, byte ptr [edi]
    jne L35
    test cl, cl
    je L34
    mov dl, byte ptr [esi + 1]
    mov cl, dl
    cmp dl, byte ptr [edi + 1]
    jne L35
    inc esi
    inc esi
    inc edi
    inc edi
    test cl, cl
    jne L33
L34:
    xor ecx, ecx
    jmp L36
L35:
    sbb ecx, ecx
    sbb ecx, -1
L36:
    test ecx, ecx
    je L37
    mov ecx, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 12]
    test eax, eax
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [ebp + 16], ecx
    jne L32
L37:
    test eax, eax
    je L42
    mov eax, dword ptr [ebp + 16]
    mov esi, dword ptr [eax + 8]
    jmp L41
L38:
    push 48
    call sub_10065401
    test eax, eax
    je L39
    lea ecx, [esi + 16]
    push ecx
    mov ecx, eax
    call sub_10082E1D
    jmp L40
L39:
    xor eax, eax
L40:
    test eax, eax
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx], eax
    je L65
    mov esi, dword ptr [esi + 12]
    add eax, 12
    mov dword ptr [ebp + 8], eax
L41:
    test esi, esi
    jne L38
    jmp L45
L42:
    push 48
    call sub_10065437
    test eax, eax
    je L43
    push ebx
    mov ecx, eax
    call sub_10082E50
    jmp L44
L43:
    xor eax, eax
L44:
    test eax, eax
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx], eax
    je L65
    add eax, 12
    mov dword ptr [ebp + 8], eax
L45:
    cmp dword ptr [ebp - 8], 0
    jne L46
    cmp dword ptr [ebp - 16], 0
    je L55
L46:
    mov ecx, dword ptr [ebp - 20]
    mov esi, dword ptr [ecx]
    xor edi, edi
    xor eax, eax
    inc edi
    jmp L49
L47:
    test eax, eax
    je L48
    cmp eax, dword ptr [esi + 40]
    je L48
    inc edi
L48:
    mov ecx, dword ptr [ebp - 4]
    push 0
    push dword ptr [esi + 44]
    push dword ptr [esi + 40]
    call sub_100654AC
    add edi, eax
    mov eax, dword ptr [esi + 40]
    add eax, dword ptr [esi + 44]
    mov esi, dword ptr [esi + 12]
L49:
    test esi, esi
    jne L47
    mov ecx, dword ptr [ebp - 4]
    push 1
    inc edi
    push edi
    call sub_10082AFA
    mov edi, eax
    test edi, edi
    je L65
    mov ecx, dword ptr [ebp - 20]
    xor eax, eax
    cmp dword ptr [ebp - 8], eax
    mov dword ptr [ebp + 16], 1
    sete bl
    dec bl
    and bl, 0000000FBh
    add bl, 39
    mov byte ptr [edi], bl
    mov esi, dword ptr [ecx]
    cmp esi, eax
    je L52
L50:
    test eax, eax
    je L51
    cmp eax, dword ptr [esi + 40]
    je L51
    mov eax, dword ptr [ebp + 16]
    inc dword ptr [ebp + 16]
    mov byte ptr [edi + eax], 32
L51:
    mov eax, dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    add eax, edi
    push eax
    push dword ptr [esi + 44]
    push dword ptr [esi + 40]
    call sub_1006551A
    add dword ptr [ebp + 16], eax
    mov eax, dword ptr [esi + 44]
    add eax, dword ptr [esi + 40]
    mov esi, dword ptr [esi + 12]
    test esi, esi
    jne L50
L52:
    mov esi, dword ptr [ebp + 16]
    lea ecx, [ebp - 120]
    mov byte ptr [edi + esi], bl
    call sub_10067BB2
    mov ebx, dword ptr [ebp - 4]
    lea eax, [ebx + 24]
    push eax
    mov eax, dword ptr [ebp - 24]
    push ebx
    push dword ptr [eax + 20]
    inc esi
    push dword ptr [eax + 16]
    lea ecx, [ebp - 120]
    push esi
    push edi
    call sub_10067BE9
    test eax, eax
    lea ecx, [ebp - 120]
    jl L63
    lea eax, [ebp - 64]
    push eax
    push dword ptr [ebx + 000000298h]
    call sub_10068BA4
    test eax, eax
    jl L62
    push 48
    call sub_10065561
    test eax, eax
    je L53
    lea ecx, [ebp - 64]
    push ecx
    mov ecx, eax
    call sub_10082F7D
    jmp L54
L53:
    xor eax, eax
L54:
    test eax, eax
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [ecx], eax
    lea ecx, [ebp - 120]
    je L63
    and dword ptr [ebp - 16], 0
    and dword ptr [ebp - 8], 0
    add eax, 12
    mov dword ptr [ebp + 8], eax
    call sub_10067C47
L55:
    mov eax, dword ptr [ebp - 32]
    mov eax, dword ptr [eax + 12]
    test eax, eax
    mov dword ptr [ebp - 32], eax
    jne L28
    mov ebx, dword ptr [ebp - 4]
    xor edx, edx
L56:
    cmp dword ptr [ebp - 12], edx
    lea eax, [ebp - 12]
    mov dword ptr [ebp + 8], eax
    je L61
L57:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [eax + 12]
    test ecx, ecx
    mov dword ptr [ebp + 12], eax
    je L58
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [ebp - 28], eax
    jmp L59
L58:
    and dword ptr [ebp - 28], 0
L59:
    mov eax, ecx
    neg eax
    sbb eax, eax
    lea edx, [ecx + 16]
    and eax, edx
    mov edx, dword ptr [ebp - 28]
    mov ebx, edx
    neg ebx
    sbb ebx, ebx
    lea esi, [edx + 16]
    and ebx, esi
    test ecx, ecx
    je L60
    test edx, edx
    je L60
    cmp dword ptr [eax], 1
    jne L60
    lea esi, [eax + 8]
    push 3
    mov edi, 01010C83Ch
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L60
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    add eax, 16
    mov eax, dword ptr [eax + 28]
    add eax, dword ptr [ebx + 28]
    push 1
    push eax
    mov dword ptr [ebp - 32], eax
    call sub_10082C87
    test eax, eax
    mov dword ptr [ebp + 16], eax
    je L65
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [eax + 44]
    mov esi, dword ptr [eax + 40]
    mov edi, dword ptr [ebp + 16]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    add eax, 16
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebx + 28]
    mov edi, dword ptr [eax + 28]
    mov esi, dword ptr [ebx + 24]
    add edi, dword ptr [ebp + 16]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    lea ecx, [ebp - 120]
    call sub_10067D18
    mov eax, dword ptr [ebp - 4]
    lea ecx, [eax + 24]
    push ecx
    push eax
    mov eax, dword ptr [ebp + 12]
    push dword ptr [eax + 36]
    add eax, 16
    push dword ptr [eax + 16]
    lea ecx, [ebp - 120]
    push dword ptr [ebp - 32]
    push dword ptr [ebp + 16]
    call sub_10067D55
    test eax, eax
    lea ecx, [ebp - 120]
    jl L63
    mov esi, dword ptr [ebp + 12]
    lea eax, [esi + 16]
    push eax
    mov eax, dword ptr [ebp - 4]
    push dword ptr [eax + 000000298h]
    call sub_10068D12
    test eax, eax
    jl L62
    mov eax, dword ptr [ebp - 28]
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [esi + 12], ecx
    and dword ptr [eax + 12], 0
    lea ecx, [ebp - 120]
    call sub_10067D89
L60:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    add eax, 12
    cmp dword ptr [eax], 0
    mov dword ptr [ebp + 8], eax
    jne L57
    mov ebx, dword ptr [ebp - 4]
L61:
    mov eax, dword ptr [ebx + 100]
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ebx + 100], eax
    jmp L4
L62:
    lea ecx, [ebp - 120]
L63:
    call sub_10067DBB
    jmp L65
L64:
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 8]
    add ebx, 24
    push 01010C810h
    push 0000005ECh
    push eax
    push ebx
    call sub_100682F7
    add esp, 20
L65:
    xor eax, eax
L66:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_1006541e ENDP
END
